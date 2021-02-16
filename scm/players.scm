(post "clip-player.scm")

(load-from-max "process-helpers.scm")

;; a csound score style note player
; assumes time and dur are ticks, pitch is midi note num, pfields are 0-127
(define (play-note time dur vel pitch . pfields)
  ;(post "play-note: " time dur vel pitch pfields)
  (let ((note-num pitch)
        (dur-ms (ticks->ms dur)))
    (delay-t time (lambda x (out 0 (list note-num vel dur-ms)))))
)


; a base class for self-scheduling objects, 'players'
(define (player . init-args)
  (post "player constructor running")
  (post "init-args:" init-args)
 
  ; internal vars, private to the scope of the clip-player
  (let ((playing #f)            ; flag for if on 
        (cb-handle #f)          ; handle for self-scheduling
        (init #f)               ; stub for optional init method
        (delay-interval 480)    ; interval for the next delay
        (state (hash-table)))   ; hash-tab for play state

    ;; save this let's environment as env to allow external access 
    (define env (curlet))
    
    ; loop through the init-args keyword arg list, which is an assoc list of sym/value to set
    ; this allows setting any instance vars from keyword list to constructor
    (define (set-init-args)
      (let init-args-loop ((args init-args))
        (if (not (null? args))
          (begin 
            (if (keyword? (car args))
              ; keywords go into the state dict
              (set! (state (car args)) (cadr args))
              ; symbol args go into the private let
              (varlet env (car args) (cadr args)))
            (init-args-loop (cddr args)))))
    )
    (set-init-args)

    ;* end base constructor logic (until we return the lambda at the bottom)   

    ;* METHODS
    
    ; get value of an internal var from local env, allowing external access
    ; we use let ref so it will look up the inheritance chain too
    (define (get sym) 
      (let-ref env sym))

    ; set an internal variable
    (define (set sym val) 
      ; TODO: fix this according to Bill's input
      ; set the value in the env and then return value set
      (if (keyword? sym)
        (set! (state sym))
        (varlet env sym val))
        ; return value set rather than the whole let
        val)

    ; reset the process
    (define (reset)
      ; do whatever the implementation should do with state for a reset
      (post "base-player 'reset")
      #f )

    ; cancel next scheduled iteration and stop playback
    ; todo: what about tree recursion??
    (define (stop)
      (cancel-delay cb-handle)
      (set! playing #f))

    ; reset state to beginning and start playback
    (define (start)
      (reset)
      (set! playing #t)
      (run))

    ; start without a reset
    (define (resume)
      (set! playing #t)
      (run))

    ; run an iteration and schedule the next one
    ; should be filled in by a derived class
    (define (run)
      (post "base-player run") 
      ;; if playing: schedule next iteration after delay-interval
      (if playing 
        (set! cb-handle (delay-t delay-interval run))))
 
    ; msg dispatcher, calls internal method matching symbol in msg
    (lambda (msg . args)
      (apply (eval msg) args)) 
)); end base-player let and define


;; loop player is a derived player that plays a certain number of iterations
;; and then stops, or restarts if in loop mode
(define (loop-player . init-args)
  ; instantiate parent function, and set env to it's env
  (letrec* ((parent (apply player init-args)) (self (parent 'get 'env)))
    (varlet self
      ; add default instance vars here as symbol/value pairs
      ; args passed in as init-args can override these
      'seq-len        16 
      'looping        #t
      'loop-times     4
      'loop-iter      0
      'loop-len       4
      'loop-step      0     ; current step within the loop
      'step-len       480   ; default step length in ticks
      'seq-data       #f
      'outlet         0
      ; order of params when passed a sequence to update a shared index point
      'param-order  (vector :len :gate :dur :note :vel)
    )
    (with-let self

      ; do programmatic house keeping in here, gets run as last thing in building
      ; this runs *after* any passed in args are saved
      (define (init)
        (post "loop-player init")
        (set-init-args)
        (set! seq-data (hash-table
          :len  (make-vector seq-len step-len)
          :gate (make-vector seq-len 1)
          :dur  (make-vector seq-len 480)
          :note (make-vector seq-len 0)
          :vel  (make-vector seq-len 0)
        ))
        ;(post "seq-data: " seq-data)
      )

      (define (play-note time-offset dur note-num vel)
        (post "loop-player::play-note" dur note-num vel)
        (out outlet (list note-num vel dur)))

      ; add methods here as symbol/value pairs
      (define (start)
        (post "loop-player::start")
        (set! loop-step 0)
        (set! playing #t)
        (run))

      ; update a param sequence
      (define (set-pseq index data)
        (post "loop-player::set-pseq param:" param "index:" index "data:" data)
        (if (sequence? data)
          (for-each (lambda (i v) (set! ((seq-data param) i) v)) 
            (range index (+ index (length data))) data)
          ; else updating only one point
          (set! ((seq-data param) index) data))) 

      ; update sequence data at *one* shared index point for all params 
      (define (set-seq-point index vals)
        (post "set-seq-items, index:" index "vals:" vals)
        (for-each
          (lambda (param param-index)
            (set! ((seq-data param) index) (vals param-index)))
          param-order (range 0 (length param-order)))
        '())
    
      ; update sequence data for all params (from list of lists)
      (define (set-seq index data)
        (if (sequence? (data 0))
          ; if data is nested sequence
          (for-each
            (lambda (i v) (set-seq-point i (data i))) 
            (range index (+ index (length data))) data)
          ; if data is one point
          (set-seq-point index data))
        '())

      ; hook for each top of loop, can mutate state in vars
      (define (loop-top)
        (post "loop-top, loop-iter:" loop-iter)
        (let ((new-loop-len (+ 2 (random 3))))
          (post "... next loop-len:" new-loop-len)
          (set! loop-len new-loop-len)))

      ; run one step
      (define player::run run) ; save previous run method to allow calling
      (define (run)
        (post "loop-player run, loop-step: " loop-step)    
        ; if top of loop, call the loop-top function
        (if (= loop-iter 0)
          (loop-top))

        (let ((event-len  ((seq-data :len)  loop-step))
              (gate       ((seq-data :gate) loop-step))
              (dur        ((seq-data :dur)  loop-step))
              (note-num   ((seq-data :note) loop-step))
              (vel        ((seq-data :vel)  loop-step))
              (time-offset 0))
 
          (if (and (= 1 gate) (> dur 0))
            (play-note time-offset dur note-num vel))
          
          ; update loop-step counter for next pass
          (set! loop-step 
            (if (< loop-step (- loop-len 1)) (+ 1 loop-step) 0))
          ; if playing, schedule next iteration
          (if playing
            (set! cb-handle (delay-t event-len run)))
       '() 
      ))

      ; call the init method
      (init)
    )
    ;; the lambda function returned just delegates to inner process
    (lambda args (apply parent args)))
); end clip-player





(post "... clip-player.scm LOADED")
