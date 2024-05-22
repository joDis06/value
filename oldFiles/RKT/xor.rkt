;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname xor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Write (xor a b) that returns true if exactly 1 arg is true; false otherwise.
; xor represents the "exclusive-or" operator

;;Boolean Boolean -> Boolean
; (xor a b) -> returns true if exactly 1 arg is true; false otherwise

(define xor
  (λ(a b)
    (and (not (and a b)) (or a b) )))
;;unit tests
(check-expect (xor #t #t) #f)
(check-expect (xor #t #f) #t)
(check-expect (xor #f #t) #t)
(check-expect (xor #f #f) #f)

;;Way 2
;(define xor
 ; (λ(a b)
  ;  (or (and (not a) b) (and (not b) a))))

;------------------------------------------
;; Boolean Boolean Boolean -> Boolean
; (xor3 a b c) -> returns true if exactly 1 arg is true false otherwise 
(define xor3
  (λ(a b c)
    (and (not (or (and a b) (and b c) (and a c))) (or a b c))))
     
;;unit tests
(check-expect (xor3 #t #t #f) #f)
(check-expect (xor3 #f #f #f) #f)
(check-expect (xor3 #t #f #f) #t)
(check-expect (xor3 #f #t #f) #t)

;; Boolean Boolean . . . Boolean -> Boolean
; (my-and a b) -> returns true if all args are true, false otherwise
(define my-and2
  (λ(a b)
    (not (or (not a) (not b)))))

;;unit tests
(check-expect (my-and2 #t #t) #t)
(check-expect (my-and2 #f #f) #f)
(check-expect (my-and2 #f #t) #f)
(check-expect (my-and2 #t #f) #f)

;--------------------------------------------------------------------OCTOBER 7TH 2021-------------------------------------------------------------------------------------------------


