(post "process-helpers.scm")

; helper to increment a var up a ceiling, exclusive
(define (inc-to var up-to)
  (if (= var (- up-to 1)) 0 (+ 1 var)))

(define-macro (inc-to! var up-to)
  `(set! ,var (if (= ,var (- ,up-to 1)) 0 (+ 1 ,var))))

(define-macro (inc! var)
  `(set! ,var (+ 1 ,var)))

(define-macro (dec! var)
  `(set! ,var (- ,var 1)))

(post "process-helpers.scm DONE")
