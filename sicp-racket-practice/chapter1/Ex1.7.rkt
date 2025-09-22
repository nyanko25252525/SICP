#lang sicp

; 新旧共通処理
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (improve guess x) (average guess (/ x guess)))

; 従来の実装
(define (good-enough-old? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter-old guess x) 
    (if (good-enough-old? guess x) 
        guess 
        (sqrt-iter-old (improve guess x) x)
    )
)
(define (sqrt-old x) (sqrt-iter-old 1.0 x))

; 小さな数での問題
(sqrt-old 0.0001)  ; 期待値: 0.01, 実際は？

; 改良版
(define (good-enough-new? current-guess previous-guess)
    ; 相対誤差が0.1%以下なら終了
    ; |current - previous| < current * 0.001
    (< (abs (- current-guess previous-guess)) (* current-guess 0.001))
)
(define (sqrt-iter-new current-guess previous-guess x) 
    (if (good-enough-new? current-guess previous-guess) 
        current-guess 
        (sqrt-iter-new (improve current-guess x) current-guess x)
    )
)
(define (sqrt-new x) (sqrt-iter-new 1.0 0.0 x))

; 小さな数での問題
(sqrt-new 0.0001)  ; 期待値: 0.01, 実際は？

; 大きな数での問題
(sqrt 1000000000000000000)  ; 期待値: 1000000000, 実際は？