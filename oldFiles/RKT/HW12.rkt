;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname HW12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Integer Boolean -> Boolean
(define cigar-party
  (λ (cigars weekend)
             (if weekend (>= cigars 40)
                          (and (>= cigars 40)
                               (<= cigars 60))
                          )))

;;unit tests
(check-expect (cigar-party 30 #f) #f)
(check-expect (cigar-party 50 #f) #t)
(check-expect (cigar-party 70 #t) #t)

;; Integer Integer -> Integer
(define date-fashion
  (λ (you date)
    (if (or (<= you 2) (<= date 2))
        0
        (if (or (>= you 8) (>= date 8))
            2 1))))

;;unit tests
(check-expect (date-fashion 5 10) 2)
(check-expect (date-fashion 5 2) 0)
(check-expect (date-fashion 5 5) 1)
(check-expect (date-fashion 8 2) 0)


