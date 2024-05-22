;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname annulusarea) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Number Number -> Number
;;(distance x y) -> |x-y|
(define distance
  (λ(x y)
    (abs (- x y))))

;; My-pi
(define my-pi 3.14)

;; Nonnegative -> Nonnegative
; (circle-area r) -. area of a circle with radius r
(define circle-area
  (λ(r)
    (* my-pi r r)))

;; Nonnegative Nonnegative -> Nonnegative
; (annulus-area r1 r2) -> annulus area with radii r1 and r2
(define annulus-area
  (λ(r1 r2)
  (abs (- (circle-area r1)
          (circle-area r2)))))

;; Unit Tests
(check-expect (annulus-area 3 5) (* 16 my-pi))
(check-expect (annulus-area 2 1) (* 3 my-pi))
