#lang racket
(require data/queue)

(define tasks (make-queue))
(define (addTask t)
  (enqueue! tasks t))


(define show
    (lambda args
        (display (apply ~a (append args (list "\n"))
                    #:separator " "))))

(define fact
  (lambda (n)
    (if (= n 1)
        n
        (* n (fact (- n 1))))))


(define subC
  (lambda (a b k)
    (addTask (lambda () (k (- a b))))))



(define multC
  (lambda (a b k)
    (addTask (lambda () (k (* a b))))))


(define factC
  (lambda (n k)
    (if (= n 1)
        (k n)
        (subC n 1 (lambda (subRes)
                    (factC subRes (lambda (multRes)
                                    (multC multRes n (lambda (multC)
                                      (k multC))))))))))

(define (run)
  (lambda ()
    (if (queue-empty? tasks)
        (void)
        (begin
          ((dequeue! tasks))
          (run)))))

(addTask (lambda () (show "(fact 2) =" (fact 2))))