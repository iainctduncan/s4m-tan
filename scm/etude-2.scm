(post "etude-2.scm loading")

(load-from-max "players.scm")
(load-from-max "process-helpers.scm")
(load-from-max "event-score.scm")
(load-from-max "ramp.scm")

(define p1 (list
  '(240 1 100 60 60) 
  '(240 1 100 65 60) 
  '(240 1 100 67 60) 
  '(240 1 100 70 60) 
  '(240 1 100 65 60) 
  '(240 1 100 67 60) 
  '(240 1 100 70 60) 
  '(240 1 100 72 60) 
))
(define p1-rev (reverse p1))

(define l1a (loop-player 'loop-len 8 'outlet 0 'transpose 0))
(l1a 'set-seq 0 p1)

(define l1b (loop-player 'outlet 1 'transpose 0
  'loop-len 8 'loop-top 2 'time-factor .75)) 
(l1b 'set-seq 0 p1)

(define l1c (loop-player 'outlet 1 'transpose 7 'vel-factor 0.8
  'loop-len 8 'loop-top 2 'loop-reps 2 'replay-after (* 480 10) 'time-factor .666)) 
(l1c 'set-seq 0 p1)

(define l1d (loop-player 'outlet 0 'transpose 14 'vel-factor 0.8
  'loop-len 8 'loop-top 4 'time-factor 1.333)) 
(l1d 'set-seq 0 p1)

(define l1e (loop-player 'outlet 0 'transpose 2 'vel-factor 1.2
  'loop-len 10 'loop-top 2 'time-factor 1)) 
(l1e 'set-seq 0 p1)


(define r1 (ramp 0.2 (* 480 24) 1 (lambda(x) (l1a 'set 'vel-factor x))))
(define r2 (ramp 0.2 (* 480 16) 1 (lambda(x) (l1b 'set 'vel-factor x))))
(define r3 (ramp 1.0 (* 480 32) 0.2 (lambda(x) (l1b 'set 'vel-factor x))))
(define r4 (ramp 0.2 (* 480 32) 1   (lambda(x) (l1c 'set 'vel-factor x))))

(define s1 (event-score (hash-table :bbt (list 8 4 480))
  :1:1:0      (list '(l1a 'start)); '(r1 'start))
  :9:2:240    (list  '(l1b 'start)); '(r2 'start))
  :17:1:0     (list '(l1c 'start)) ; plays twice then pauses on each go
  :25:1:0     (list '(l1d 'start)); '(r3 'start) '(r1 'start))
  :33:1:0     (list '(l1e 'start)); '(r4 'start) '(r2 'start))
  ;:41:1:0     (list '(r4 'start))
  ;:41:1:0     (list '(l1a 'set-seq 0 p1-rev) '(r4 'start))
  ;:41:1:0     (list '(l1a 'set-seq 0 p1-rev) '(r4 'start))

  ;:25:1:0     (list '(l1b 'stop) '(l1d 'start))
  ;:33:1:0     (list '(l1d 'stop)  '(l1c 'start))
  ;:41:1:0     (list '(l1d 'start) '(l1c 'start))
  ;:49:1:0     (list '(l1d 'stop))
  ;:49:2:240   (list '(l1b 'start))
  ;:57:1       (list '(l1d 'set 'time-factor 2) '(l1d 'start))
  ;:65:1       (list '(l1d 'stop))
  ;:73:1       (list '(l1d 'set 'time-factor 2.5) '(l1d 'set 'transpose 2) '(l1d 'start))
  ;:17:1:0    (list '(l1b 'set-seq 4 '(240 1 100 74 60)))
  ;:21:1:0    (list '(l1b 'set-seq 4 '(240 1 100 70 60)))
  ;:25:1:0    (list '(l1b 'set-seq 4 '(240 1 100 74 60)))
  ;:29:1:0    (list '(l1b 'set-seq 4 '(240 1 100 70 60)))  ; 69 cool as well
  ;:33:1:0    (list '(l1b 'set-seq 4 '(240 1 100 74 60)))
  ;:37:1:0    (list '(l1b 'set-seq 4 '(240 1 100 72 60)))
  ;:41:1:0    (list '(l1b 'set-seq 4 '(240 1 100 74 60)))
  ;:45:1:0    (list '(l1b 'set-seq 4 '(240 1 100 72 60)))
  ;:9:1:0    (list '(l1b 'set 'loop-len 10))
  ;:11:1:0    (list '(l1b 'set 'loop-len 8))
  ;:13:1:0    (list '(l1b 'set 'loop-len 10))
  ;:15:1:0    (list '(l1b 'set 'loop-len 8))
  ;:5:1:0    (list '(l1b 'start))

))

(define (stop-all)
  (l1a 'stop)
  (l1b 'stop)
  (l1c 'stop)
  (l1d 'stop)
  (l1e 'stop)
  (s1 'stop)
)


(post "etude-2.scm DONE")
