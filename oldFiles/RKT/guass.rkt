;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname guass) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Consider the problem of computing the sum of the first n positive integers.

;;For example, if n = 5, then the sum is 15 since 1 + 2 + 3 + 4 + 5 = 15.

;Version 1: Uses an explicit function
;Legend has it that Guass devised this formula while in kindergarten.

;;; guass-sum(n) = n(n+1)/2
;;Proof
; S = 1 + 2 + 3 + ... + (n-1) + n
; S = n + (n+1) + (n+2) . . . + 2 + 1
; S = n(n+1)/2

;;Explicit Formul
; Positive Integer -> Positive Integer
(define guass-sum
  (λ(n)
    (/ (* n (+ n 1))
          2)))

;;Unit Tests
(check-expect (guass-sum 1) 1)
(check-expect (guass-sum 10) 55)

;Version 2: A recursive solution

;; Pos. Integer -> Pos. Integer
(define sum
  (λ(n)
    (if (= n 1)
        1
        (+ n (sum (- n 1)
                  )))))

;;unit tests
(check-expect (sum 5) 15)
(check-expect (sum 10) 55)

; (sum 1e6) Highest sum can go before failing. N = 6

;-------------------------------------------------------------------------------------------
;;Compute the factorial of n
;;Integer -> Integer
; Assume n >= 0
(define !
  (λ(n)
    (if (or (= n 1) (= n 0))
        1
        (* n (- n 1)) )))

;;unit tests
(check-expect (! 0) 1)
(check-expect (! 1) 1)
(check-expect (! 2) 2)
(check-expect (! 3) 6)

