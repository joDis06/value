;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |day-of-date.rkt (text)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Prescott Jain and Joseph Disomma


;; Number -> Number
(define ones-digit 
  (λ (n)
    (remainder (abs n) 10)))

;; Number -> Number
(define remove-ones-digit
  (λ (n)
    (/ (- n (remainder n 10)) 10)))

;; Number -> Number
(define tens-digit
  (λ(n)
    (ones-digit (remove-ones-digit n))))

;; Boolean Boolean -> Boolean
(define xor 
     (λ(a b)
     	 (and (or a b)
	      (not (and a b)))))


;; Integer -> Boolean
(define leap-year?
  (λ(year)
    (or (divisor? year 400)
        (xor (divisor? year 4)
             (divisor? year 100)))))

; Integer Integer -> Boolean
; Assume d is not zero.
(define divisor?
  (λ(n d)
    (zero? (remainder n d))))


;-------------------------------------------------------

;; PUT HERE -> Number
; (month-key m) -> returns key value of given month
(define month-key
  (λ(m)
    (cond ( (or (equal? m "April") (equal? m "July")) 0)
          ( (or (equal? m "January") (equal? m "October")) 1)
          ( (equal? m "August") 3)
          ( (or (equal? m "February") (equal? m "March") (equal? m "November")) 4)
          ( (equal? m "June") 5)
          ( (or (equal? m "September") (equal? m "December")) 6)
          ( else (if (equal? m "May") 2 2)))))

;;unit tests
(check-expect (month-key "May") 2)
(check-expect (month-key "August") 3)

;-------------------------------------------------------

;; Number -> Number
; (century-code y) -> returns key value of given year
(define century-code
  (λ(y)
    (cond ( (and (>= y 1700) (< y 1800)) 4)
          ( (and (>= y 1800) (< y 1900)) 2)
          ( (and (>= y 1900) (< y 2000)) 0)
          ( else (if (>= y 2000) 6 "Too Low")))))

;;unit tests
(check-expect (century-code 2014) 6)
(check-expect (century-code 1699) "Too Low")

;-------------------------------------------------------

;; Number -> PUT HERE 
; (num-to-day n) -> returns the day corresponding to the given number

(define num-to-day
  (λ(n)
    (cond ( (equal? n 0) "Sat.")
          ( (equal? n 1) "Sun.")
          ( (equal? n 2) "Mon.")
          ( (equal? n 3) "Tues.")
          ( (equal? n 4) "Wed.")
          ( (equal? n 5) "Thurs.")
          ( else (if (equal? n 6) "Fri." "No Day")))))

;;unit tests
(check-expect (num-to-day 2) "Mon.")
(check-expect (num-to-day 6) "Fri.")
(check-expect (num-to-day 7) "No Day")

;-------------------------------------------------------
    
;; PUT HERE Number Number -> PUT HERE
; (day-of-date m d y) -> day of the week corresponding to the given date

(define day-of-date
  (λ(m d y)
    (num-to-day (remainder (+ (+ (+
             (quotient (+ (* 10 (tens-digit y)) (ones-digit y)) 4) d (month-key m))
            (if (and (or (equal? m "January")
                         (equal? m "February"))
                     (leap-year? y) ) -1 0))
             (century-code y)                   
            (+ (* 10(tens-digit y)) (ones-digit y))
         ) 7)
                        )))
    
            
;;unit tests
(check-expect (day-of-date "March" 5 2014) "Wed.")
(check-expect (day-of-date "December" 15 2482) "Tues.")
                
            