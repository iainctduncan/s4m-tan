(post "event-score.scm")

(define (bbt->numbers bbt-sym)
  "convert bbt symbols in format :1:2:240 to (int-bars int-beats int-ticks)"
  (let ((p -1) (parts (list "" "" "0"))
        (chars (string->list (symbol->string bbt-sym)))) 
    (let char-loop ((char-index 0))
      (cond
        ((eq? (chars char-index) #\:) (set! p (+ 1 p)))
        (else (set! (parts p) (string-append (parts p) (string (chars char-index))))))
      (if (< char-index (dec (length chars)))
        (char-loop (+ 1 char-index))))
    ; return parts, converted to numbers
    (map string->number parts)))

(define (bbt->ticks beats-per-bar ticks-per-beat bbt-sym)
  ;(post "bbt->ticks" beats-per-bar ticks-per-beat bbt-sym)
  (let* ((bbt-parts (bbt->numbers bbt-sym))
         (ticks-bars (* beats-per-bar ticks-per-beat (- (bbt-parts 0) 1.0)))
         (ticks-beats (* ticks-per-beat (- (bbt-parts 1) 1.0)))
         (ticks-total (+ ticks-bars ticks-beats (bbt-parts 2))))
    ;(post "ticks-bars:" ticks-bars "ticks-beats:" ticks-beats "ticks-total:" ticks-total)
    (floor ticks-total)))


(define (event-score prop-hash . init-args)
  ; args is a set of time events
  (let ((props prop-hash)
        (bars-per-section 8)
        (beats-per-bar 4)
        (ticks-per-beat 480)
        (tick-index 0)
        (tick-res 60)
        (cb-handle #f)
        (playing #f)
        (events (hash-table)))

    ; set time base values from list passed in (otherwise leave as default)
    (if (props :bbt) (begin
      (set! bars-per-section ((props :bbt) 0))
      (set! beats-per-bar ((props :bbt) 1))
      (set! ticks-per-beat ((props :bbt) 2))))

    ; loop to store the event list from the time/function pair args
    (let data-init-loop ((args init-args))
      (if (not (null? args)) 
        (begin
          (if (keyword? (car args))
            (set! (events (bbt->ticks beats-per-bar ticks-per-beat (car args))) (cadr args))
            (set! (events (car args)) (cadr args)))
        (data-init-loop (cddr args)))))


    ;; save this let's environment as env to allow external access 
    (define env (curlet))

    ; get value of an internal var from local env, allowing external access
    ; we use let ref so it will look up the inheritance chain too
    (define (get sym) 
      (let-ref env sym))

    ; set an internal variable
    (define (set sym val) 
      ; TODO: fix this according to Bill's input
      ; set the value in the env and then return value set
      (if (keyword? sym)
        (set! (state sym))
        (varlet env sym val))
        ; return value set rather than the whole let
        val)

    (define (tick)
      ;(post "event-score tick, index:" tick-index)
      ; check for an event
      (let ((event (events tick-index)))
        (cond 
          ; TODO allow lists of lists to get eval'd
          ; an event that is a list gets eval'd
          ((and (list? event) (list? (car event))) 
            (for-each eval event))
          ((list? event) 
              (eval event))
          ; functions get called
          ((procedure? event) 
            (event))
          ; allow executing internal functions via symbols, i.e. 'stop to end playing
          ((symbol? event) 
            ((eval event))))
        (if playing
          (begin
            (set! tick-index (+ tick-res tick-index)) 
            (set! cb-handle (delay-t tick-res tick))))))

    (define (stop)
      ;(post "event-score tick")
      (cancel-delay cb-handle)
      (set! playing #f)
      (set! tick-index 0)
    )

    (define (play)
      (post "event-score play")
      (set! playing #t)
      (tick))

    (define (cue location)
      (post "event-score cue")
      (set! tick-index location))

    (define (get-env)
      (curlet))

    ; msg dispatcher, calls internal method matching symbol in msg
    (lambda (msg . args)
      (apply (eval msg) args)))
)


