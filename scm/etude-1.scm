(post "etude-1.scm loading")

(load-from-max "players.scm")
(load-from-max "process-helpers.scm")
(load-from-max "event-score.scm")

(define l1a (loop-player 'loop-len 5 'outlet 0))
(l1a 'set-seq 0 (list
  '(480 1 480 60 90) 
  '(720 1 480 67 90) 
  '(480 1 240 70 90) 
  '(240 1 360 64 90) 
  '(480 1 240 72 90) 
))

(define l1b (loop-player 'loop-len 4 'outlet 1 'loop-top 2))
(l1b 'set-seq 0 (list
  '(480 1 480 60 90) 
  '(720 1 480 67 90) 
  '(480 1 240 70 90) 
  '(240 1 360 64 90) 
  '(480 1 240 72 90) 
))

(define l3 (loop-player 'loop-len 12 'outlet 1 'transpose 0))
(l3 'set-seq 0 (list
  '(720 1 240 79 90) 
  '(720 1 240 74 90) 
  '(720 1 240 69 90) 
  '(720 1 240 79 90) 
  '(480 1 240 74 90) 
  '(480 1 240 69 90) 
  '(720 1 240 79 90) 
  '(720 1 240 74 90) 
  '(720 1 240 67 90) 
  '(720 1 240 79 90) 
  '(480 1 240 74 90) 
  '(480 1 240 67 90) 
))


(define s1 (event-score (hash-table :bbt (list 8 5 480))
  :1:1:0    (list '(l1a 'start))
  :5:1:0    (list '(l1b 'start))
  :9:1:0    (list '(l1b 'stop) '(l3 'start))
  ;:6:3:0    (list '(l3 'stop))
  ;:9:1:0    (list '(l3 'start))
  ;:10:4:0   (list '(l3 'stop))
  ;:1:1:0 '(l3 'start)
))

(define (stop-all)
  (l1a 'stop)
  (l1b 'stop)
  (l3 'stop)
  (s1 'stop)
)


(post "etude-1.scm DONE")
