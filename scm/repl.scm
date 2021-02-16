
(define c (clip-player))

(c 'get 'state)


(c 'get 'state)
((c 'get-state) :data)
(set! ((c 'get 'state) :data) '(3 4 5))

(define e (c 'get 'env))

(c 'set 'foo 'bar)

(define b (player-base :data '(1 2 3)))
(b 'start)
(b 'stop)


(define d (derived-player :data '(4 5 6)))
(d 'run)
(d 'start)
(d 'stop)

(define l #f)

(begin 
  (define c (loop-player 'seq-len 4))
  ;(c 'set-par :len 3 '(111 222))
  (c 'set-seq 0 '((480 1 240 60 90) (240 1 120 48 127) (480 1 440 67 90) (240 1 240 60 90))) 
)

(c 'get 'seq-data)
(c 'run)
(c 'start)
(c 'stop)
(c 'set 'looping #f)
(make-vector 4 0)

(sequence? 1)

