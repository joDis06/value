;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname leapyear) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Any year divisible by 400 IS a leap year
; All other leap years fall on years divisible by 4 and not by 100.
(define leap-year?
  (λ(n)
    (xor (divisor? n 400) (and (divisor? n 4) (not (divisor? n 100))))))

;;unit tests
(check-expect (leap-year? 2000) #t)
(check-expect (leap-year? 2004) #t)
(check-expect (leap-year? 2100) #f)
(check-expect (leap-year? 2017) #f)

;;Boolean Boolean -> Boolean
; (xor a b) -> returns true if exactly 1 arg is true; false otherwise

(define xor
  (λ(a b)
    (and (not (and a b)) (or a b) )))

;Integer Integer -> Boolean
(define divisor?
  (λ(n d)
    (my-zero? (remainder n d))
    ))

;Number -> Boolean (my-zero? n) -> true if arg = 0, false otherwise
(define my-zero?
  (λ(n)
    (= 0 n)
    ))