(let ([x (call/cc (lambda (k) k))]
    (x (lambda (ingore) "helloWorld"))))

;;1. 捕获下一个过程, 讲一个表达式的值赋值给x 
;;2. let导致该con名字叫做x, 数据准备(x <- (lambda (ingore)))
;;3. x就变成了