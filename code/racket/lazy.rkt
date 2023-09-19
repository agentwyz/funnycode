(define env0 '())

(define ext
    (lambda (x v env)
        (cons (cons x v) env)))

(define lookup
    (lambda (env v)
        (cond 
            ((assq x env) => cdr)
            (else #f))))

;;每次造一个thunk
;;每一个函数可能被缓存
(struct thunk (fv cached?) #:transparent #:mutable)

(struct closure (fun env))

(define make-thunk
    (lambda (fun)
        (thunk fun #f)))

;;接收一个严格计算的函数
;;使用cond语句来检查thunk是否被缓存
;;如果thunk被缓存
(define force-thunk
    (lambda (th)
        (cond 
            [(thunk-cached? th) (thunk-fv th)]
            [else 
                (let loop ([val ((thunk-fv th))])
                    (cond 
                        [(thunk? val) (loop ((thunk-fv val)))]
                        [else 
                            (set-thunk-fv! th val)
                            (set-thunk-cached?! th #t) 
                            val]))])))