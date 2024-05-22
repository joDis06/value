;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname cond) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;The  cond function "A stack of cases"
; Has the same function as the if function

;(cond (question_1 answer_1)
 ;     (question_2 answer_2)
;
 ;     (question_1 answer_1)
  ;    ...
   ;   (else answer_N))

;evaluates to answer_

;- Each question must be a boolean value
;- An answer can be any data type
;- Case 1 is evaluated if the question in case_i-1 is false
;- The question in the last case should be omitted, replaced by else.

;Evaluates to answer_i whenever question_1 . . . question_i-1 are false and question_i is true.

;--------------
;; Integer -> Boolean
(define pos?
  (λ(x)
    (> x 0)))

(define a 1)
(define b 12)
  (cond ( (even? a) b)
        ( (pos? b) a)
        ( else (+ a b)))
;--------------------------
;; Number -> Integer
(define sign
  (λ(x)
    (cond ( (pos? x) 1)
          ( (zero? x) 0)
           (else -1) )))

(check-expect (sign -27) -1)
(check-expect (sign .2) 1)
(check-expect (sign 0) 0)
;-------------------------
;;
(define new-if
  (λ(a b c)
    (cond ( a b )
          (else c))))

;; unit tests
(check-expect (new-if (even? 3) 1 2) 2)
(check-expect (new-if (odd? 3) 1 2) 1)
