(begin
  (define r1 (make-repeater))
  (define r2 (make-repeater))
  (define r3 (make-repeater))
)

(define r1 (make-repeater))

(r1 'set-seq 0 72)

(r1 'start)
(r1 'stop)

(r1 'run)

(r1 'set 'time 480)

(r2 'start)

(r1 'stop)
(r2 'stop)
(r3 'start)
(r3 'stop)

(begin (r1 'start) (r2 'start) (r3 'start))
(begin (r1 'stop) (r2 'stop) (r3 'stop))

(r1 'set :time 166)
(r2 'set :time 360)
(r3 'set :time 360)

(r1 'start)
; update the seq
(with-let (r1 'get-env) (set! (seq 0) 72))
(with-let (r1 'get-env) (set! (seq 0) 67))

(define (set-seq index value)
  (with-let (r1 'get-env) (set! (seq index) value)))

(set-seq 2 23)
  


(r2 'start)

(r1 'set 'loop-len 4)
(r2 'set 'loop-len 4)


;LEFT OFF HERE
;; process that plays through a sequence, using only args
(define meta-proc-1
  ; internal vars, private to the scope of proc-1
  (let ((seq (list 72 67 70 67))
        (time (* 480 4))
        (dur 460))
    ; it can mutate the internal vars above
    (lambda (count)
      (post "meta-proc-1 count:" count "index:" index)
      ;; call to play the note, getting pitch from the sequence
      (play-note 0 dur 90 (seq index))
      ;; schedule next iteration if still in repetition range
      (if (> count 1) 
        (delay-t time (lambda ()
          (proc-1 (dec count) (inc-to index (length seq)))))))
)); end proc-1
