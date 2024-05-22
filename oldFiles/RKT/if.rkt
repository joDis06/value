;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname if) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;-------------------------------------------------------------------OCTOBER 8TH----------------IF FUNCTION----------------------------------------------------------------------------
;; Number -> Number
; (my-abs x) - > returns the absolute value of x
(define my-abs
  (λ(x)
    (if (> 0 x) (* -1 x) (* 1 x))))

;;unit tests
(check-expect (my-abs -18) 18)
(check-expect (my-abs 20) 20)

;;Rectangular Function
; (rect(t) = 0 when |t| > 1/2
;           1/2, when |t| = 1/2
;           1, when |t| < 1/2

(define rect
  (λ(t)
    (if (= (abs t) 1/2) 1/2 (if (> (abs t) 1/2) 0 1) )))

(check-expect (rect .2) 1)
(check-expect (rect 27) 0)
(check-expect (rect -1/2) 1/2)