(post "clip-player.scm")

(load-from-max "process-helpers.scm")
(load-from-max "event-score.scm")

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
      'loop-reps      #f    ; if not #f, play only this many times, then stop and reset
      'replay-after   #f    ; time after which to start all over
      'loop-iter      0
      'loop-len       0     ; loop-len of 0 means take from length of seq 
      'loop-top       0
      'loop-step      0     ; current step within the loop
      'step-len       480   ; default step length in ticks
      'seq-data       #f
      'transpose      0
      'vel-factor     1     ; velocity mult factor for ouput
      'dur-factor     1     ; duration mult factor for output 
      'time-factor    1     ; time multiplier (event times, not note dur)
      'outlet         0
      'envelopes      (hash-table)  ; will be gensym handle for key, env-hash for value
      'abs-ticks      0     ; counter of absolute tick time, for automation envelopes
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
        ;(post "loop-player::play-note" dur note-num vel)
        (let ((transposed-note (+ note-num transpose))
              (vel-out (* vel vel-factor))
              (dur-out (* dur dur-factor)))
          (out outlet (list transposed-note vel-out dur-out))))

      ; add methods here as symbol/value pairs
      (define (start)
        ;(post "loop-player::start")
        (cancel-delay cb-handle)
        (set! loop-step 0)
        (set! loop-iter 0)
        (set! abs-ticks 0)
        (set! playing #t)
        (run))
    
      (define (stop)
        (cancel-delay cb-handle)
        (set! playing #f))

      (define (pause)
        (cancel-delay cb-handle)
        (set! playing #f))

      (define (reset)
        (set! loop-iter 0)
        (set! loop-step 0))

      (define (set-pseq index data)
        "update a param sequence with one ptrack data point"
        ;(post "loop-player::set-pseq param:" param "index:" index "data:" data)
        (if (sequence? data)
          (for-each (lambda (i v) (set! ((seq-data param) i) v)) 
            (range index (+ index (length data))) data)
          ; else updating only one point
          (set! ((seq-data param) index) data))) 

      (define (set-seq-point index vals)
        "update sequence data at *one* shared index point for all params"
        ;(post "set-seq-items, index:" index "vals:" vals)
        (for-each
          (lambda (param param-index)
            (set! ((seq-data param) index) (vals param-index)))
          param-order (range 0 (length param-order)))
        '())
    
      (define (set-seq index data)
        "update sequence data points for all params from list of lists"
        (if (sequence? (data 0))
          ; if data is nested sequence
          (for-each
            (lambda (i v) (set-seq-point i (data i))) 
            (range index (+ index (length data))) data)
          ; if data is one point
          (set-seq-point index data))
        '())

      ; hook for each top of loop, can mutate state in vars
      (define (loop-start)
        ;(post "loop-start, loop-iter:" loop-iter "loop-reps:" loop-reps)
        '())

      ; called on last step of loop, after playback, before scheduling next step
      (define (loop-end)
        ;(post "loop-end, loop-iter:" loop-iter)
        (inc! loop-iter)
        (if (and loop-reps (= loop-iter loop-reps))
          (loop-reps-end))
      )

      ; callback when loop-reps are done, can be used to reschedule later
      (define (loop-reps-end)
        ;(post "loop-reps-end")
        (stop)
        (if replay-after
          (set! cb-handle (delay-t replay-after start)))
      )

      (define (ramp start-val dur end-val env-cb)
        "start a ramp from start to end, running from now until now + dur"
        ;(post "loop-player::ramp")
        (let ((env-hash (hash-table   :start-val start-val  :start-ticks abs-ticks  :dur dur  :end-val end-val  :callback env-cb))
              (env-handle (gensym)))
          (set! (envelopes env-handle) env-hash)))
     
      ; function to process any running ramp envelopes 
      (define (process-envelope envl-pair)
        ;(post "process-envelope, abs-ticks:" abs-ticks)
        ; calculate where the envlelope should be, according to the abs-tick counter 
        (let* ((envl-handle   (car envl-pair))
               (envl-hash     (cdr envl-pair))
               (dur           (envl-hash :dur))  
               (start-ticks   (envl-hash :start-ticks))
               (start         (envl-hash :start-val)) 
               (end           (envl-hash :end-val))
               (envl-val      (+ start (* (/ (- abs-ticks start-ticks) dur) (- end start))))
               (envl-cb       (envl-hash :callback)))
          ;(post "envl-val:" envl-val)
          ; call the callback function with the envl value
          (cond 
            ((procedure? envl-cb)
              (envl-cb envl-val))
            ; else we treat it as a list that is the body of a lambda, where x is the env-val
            ; ie. '(set! vel-factor x) -> ((lambda(x)(set! vel-factor x)) envl-val)
            ((list? envl-cb)
              ((lambda (x)(eval envl-cb)) envl-val))
            (else #f))
          ; if we have reached the end of the ramp, we chuck the envl
          (if (= envl-val end)
            (set! (envelopes envl-handle) #f)))
      )
        

      ; run one step
      (define player::run run) ; save previous run method to allow calling
      (define (run)
        ;(post "loop-player run, loop-step: " loop-step "abs-ticks:" abs-ticks)    
        ; if top of loop, call the loop-top function
        (if (= loop-step 0)
          (loop-start))

        ; run any automation envelopes
        (for-each process-envelope envelopes)

        (let* (
              (loop-len  (if (= 0 loop-len) (length seq-data) loop-len))
              (step      (+ loop-top (modulo loop-step loop-len)))
              (event-len  (* ((seq-data :len) step) time-factor))
              (gate       ((seq-data :gate) step))
              (dur        (* ((seq-data :dur) step) time-factor))
              (note-num   ((seq-data :note) step))
              (vel        ((seq-data :vel)  step))
              (time-offset 0))
 
          (if (and (= 1 gate) (> dur 0))
            (play-note time-offset dur note-num vel))
         
          ; if this was the last step, call loop-end
          (if (= loop-step (dec loop-len))
            (loop-end))
          ; update loop-step counter for next pass (rolls over to zero at end)
          (set! loop-step 
            (if (< loop-step (- loop-len 1)) (+ 1 loop-step) 0))

          ; if playing, schedule next iteration
          (if playing 
            (begin
              (set! cb-handle (delay-t event-len run))
              (set! abs-ticks (+ abs-ticks event-len))))
       '()) 
      )

      ; call the init method
      (init)
    )
    ;; the lambda function returned just delegates to inner process
    (lambda args (apply parent args)))
); end clip-player





(post "... players-player.scm LOADED")
