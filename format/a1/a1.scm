(define dirver 
    (lambda (program)
        (with-output-to-file "t.s")
        (lambda ()
            (generate-x86-x64 (verify-scheme program)))))

(optimize-level 2)

(define int32?
    (lambda (x)
        (and (integer? x)
             (>= x (- 0 (expt 2 31)))
             (<= x (- (expt 2 31) 1)))))

(define int64?
    (lambda (x)
        (and (integer? x)
            (>= x (- 0 (expt 2 63)))
            (<= x (- (expt 2 63) 1)))))

(define verify-scheme
    (lambda (x)
        (define Prog
            (lambda (x) 
                (match)))))