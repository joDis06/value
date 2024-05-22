;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname josephdisommaHW10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 ;; Number Number Number -> Boolean
    ;   (between? n a b) -> checks whether n is within [a,b).

(define between?
  (λ(n a b)
    (and (< n b) (>= n a))))

  ;; unit tests
 (check-expect (between? 1 1 3) true)
 (check-expect (between? 2 -1 4) true)
 (check-expect (between? 3  1  3) false)
 (check-expect (between? 1  3  1) false)
 (check-expect  (between? 1 1 1) false)

;--------------------------------------

;; (triangle? a b c) that takes 3 side lengths and determines whether the 3 sides form a triangle. Mathematical theorem : the sum of the lengths of any two sides of a triangle is greater
; than the length of the remaining side.

(define triangle?
  (λ(a b c)
    (and (> (+ a b) c) (> (+ b c) a) (> (+ c a) b))))

  ;;unit tests
  (check-expect (triangle? 1 1 2) #f)
  (check-expect (triangle? 21 41 27) #t)
  (check-expect (triangle? 5 100 2) #f)
  (check-expect (triangle? 31 35 42) #t)  
  (check-expect (triangle? (- 70 23) 50 (* 7 7) ) #t)

;--------------------------------------

;;Write (xor a b) that returns true if exactly 1 arg is true; false otherwise.
; xor represents the "exclusive-or" operator

;;Boolean Boolean -> Boolean
; (xor a b) -> returns true if exactly 1 arg is true; false otherwise

(define xor
  (λ(a b)
    (