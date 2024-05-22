;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname coins) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Given the following coin denominations: penny, nickel, dime, quarter.


;Write the function (min-coins cents) that takes cents, a nonnegative integer,

;and returns the minimal number of coins to comprise the given cents.


;Create and define the following variables in the coins.rkt program.

;(define penny 1)

;(define nickel 5)

;(define dime 10)

;(define quarter 25)
;--------------------------------------------------------------------------------
;;
(define penny 1)

(define nickel 5)

(define dime 10)

(define quarter 25)

;; Nonnegative -> Nonnegative
; (min-coins cents) -> returns minimal number of coins to comprise given cents
(define min-coins
  (λ(cents)
    (

(min-coins 28)
(min-coins 143)
(min-coins 10)


