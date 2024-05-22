#lang racket

;; Assume n is a nonnegative integer
;; Integer Data -> List
(define make-list
  (λ(n x)
    (if (= n 0)
        '()
        (cons x (make-list (- n 1) x)))))

(make-list 0 'hi)
(make-list 1 'hi)
(make-list 3 'hi)
;------------------------------
(define dupla
  (λ(x L)
    (if (empty? L)
        '()
        (make-list (length L) x))))

(dupla 0 '(a b c))
(dupla 'a '(1))
(dupla '() '(2 (3 4) 5 (())))
;-----------------------------
(define member?
  (λ(x L)
    (cond ((empty? L) #f)
          ((equal? x (car L)) #t)
          (else (member? x (cdr L)))
          )))

;;Date List -> Boolean  
(define position
  (λ(x L)
    (if (member? x L)
        (if (equal? x (car L))
            0
            (+ 1 (position x (cdr L))))
        #f)))

(define insertL
  (λ(a b L)
    (if (not (member? a L))
        L
        (if (equal? (position a L) 0)
            (cons b L)
            (cons (car L) (insertL a b (cdr L)))))))
            

(insertL 'cat 'hat '(bat sat cat mat))
(insertL 6 5 '(1 2 3 4))

(define insertR
  (λ(a b L)
    (if (not (member? a L))
        L
        (if (equal? (position a L) 0)
            (cons (car L) (cons b (cdr L)))
            (cons (car L) (insertR a b (cdr L)))))))

(insertR 'cat 'hat '(bat sat cat mat))


(make-list 4 "apple")
;-------------------------DECEMBER 7TH HW
;;Data Data List -> List
(define replace
  (λ(a b L)
    (cond ((not (member? a L)) L)
          ((equal? (car L) a) (cons b (cdr L)))
          (else (cons (car L) (replace a b (cdr L))))
          )))

(replace 'w 'i '(b r a w n))
(replace 0 1 '(3 0 2 0 5))
;------------------------------
;;Data Data List -> List
(define replace-all
  (λ(a b L)
    (cond ((not (member? a L)) L)
          ((equal? (car L) a) (replace-all a b (cons b (cdr L))))
          (else (cons (car L) (replace-all a b (cdr L))))
          )))
            
(replace-all 0 1 '(3 0 2 0 5))
;------------------------------
;;Data List -> List
(define cons-to-end
  (λ(x L)
    (if (empty? L)
        (cons x L)
        (cons (car L) (cons-to-end x (cdr L)))
        )))

(cons-to-end 'a '())
(cons-to-end 'e '(a b c d))
;------------------------------
;;List List -> List
(define my-append
  (λ(L1 L2)
    (cond ((empty? L1) L2)
          ((empty? L2) L1)
          (else (my-append (cons-to-end (car L2) L1) (cdr L2) )))))

(my-append '() '(1 2))
(my-append '(3 5) '())
(my-append '(1 2 3) '(4 5))
;----------------------------
(define my-filter
  (λ(pred L)
    (cond ((empty? L) '())
          ((pred (car L)) (cons (car L) (my-filter pred (cdr L))))
          (else (my-filter pred (cdr L))))))

(my-filter even? '(1 2 3 4))
(my-filter odd? '(1 2 3 4))
(my-filter positive? '(-1 0 2 3 -5))
(my-filter list? '(1 () (3) a b))
(my-filter empty? '(1 () (3) a b))
;----------------------------
(define atom-occur?
  (λ(x L)
    (cond ((empty? L) #f)
          ((not (list? L)) #f)
          ((equal? (car L) x) #t)
          ((empty? (or (cdr L) (cddr L) (cdddr L))) (atom-occur? x (car L)))
          (else (atom-occur? x (cdr L))))))

(atom-occur? 2 '())
(atom-occur? 2 '(1 2 3 4))
(atom-occur? 2 '(1 ((2 3) 4) 5))
(atom-occur? 2 '(hat mat 3 5))
(atom-occur? 1 '((2 3) (((4) 1))))


(cddr '(1 ((2 3) 4) 5))

