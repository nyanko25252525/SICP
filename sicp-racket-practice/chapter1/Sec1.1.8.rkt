#lang sicp

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

; 内部定義＋レキシカルスコープ版（教科書の整理形）
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt 0.0001)