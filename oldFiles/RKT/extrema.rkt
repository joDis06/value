;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname extrema) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Number Number -> Number
;; (distance x y) -> |x-y|
(define distance
  (λ(x y)
    (abs (- x y))))

;; Number Number -> Number
; (max-2 x y) -> returns the maximum of x and y
(define max-2
  (λ(x y)
   (/ (+ (distance x y) (+ x y)) 2)))

;; Unit tests
(check-expect (max-2 5 3) 5)
(check-expect (max-2 2 3) 3)
(check-expect (max-2 -5 3) 3)
(check-expect (max-2 5 -3) 5)
(check-expect (max-2 5 5) 5)

;; Number Number Number -> Number
; (max-3 x y z) -> returns the maximum of x y and z
(define max-3
  (λ(x y z)
    (/ (+ (distance (max-2 x y) z) (+ (max-2 x y) z)) 2)))

    
(check-expect (max-3 9 2 1) 9)

;; Number Number -> Number
; (min-2 x y) -> returns minimum of x and y
(define min-2
  (λ(x y)
    (/ (- (+ x y) (abs (- x y))) 2)))

(check-expect (min-2 9 1) 1)

;; Number Number -> Number
; (min-2v2 x y) -> returns the minimum of x and y
(define min-2v2
  (λ(x y)
    (- (max-2 x y) (abs (- x y)))))

(check-expect (min-2v2 9 1) 1)

;; Number Number Number
; (median a b c) -> returns median of a b and c
(define median
  (λ(a b c)
    (- (+ a b c) (min a b c) (max a b c))))

(check-expect (median 10 7 1) 7)

;; BREAK --------------------------------------------------------------------------

;; Write the function (grader g1 g2 g3 g4 g5 g6) to calcualte the average of 6 grades using the following algorithm:
     ; Each grade is equally weighted
     ; Drop both the lowest and highest grades

(define grader
  (λ(g1 g2 g3 g4 g5 g6)
    (/ (abs (- g1 g2 g3 g4 g5 g6 (max g1 g2 g3 g4 g5 g6) (min g1 g2 g3 g4 g5 g6))) 4)))

(check-expect (grader 100 91 98 29 0 1) 54.75)

