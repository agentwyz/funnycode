#lang racket

(require data/queue)
(require racket/control)

;;全局执行上下文
(define tasks (make-queue))

;;向执行队列中添加一个任务
(define (addTask t)
    (enqueue! tasks t))

;;运行上下文中的任务
(define run
    (lambda ()
        (if (queue-empty? tasks)
            (void)
            (begin 
                (reset (dequeue! tasks))
                (run)))))

(define sched
    (lambda ()
        (shift k (addTask k))))    ;;这个k可能是当前的上下文


(define sum
    (lambda (n)
        (sched)         ;;时间延迟
        (if (= n 0) 0 (+ n (sum (- n 1))))))


(addTask (lambda () (println (sum 7))))
(addTask (lambda () (println (sum 3))))
(addTask (lambda () (println (sum 5))))

(run)