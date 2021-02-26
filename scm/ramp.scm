(post "ramp.scm")

; example of calling ramp to update a global var, g1
;(define r1 (ramp 0 480 1 (lambda(x)(set! g1 x)))

; for now just making resolution lock to 1 tick
(define (ramp start-val duration end-val callback)
  ; args is a set of time events
  (let ((ramp-start start-val)
        (ramp-end end-val)
        (ramp-dur duration)
        (tick-index 0)
        (cb-handle #f)
        (playing #f)
        (ramp-val #f)
        ; save callbacks as a list whether created with one or list of callbacks
        (ramp-callbacks (if (list? callback) callback (list callback)))
        ; I don't think I need to capture start-val etc explicitly??
        )

    ;; save this let's environment as env to allow external access to vars
    (define env (curlet))
    (define (get-env) (curlet))

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

    (define (tick)
      ;(post "ramp tick, index:" tick-index "val:" ramp-val)
      ; call all the callback list with the current value
      ; we call before checking values in order to get callbacks on both start and end val
      (for-each (lambda(cb)(cb ramp-val)) ramp-callbacks)
      (if (= tick-index duration)
        (stop))
      ; increment the value according to start, end, and dur
      (let* ((ticks-remaining (- ramp-dur tick-index))
             (value-remaining (- ramp-end ramp-val))
             (value-incr (if (not (= value-remaining 0)) 
                            (/ value-remaining ticks-remaining)
                            0)))
        (set! ramp-val (+ ramp-val value-incr))
        (set! tick-index (+ 1 tick-index)) 
        ; schedule next tick
        (if (and playing (<= tick-index ramp-dur))
          (set! cb-handle (delay-t 1 tick)))))

    ; stop doesn't reset the value, it should stay parked
    (define (stop)
      ;(post "ramp stop")
      (cancel-delay cb-handle)
      (set! playing #f)
    )

    (define (start)
      ;(post "ramp start")
      (set! tick-index 0)
      (set! ramp-val ramp-start)
      (set! playing #t)
      (tick))

    (define (cue location)
      ;(post "ramp cue")
      (set! tick-index location))

    ; msg dispatcher, calls internal method matching symbol in msg
    (lambda (msg . args)
      (apply (eval msg) args)))
)

(post "... ramp.scm DONE")

