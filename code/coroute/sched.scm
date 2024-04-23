#lang racket/base

(require data/queue)
(require racket/control)

;;创建任务队列
(define tasks (make-queue))


;;添加任务队列
(define (addtask t)
    (enqueue! tasks t))


;;运行任务队列
(define (run)
    (if (queue-empty? tasks)
        (void)
        (begin 
            (reset ((dequeue! tasks)))
            (run))))


;;异步调度任务
(define (seched)
    (shift k (addtask k)))

(define (sum n)
  (seched)
    (if (= n 0)
      0
      (+ n (sum (- n 1)))))


(define (submit task)
    (addtask task))

;;并行    
(submit (lambda () (println (sum 1000))))
(submit (lambda () (println (sum 3))))   
(submit (lambda () (println (sum 1023))))

;;串行
(println (sum 1000))
(println (sum 1002))
(run)