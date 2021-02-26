

; a base class for self-scheduling objects, 'players'
(define (grid . init-args)
  (post "grid constructor running")
  (post "init-args:" init-args)
 
  ; internal vars, private to the scope of the clip-player
  (let ((state (hash-table
          :rows 16  :cols 8)))   ; hash-table for state, with some defaults

    ;; save this let's environment as env to allow external access 
    (define env (curlet))
    
    ; loop through the init-args keyword arg list, which is an assoc list of sym/value to set
    ; this allows setting any instance vars from keyword list to constructor
    (define (set-init-args)
      (let init-args-loop ((args init-args))
        (if (not (null? args))
          (begin 
            (if (keyword? (car args))
              ; keywords go into the state dict
              (set! (state (car args)) (cadr args))
              ; symbol args go into the private let
              (varlet env (car args) (cadr args)))
            (init-args-loop (cddr args)))))
    )
    (set-init-args)
    ; set up the internal data
    (set! (state :data) (make-vector (state :rows) 0))
    (do ((i 0 (inc i))) ((= i (state :rows))) 
      (set! (state :data i) (make-vector (state :cols) 0)))
    ; set the max object correctly
    (send (state :obj) 'rows (state :rows))
    (send (state :obj) 'cols (state :cols))


    ;* end base constructor logic (until we return the lambda at the bottom)   

    ;* state accessors
    (define (get-state-hash) state)

    (define (get-state key) (state key))

    (define (set-state key val) (set! (state key) val))

    (define (update-view)
      ; update the associated cellblock object with all data points
      (let ((rows (state :rows)) (cols (state :cols)) (data (state :data)))
        (do ((r 0 (inc r))) ((= r rows)) 
          (do ((c 0 (inc c))) ((= c cols)) 
            (send (state :obj) 'set c r ((data r) c))))))

    (define (setp col row val)
      (set! (((state :data) row) col) val)
      (update-view) 
      '())
    
    (define (set-all col value-list)
      (do ((r 0 (inc r))) ((= r (length value-list)))
        (set! (((state :data) r) col) (value-list r)))
      (update-view) 
      '())


    ; msg dispatcher, calls internal method matching symbol in msg
    (lambda (msg . args)
      (apply (eval msg) args)) 
)); end base-player let and define

(post "grid.scm DONE")
