;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname rockpaperscissors) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define RPS
  (λ(x y)
    (if ((and (equal? x "Rock")
                (equal? y "Scissors")) "W1" "W0")
          )))