;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname daysinmonth) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Write (days-in-month m y) where m and y are both integers. m represents a 
   ; month (1 = Jan. 2 = Feb ... 12 = Dec.) and y is a year.
   ; Feb (2) has 29 days in leap years, 28 otherwise.
   ; April, June, Sept. and Nov. have 30 days
   ; Jan, Mar, May, July, Aug. , Oct, Dec have 31 days

;; Boolean Boolean -> Boolean
(define xor 
     (λ(a b)
          (and (or a b)
          (not (and a b)))))


; Integer Integer -> Boolean
; Assume d is not zero.
(define divisor?
  (λ(n d)
    (zero? (remainder n d))))



;; Integer -> Boolean
(define leap-year?
  (λ(year)
    (or (divisor? year 400)
        (xor (divisor? year 4)
             (divisor? year 100)))))


;; Integer Integer -> Integer
;  Assume 1 <= m <= 12.
(define days-in-month
  (λ(m y)
    (cond ((or (= m 4) (= m 6)
               (= m 9) (= m 11)) 30)
          ((= m 2) (if (leap-year? y) 29 28))
          (else 31))))

;;unit tests
(check-expect (days-in-month 2 2016) 29)
(check-expect (days-in-month 2 2100) 28)
(check-expect (days-in-month 6 2000) 30)
(check-expect (days-in-month 7 2016) 31)

