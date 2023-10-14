(require data/queue)
(require racket/control)
(require racket/engine)

(define show
    (lambda (args)
        (display (apply ~a
                    (append args)))))