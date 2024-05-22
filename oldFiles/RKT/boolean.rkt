;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname boolean) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;---Question #1
;Number . . . Number -> Boolean ; (= arg1 . . . argN) True if arg1...argN all equal, false otherwise
(=(+ 2 1) 3)

(= 4 2 1)

(= (remainder 5 2) 1)

;;---Question #2
;Number -> Boolean (zero? arg) -> true if arg = 0, false otherwise

(zero? 7)

(zero? (- 7 7))

;;---Question #3
;Number -> Boolean (my-zero? n) -> true if arg = 0, false otherwise
(define my-zero?
  (λ(n)
    (= 0 n)
    ))

;;Test
(check-expect (my-zero? 1) #false)

;;---Question #4
;Integer Integer -> Boolean
(define divisor?
  (λ(n d)
    (my-zero? (remainder n d))
    ))

;;Tests
(check-expect (divisor? 12 4) #true)
(check-expect (divisor? 4 12) #false)

;;---Question #7
;Number ... Number -> Boolean

;;Tests
(check-expect (> 3 (+ 4 2) (* 5 6)) #f)
(check-expect (<= 3 4 5) #t)
(check-expect (< 3 4 5 5) #f)

;;--- Positive : True if number is positive / >0, false otherwise
;Number -> Boolean
(define pos?
  (λ(n)
    (> n 0)))

;;Tests
(check-expect (pos? 10) #t)
(check-expect (pos? -3) #f)

;;--- Negative : True if number is negative / <0, false otherwise
; Number -> Boolean
(define neg?
  (λ(n)
    (< n 0)))

;;Tests
(check-expect (neg? -10) #t)
(check-expect (neg? 3) #f)

;;-- Even: True if number is even / no remainder when divided by 2, false otherwise 
; Number -> Boolean
(define my-even?
  (λ(n)
    (divisor? n 2)))

;;Tests
(check-expect (my-even? 4) #t)
(check-expect (my-even? 5) #f)

;;------------------------------------------------------------------------OCTOBER 5TH 2021--------------------------------------------------------------------------------------------
;;Number Number Number -> Boolean
; (increasing? a b c) -> evaluates to true only if a < b < c.
(define increasing?
  (λ(a b c)
    (< a b c)))

;;Tests
(check-expect (increasing? 1 2 3) #t)
(check-expect (increasing? 1 4 2) #f)

;;Boolean -> Boolean
; (not arg) -> true if arg is false, false if arg is true
(check-expect (not #t) #f)
(check-expect (not (not #t) ) #t)

;----------------------------

;;Number -> Boolean
(define my-odd?
  (λ(n)
    (not (my-even? n))))

(check-expect (my-odd? 8) #f)
(check-expect (my-odd? 7) #t)
;----------------------------
;; "Or" Predicate Function

;;Boolean ... Boolean -> Boolean
;(or arg1 arg2 ... argN) -> true, if at least 1 arg is true, false otherwise

;---------------------------

;;Boolean . . . Boolean -> Boolean
; (and arg1 . . . argN) -> true if all args are true, false if at least 1 arg is false
(check-expect (and #t #t) #t)
(check-expect (and #t #f #t #f) #f)
;(and 5 #f) -> Contract violation 

