#lang sicp

(define (square y) (* y y))

(define (cbrt x)
  ;; 平均をとる補助（読みやすさのため）
  (define (average a b) (/ (+ a b) 2))

  ;; 近似が十分か？
  (define (good-enough? guess previous)
    (< (abs (- guess previous)) (* guess 0.001)))

  ;; 改良（ニュートン法）
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

  ;; 反復
  (define (cbrt-iter guess previous)
    (if (good-enough? guess previous)
        guess
        (cbrt-iter (improve guess) guess)))

  (cbrt-iter 1.0 0.0))

;; 動作確認
(cbrt 0.001)          ; => 0.1 付近
(cbrt 1000000000000)  ; => 10000 付近
