
(load-from-max "players.scm")
(load-from-max "process-helpers.scm")
(load-from-max "event-score.scm")

(define (stop-all)
  (l1a 'stop)
)

(begin
  (define p1 (list
    '(240 1 100 60 60) 
    '(240 1 100 65 60) 
    '(240 1 100 67 60) 
    '(240 1 100 70 60) 
  ))
  (define l1a (loop-player 'loop-len 4 'outlet 0 'transpose 0))
  (l1a 'set-seq 0 p1)
  ;(l1a 'ramp 0 1920 1 (lambda(x)(l1a 'set 'vel-factor x)))
  (l1a 'ramp 0 1920 1 '(begin (set! vel-factor x) (set! transpose (* x 12))))
)


