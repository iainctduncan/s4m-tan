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
    (let init-args-loop ((args init-args))
      (if (not (null? args))
        (begin 
          (if (keyword? (car args))
            ; keywords go into the state dict
            (set! (state (car args)) (cadr args))
            ; symbol args go into the private let
            (varlet env (car args) (cadr args)))
          (init-args-loop (cddr args)))))

    ;* if there is a an 'init method, call it (allows passing in init procs at build time)
    (if init
      (init))
    ;* end constructor logic (until we return the lambda at the bottom)   

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


;; example of derived player - not the prettiest, but works and delegates to parent
(define (derived-player . init-args)
  ; instantiate parent function, and set env to it's env
  (letrec* ((parent (apply player init-args)) (env (parent 'get 'env)))
    (varlet env
      ; instance vars here as symbol value pairs
      'looping #t
    )
    (with-let env
      ; add method definitions to the parent env here
      (define (run)
        (post "derived-player run" (state :data))    
        (post "looping: " looping)
        (if playing
          (set! cb-handle (delay-t delay-interval run))))
    )
    ;; the lambda function returned just delegates to inner process
    (lambda args (apply parent args))
)); end derived-player


;; clip player is a derived player that plays a certain number of iterations
;; and then stops, or restarts if in loop mode
(define (loop-player . init-args)
  ; instantiate parent function, and set env to it's env
  (letrec* ((parent (apply player init-args)) (env (parent 'get 'env)))
    (varlet env
      ; add instance vars here as symbol/value pairs
      'looping #t
      'iterations 4
      'iter 0
    )
    (with-let env
      ; add methods here as symbol/value pairs

      (define (start)
        (set! iter 0)
        (set! playing #t)
        (run))
 
      (define (run)
        (post "clip-player run, iter: " iter)    
        (cond
          ((and playing (< iter (- iterations 1)))
            (begin 
              (set! iter (+ 1 iter))
              (set! cb-handle (delay-t time run))))
          ((and playing looping (= iter (- iterations 1)))
            (begin 
              (set! iter 0)
              (set! cb-handle (delay-t time run))))
          (else #f)))
          
    )
    ;; the lambda function returned just delegates to inner process
    (lambda args (apply parent args)))
); end clip-player





;; example of derived repeater
(define (child-repeater . init-args)
  (letrec* ((parent (apply clip-player init-args)) (env (parent 'get-env)))
    ; definitions here are added to the parent env
    (with-let env
      (define foo (lambda () (post "foo!")))
      (define time 100)
      (define seq (list 48 50 52 53 54))
    )
    ;; actual function returned just delegates to inner process
    (lambda args (apply parent args))
)); end my proc




;; grandchild repeater
(define (grand-child-repeater)
  (letrec* ((parent (clip-player)) (env (parent 'get-env)))
    (with-let env
      (define foo (lambda () (post "grand child foo!")))
    )
    (lambda args (apply parent args))
)); end my proc

;(define p (clip-player ))
;(define mp (child-repeater))
;(define gp (grand-child-repeater))





(post "... clip-player.scm LOADED")
