#lang sicp

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9
; 反復
