(post "etude.scm")
(load-from-max "instruments.scm")


(define r1 (make-repeater))
(define r2 (make-repeater))
(define r3 (make-repeater))
(define r4 (make-repeater))

(r1 'play)
; receive an lfo from Max, val is -1 to 1
(define (lfo-1 val)
  ;(post "lfo-1:" val)
  (letrec* ((norm-val (+ 0.5 val))
            (time-incr (* norm-val 60))
            (time-val (+ time-incr 120)))
    ;(post "time: " time-val)
    (r1 'set 'time time-val)  
))

(define (play)
  (post "PLAY") 
  (begin 
    (r1 'start) 
    (r2 'start) 
    (r3 'start)
  )
)


