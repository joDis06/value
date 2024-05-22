;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname digits) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;2. Integer -> Digit
; (ones-digit n) -> returns the ones digit of n

(define ones-digit
  (λ(n)
    (abs (remainder n 10))))

;; Unit Tests
(check-expect (ones-digit 235) 5)
(check-expect (ones-digit -34) 4)

;; Integer -> Integer
(define remove-ones-digit
  (λ(n)
    (/ (- n (remainder n 10)) 10)))

;; Unit Tests
(check-expect (remove-ones-digit 235) 23)
(check-expect (remove-ones-digit -421) -42)
(check-expect (remove-ones-digit -235) -23)

;; Integer -> Digit
(define tens-digit
  (λ(n)
    (ones-digit (remove-ones-digit n))))

;; Unit Tests
(check-expect (tens-digit 23) 2)
(check-expect (tens-digit -235) 3)

;; Integer -> Digit
(define hundreds-digit
  (λ(n)
    (ones-digit (remove-ones-digit (remove-ones-digit n)))))

;;Unit Tests
(check-expect (hundreds-digit 100) 1)
(check-expect (hundreds-digit 2583) 5)

;; Integer -> Integer
(define sum-digits
  (λ(n)
    (+ (hundreds-digit n) (tens-digit n) (ones-digit n))))

;; Unit Tests
(check-expect (sum-digits 11) 2)
(check-expect (sum-digits 2939) 21)
(check-expect (sum-digits 8338) 14)

;; Integer -> Integer
(define my-remainder
  (λ(n d)
    (- n (* d (quotient n d)))))

;; Unit Tests
(check-expect (my-remainder 10 6) 4)
(check-expect (my-remainder 15 4) 3)






