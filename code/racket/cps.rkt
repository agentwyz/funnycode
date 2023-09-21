#lang racket


(define id (lambda (x) x))

(define serial 0)

(define gensym
 (lambda (base)
  (set! serial (+ 1 serial))
  (string-append (symbol->string base)
    (number->string serial))))

(define binop?
 (lambda (sym)
  (member sym '(+ - * / > < =)))) ;;如果是这些东西中的一种, 那么将会产生两个lambda

;;;一个编译器的完整实现
(define cpser1
 (lambda (exp ctx)                          ;;这个函数是转换的核心,
  (match exp
    [(? symbol? exp) (ctx exp)]
    [(? number? exp) (ctx exp)]
    [`(, (? binop? op) ,a ,b) 
        (cpser1 a (lambda (e1)
                (cpser1 b (lambda (e2) 
                    (ctx `(,op ,e1 ,e2))))))]
    [`(if ,condition ,t ,f) 
        `(cpser1 condition (lambda (ce) 
            `(if ,ce ,(cpser1 t ctx) ,(cpser1 f ctx))))]
    [`(lambda (,param) ,body)
        `(ctx `(lambda (,param k)
            ,(cpser1 body (lambda (x) `(k , x)))))]
    [`(let ([,x ,e]) ,body)
        (cpser1 `((lambda (,x) ,body) ,e) ctx)]
    [`(define ,n ,e)
        (define ,n ,(cpser1 e ctx))]
    [`(,op ,arg) 
        (cpser1 op (lambda (e1)
                    (cpser1 arg 
                     (lambda (e2)
                      (let ([name (gensym 'v)])
                       `(,e1 ,e2 (lambda (,name) ,(ctx name))))))))])))


(define cpser
 (lambda (exp)
  (set! serial 0)
  (cpser1 exp id)))