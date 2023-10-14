#lang racket

(require data/queue)
(require racket/control)
(require racket/engine)

(define show
  (lambda args
    (display (apply ~a
                   (append args (list "\n"))
                   #:separator " "))))

(define tasks (make-queue))

(define addTask
  (lambda (t)
    (enqueue! tasks t)))

(define engine-loop
  (lambda ()
    (if (queue-empty? tasks)
        (void)
        (begin (rest ((dequeue! tasks)))
               (engine-loop)))))

(define run
  (lambda ()
    (let loop ())))

(define sched
  (lambda ()
    (shift k (addTask k))))


(define sum-with-sched
  (lambda (n)
    (sched)
    (if (= n 0)
        0
        (+ n ()))))
