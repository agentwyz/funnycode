(define binop?
    (lambda (sym)
        (member sym '())))

;;表示放在当前上下文中进行
;;context0, 表示最顶层的世界, 函数就是最顶层的世界

(define (interp exp next)
    (match exp
        [(? number? exp) (next exp)]        
        [(? symbol? exp) (next exp)]
        
        [`(,(? binop? op) ,exp1 ,exp2)
            (interp exp1
                (lambda (ans1)
                    (interp exp2
                        (lambda (ans2)
                            (next `(,op ,ans1 ,ans2))))))]
        
        [`(lambda (,parm) ,body)
            (next 
                `(lambda (,parm k)  
                    ,(interp body 
                        (lambda (x) `(k, x)))))]       
        [`(,op ,arg)        ;;因为都是函数调用都是尾递归这种形式
            (interp op
                (lambda (e1)
                    (interp arg 
                        (lambda (e2)
                            (let ([name (gensym 'v)])
                                `(,e1 ,e2 
                                    (lambda (,name) ,(next name))))))))])) ;;否则将(r, d)返回ctx

(define cps
    (lambda ))