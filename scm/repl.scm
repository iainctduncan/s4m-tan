
(stop-all)
(s1 'play)

(l1a 'start)
(l1b 'start)

(l1a 'start)
(l1a 'stop)

;(l1a 'ramp 1 1920 3 (lambda(x)(post "env lambda" x)))

;(l1a 'ramp 1 1920 3 (lambda(x)(l1a 'set 'vel-factor x)))

; LEFT OFF HERE:
(l1a 'ramp 1 1920 3 '(set! vel-factor))

(procedure? post)

(append '(1 2) (list 3))
