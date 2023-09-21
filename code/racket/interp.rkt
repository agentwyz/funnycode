(define interp
    (lambda (exp env)
        (match exp
            [(? symbol? x) 
                (let ([v (lookup x env)])
                    (cond 
                        [(not v) (error "undefined variables") x]
                        [else v]))]        
            [(? number? x) x]
            [`(lambda (, x) ,e) 
                (Closure exp env)]                                    ;;如果在命令式编程语言中, 我们择怎们办
            [`(let ([,x ,e1]) ,e2)
                (let ([v1 (interp e1 env)]
                      (interp e2 (ext-env x v1 env))))]
            [`(,e1 ,e2)
                (let ([v1 (interp e1 env)]
                     [v2 (interp e2 env)])
                     (match v1
                        [(Closure `(lambda (,x) ,e) env-save)           ;;注意这里的x
                            (interp e (ext-env x v2 env-save))]))]       ;;x 绑定的值是上一个作用域中的
            
            [`(,op ,e1 ,e2)
                (let ([v1 (interp e1 env)]
                      [v1 (interp e2 env)])
                      
                (match op
                    ['+ (+ v1 v2)]
                    ['- (- v1 v2)]
                    ['* (* v1 v2)]
                    ['/ (/ v1 v2)]))])))