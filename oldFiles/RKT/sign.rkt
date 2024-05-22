;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sign) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Integer -> Boolean
(define pos?
  (λ(x)
    (> x 0)))

;; Number -> Integer
(define sign
  (λ(x)
    (if (pos? x) 1 (if (zero? x) 0 -1)
        )))

(check-expect (sign -27) -1)
(check-expect (sign .2) 1)
(check-expect (sign 0) 0)
