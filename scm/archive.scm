; file to save previous versions

;; process that plays through a sequence, using only args
(define process
  ; internal vars, private to the scope of proc-1
  (let ((seq (list 60 62 64 65))
        (time 480)
        (dur 460))
    ; the function that executes on each call 
    ; takes an argument for the current interation number
    ; it can mutate the internal vars above
    (lambda (count index)
      (post "proc-1 count:" count "index:" index)
      ;; call to play the note, getting pitch from the sequence
      (play-note 0 dur 90 (seq index))
      ;; schedule next iteration if still in repetition range
      (if (> count 1) 
        (delay-t time (lambda ()
          (process (dec count) (inc-to index (length seq)))))))
)); end proc-1

; example of calling the above, getting 8 reps starting on index 0
; (proc-1 8 0)

; a similar process where all mutation is on the internal vars
; to stop playback, we can set global var 'playing to #f
(define proc-counter-2
  ; internal vars, private to the scope of proc-1
  (let ((count 16)
        (index 0)
        (seq (list 60 62 64 65))
        (time 480)
        (dur 460))
    ; the function that executes on each call 
    ; takes an argument for the current interation number
    ; it can mutate the internal vars above
    (lambda ()
      (post "proc-counter-2 count:" count "index:" index)
      ;; call to play the note, getting pitch from the sequence
      (play-note 0 dur 90 (seq index))
      ;; mutate internal vars for next iteration
      (inc-to! index (length seq))
      (dec! count)
      ;; schedule next iteration if still in repetition range
      (if (and playing (> count 0))
        (delay-t time proc-counter-2)))
)); end proc-counter-2


;********************************************************************************
;; a process implemented as a function object
; using S7's define*, thus init-list has a default arg of '()
(define (make-repeater . init-args)
  (post "make-repeater constructor running")
  (post "init-args:" init-args)
 
  ; internal vars, private to the scope of proc-1
  (let ((obj-playing #f) 
        (cb-handle #f)
        (iter-max #f)   ; max number of iterations
        (iter 0)        ; current iteration
        (seq-index 0)   ; current index in the sequence
        (seq (list 60 62 64 65))
        (loop-len 4)
        (time 480)
        (dur 460))

    ;; save inner environment as proc-env to allow external access 
    (define env (curlet))
    
    ; loop through the init-args keyword arg list, which is an assoc list of sym/value to set
    ; this allows setting any instance vars from keyword list to constructor
    ; but does this work for inherited ones??
    (let init-loop ((args init-args))
      (if (not (null? args))
        (begin 
          (varlet env (car args) (cadr args))
          (init-loop (cddr args)))))


    ;* METHODS

    ; return the local environment (for debugging, etc)
    (define (get-env) env)

    ; get value of an internal variable by looking it up 
    ; in the local environment
    (define (get sym) 
      (let-ref env sym))

    ; get value of an internal variable by looking it up 
    ; in the local environment
    (define (set sym val) 
      ; TODO: fix this according to Bill's input
      ; set the value in the env and then return value set
      (varlet env sym val) val)

    ; reset the process
    (define (reset)
      (set! iter 0)
      (set! seq-index 0)) 

    ; cancel next scheduled iteration and stop playback
    ; todo: what about tree recursion??
    (define (stop)
      (cancel-delay cb-handle)
      (set! obj-playing #f))

    ; reset state to beginning and start playback
    (define (start)
      (reset)
      (set! obj-playing #t)
      (run))

    (define (set-seq index value)
      (post "set-seq" index value)
      (set! (seq index) value))

    ; run an iteration and schedule the next one
    ; to do, figure out how to shorten the loops
    (define (run)
      ;; call to play the note, getting pitch from the sequence
      (play-note 0 dur 90 (seq seq-index))
      ;; mutate internal vars for next iteration
      ;(inc-to! seq-index (length seq))
      (inc-to! seq-index (if (< (length seq) loop-len) (length seq) loop-len))
      (inc! iter)
      ;; schedule next iteration if still in repetition range
      (if (and obj-playing (or (eq? iter-max #f) (< iter iter-max)))
        (set! cb-handle (delay-t time run))))
 
    ; msg dispatcher, calls internal method matching symbol in msg
    ; could add check for msg in the env to have better error messages
    (lambda (msg . args)
      ;(post "proc-obj call, msg:" msg "args:" args)
      (apply (eval msg) args)) 
)); end proc-counter-2


;; example of derived repeater
(define (child-repeater . init-args)
  (letrec* ((parent (apply make-repeater init-args)) (env (parent 'get-env)))
    ; definitions here are added to the parent env
    (with-let env
      (define foo (lambda () (post "foo!")))
      (define time 100)
      (define seq (list 48 50 52 53 54))
    )
    ;; actual function returned just delegates to inner process
    (lambda args (apply parent args))
)); end my proc

;; grandchild repeater
(define (grand-child-repeater)
  (letrec* ((parent (make-repeater)) (env (parent 'get-env)))
    (with-let env
      (define foo (lambda () (post "grand child foo!")))
    )
    (lambda args (apply parent args))
)); end my proc

;(define p (make-repeater ))
;(define mp (child-repeater))
;(define gp (grand-child-repeater))





(post "..instruments.scm LOADED")
