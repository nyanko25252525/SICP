#lang sicp

(define (square x) (* x x))
(define (improve guess x) (/ (+ (/ x (square guess)) (* guess 2)) 3))

(define (good-enough? current-guess previous-guess)
    (< (abs (- current-guess previous-guess)) (* current-guess 0.001))
)
(define (cbrt-iter current-guess previous-guess x) 
    (if (good-enough? current-guess previous-guess) 
        current-guess 
        (cbrt-iter (improve current-guess x) current-guess x)
    )
)
(define (cbrt x) (cbrt-iter 1.0 0.0 x))

; 小さな数での問題
(cbrt 0.001)  ; 期待値: 0.1, 実際は？

; 大きな数での問題
(cbrt 1000000000000000000)  ; 期待値: 1000000, 実際は？