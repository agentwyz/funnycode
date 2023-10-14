(define interp
    (lambda (exp env)
        (match exp
            [(? number? exp) exp]
            [(? symbol? exp) (lookup exp)]
            [`(lambda (,p) ,b)
                (Closure exp env)]
            [`(op, arg)
                (let ([c (interp op)])
                    (match 
                        [(Closure (lambda (p) b) env)]))])))