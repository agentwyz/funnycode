#lang racket

(define env0 '())

;;扩展整个环境
(define ext
    (lambda (x v env)
        (cons (cons x v) env)))

(define lookup
  (lambda (x env)
    (cond
     [(assq x env) => cdr]
     [else #f])))

;;每次造一个thunk
;;每一个函数可能被缓存
(struct thunk 
    (fv cached?) 
    #:transparent 
    #:mutable)

(struct closure (fun env))

(define make-thunk
    (lambda (fun)
        (thunk fun #f)))

;;接收一个严格计算的函数
;;使用cond语句来检查thunk是否被缓存
;;如果thunk被缓存
(define force-thunk
    (lambda (th)                                                        ;;延迟计算函数
        (cond
            [(thunk-cached? th) (thunk-fv th)]                          ;;检查是否被缓存, 如果被缓存, 返回缓存的结果
            [else 
                (let loop ([val ((thunk-fv th))])                       ;;如果没有被缓存, 它会进入一个循环来计算结果
                    (cond 
                        [(thunk? val) (loop ((thunk-fv val)))]
                        [else 
                            (set-thunk-fv! th val)
                            (set-thunk-cached?! th #t) 
                            val]))])))


(define interp1
    (lambda (exp env)
        (match exp
            [(? number? x) x]
            [(? symbol? x)
                (lookup x env)]
            [`(lambda (,x) ,e)
                (closure exp env)]
            [`(e1, e2)                                                 ;;当函数被调用的时候
                (let ([v1 (make-thunk (lambda () (interp1 e1 env)))]   ;;首先将参数1, 创建一个thunk
                      [v2 (make-thunk (lambda () (interp1 e2 env)))]   ;;其次创建一个参数2
                    (make-thunk
                        (lambda ()
                            (let ([v1+ (force-thunk v1)])              ;;强制进行求值
                                (match v1+
                                    [(closure `(lambda (,x) ,e) env1)  ;;如果是一个函数的话
                                        (interp1 e (ext x v2 env1))]))))))])))

(define interp
    (lambda (exp)
        (force-thunk (interp1 exp env0))))