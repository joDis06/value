;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname logicalfunctions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
    (divisor? (n (+n 1)))))

(my-odd? 8)