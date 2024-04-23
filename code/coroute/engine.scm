#lang racket

(require racket/engine)

;;创建一个engine对象
(define task (engine
    (lambda ()
        (println "runing in engine"))))


(engine-run 1 task)