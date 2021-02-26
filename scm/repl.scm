
(stop-all)
(s1 'play)

(l1a 'start)
(l1b 'start)
(l1a 'set-seq 0 '(240 1 100 60 60))


(define g1 #f)
(define r1 (ramp 0 8 1 (lambda(x)(post "ramp out:" x))))

(r1 'start)
(r1 'stop)
(post g1)

