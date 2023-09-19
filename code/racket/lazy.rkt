(define env0 '())

(define ext
    (lambda (x v env)
        (cons (cons x v) env)))

(define lookup
    (lambda (env v)
        (cond 
            ((assq x env) => cdr)
            (else #f))))

(struct thunk (fv cached?) #:transparent #:mutable)

(struct closure (fun env))

(define make-thunk
    (lambda (fun)
        (thunk fun #f)))