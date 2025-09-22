#lang sicp

; y: step, x: offset
; pt[y][x]
; y = 0 : pt[0][0] = 1
; y = 1 : pt[1][0] = 1, pt[1][1] = 1
; y = 2 : pt[2][0] = 1, pt[2][1] = pt[1][0] + pt[1][1] = 2, pt[2][2] = 1
; y = 3 : pt[3][0] = 1, pt[3][1] = pt[2][0] + pt[2][1] = 3, pt[3][2] = pt[2][1] + pt[2][2] = 3, pt[3][3] = 1

(define (pascal-triangle y x) 
	(cond ((or (= x 0) (= x y)) 1)
		((> x y) 0) ; error
		(else (+ (pascal-triangle (- y 1) (- x 1)) (pascal-triangle (- y 1) x)))))

(pascal-triangle 0 0)
(pascal-triangle 2 1)
(pascal-triangle 3 2)
(pascal-triangle 5 3)
