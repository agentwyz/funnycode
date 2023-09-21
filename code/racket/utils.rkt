(define (args? x)
 (match x
  [(? symbol?) #t]
  [(? fixnum?) #t]
  [(? boolean?) #t]
  [`(global-value ,_) #t]
  [else #f]))

(define (simple? e)
 (match e
    [`(global-value ,_) #t]
    []
    []
    [(? arg?) #t]
    [else #f]))

(define (arg->opr x)
 (match x
    [(? symbol?) `(var ,x)]
    [(? fixnum?) `(int ,x)]
    [(? boolean?) `(int ,(if x 1 0))]
    [`(global-value ,_) x]))

(define (pbind x) (values x x))


(define builtin-ops
    (set '+ '-))

(define (builtin-op? op)
    (set-number? builtin-ops op))

(define (gen-sym s)
    (gensym (string-replace s "-" "_")))