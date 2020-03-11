;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |part 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require racket/list)
(require 2htdp/image)
(define-struct widget (name quantity price))
;; a widget is a (make-widget String Natural Number)
; same as assignment #3, except no parts component

(define-struct bst (widget left right))
;; a BST is either
;;          false, or
;;          a (make-bst widget bst bst)

(define (do-tests lst)
  (cond
    [(empty? lst) empty]
    [else
     (cons
      ((first lst) 5) ; 5 is a dummy value
      (do-tests (rest lst)))]))

;; Natural Natural -> (listof Widget)
(define (random-widgets num max)
  (if (< num 2)
      (cons (make-widget (number->string (random max)) (random max) (random max)) empty)
      (cons (make-widget (number->string (random max)) (random max) (random max)) (random-widgets (- num 1) max))))

(define (insert fn w bst)
  (cond ((false? bst) (make-bst w false false))
        (else
         (cond ((fn w (bst-widget bst))
                (make-bst (bst-widget bst) (insert fn w (bst-left bst)) (bst-right bst)))
               (else
                (make-bst (bst-widget bst) (bst-left bst) (insert fn w (bst-right bst))))))))

(define (insert-all fn field low bst)
  (if (empty? low)
      bst
      (local ((define (comp w1 w2)
                (fn (field w1) (field w2))))
        (foldr (lambda (w1 bst)
                 (insert comp w1 bst)) bst low))))

(define (find eq lt value bst)
  (if (false? bst)
      false
      (if (eq value bst)
          (bst-widget bst)
          (if (lt value bst)
              (find eq lt value (bst-left bst))
              (find eq lt value (bst-right bst))))))

(define (EQ-FUNC val bst)
  (string=? (widget-name val) (widget-name (bst-widget bst))))

(define (LT-FUNC val bst)
  (string<? (widget-name val) (widget-name (bst-widget bst))))

;; =========================
;; =========TESTING=========
;; =========================
(define list10k (random-widgets 10000 1000000))
(define list100k (random-widgets 100000 1000000))
(define list1m (random-widgets 1000000 1000000))

(define list10k-25p (list-ref list10k 2500))
(define list10k-50p (list-ref list10k 5000))
(define list10k-75p (list-ref list10k 7500))

(define list100k-25p (list-ref list100k 25000))
(define list100k-50p (list-ref list100k 50000))
(define list100k-75p (list-ref list100k 75000))

(define list1m-25p (list-ref list1m 250000))
(define list1m-50p (list-ref list1m 500000))
(define list1m-75p (list-ref list1m 750000))
(define list1m-not (make-widget "-1" 0 0))

(define bst10k (insert-all string<=? widget-name list10k false))
(define bst100k (insert-all string<=? widget-name list100k false))
(define bst1m (insert-all string<=? widget-name list1m false))

(define (test-list10k-25p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list10k-25p))) list10k)))
(define (test-list10k-50p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list10k-50p))) list10k)))
(define (test-list10k-75p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list10k-75p))) list10k)))

(define (test-list100k-25p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list100k-25p))) list100k)))
(define (test-list100k-50p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list100k-50p))) list100k)))
(define (test-list100k-75p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list100k-75p))) list100k)))

(define (test-list1m-25p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list1m-25p))) list1m)))
(define (test-list1m-50p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list1m-50p))) list1m)))
(define (test-list1m-75p val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list1m-75p))) list1m)))
(define (test-list1m-not val)
  (time (filter (lambda (w)
                  (string=? (widget-name w) (widget-name list1m-not))) list1m)))

(define (test-bst1m-25p val)
  (time (find EQ-FUNC LT-FUNC list1m-25p bst1m)))
(define (test-bst1m-50p val)
  (time (find EQ-FUNC LT-FUNC list1m-50p bst1m)))
(define (test-bst1m-75p val)
  (time (find EQ-FUNC LT-FUNC list1m-75p bst1m)))
(define (test-bst1m-not val)
  (time (find EQ-FUNC LT-FUNC list1m-not bst1m)))

(define test-bst1m (list test-bst1m-25p test-bst1m-50p test-bst1m-75p test-bst1m-not))
(define test-list1m (list test-list1m-25p test-list1m-50p test-list1m-75p test-list1m-not))

(do-tests (append test-bst1m test-list1m))

;; ===================================================================
;; ==============================RESULTS==============================
;; ===================================================================
;; Results for 1 million elements - all times are in milliseconds (ms)
;;
;;   / ===============================================\
;;   |               ||     List      ||      Bst    |
;;   | ----------------------------------------------|
;;   | 25% through   ||     125       ||       0     |
;;   | 50% through   ||     79        ||       0     |
;;   | 75% through   ||     93        ||       0     |
;;   | not in list   ||     78        ||       0     |
;;   \================================================/
;;
;; ===================================================================
;; ===================================================================
;; ===================================================================