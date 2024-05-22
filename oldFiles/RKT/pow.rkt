;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname pow) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define pow-iter
  (λ(b n ans)
    (if (= n 0)
        ans
        (pow-iter b (- n 1) (* b ans) )
        )))

(define powtail
  (λ(b n)
    (pow-iter b n 1)
    ))

(define pow
  (λ(b n)
    (if (= n 0)
        1
        (* b (pow b (- n 1)) )
        )))

;;Time function
;; expression -> time
; (time exp) -> cpu

(time (pow 1 1e6))