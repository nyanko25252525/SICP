#lang sicp

; 再帰
(define (f-recursive n)
    (if (< n 3) n
        (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))))

; Test
(f-recursive 0) ; 0
(f-recursive 1) ; 1
(f-recursive 2) ; 2
(f-recursive 3) ; 4
(f-recursive 4) ; 11
(f-recursive 5) ; 25

; 反復
(define (f-iterative n)
    (define (f-iter a b c count)
        (if (= count 0) a
            (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
    (if (< n 3) n
        (f-iter 2 1 0 (- n 2)))
)

; Test
(f-iterative 0) ; 0
(f-iterative 1) ; 1
(f-iterative 2) ; 2
(f-iterative 3) ; 4
(f-iterative 4) ; 11
(f-iterative 5) ; 25
