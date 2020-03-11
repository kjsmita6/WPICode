(require racket/list)
(require 2htdp/image)

;; ========================
;; ====DATA DEFINITIONS====
;; ========================
(define-struct widget (name quantity price))
;; a widget is a (make-widget String Natural Number)
; same as assignment #3, except no parts component

(define-struct bst (widget left right))
;; a BST is either
;;          false, or
;;          a (make-bst widget bst bst)

#;
(define (fn-for-bst bst)
  (cond ((false? bst) (...))
        (else
         (... (bst-widget)
              (fn-for-bst (bst-left bst))
              (fn-for-bst (bst-right bst))))))

;; =========================
;; ========FUNCTIONS========
;; =========================
(define BST1 (make-bst (make-widget "5000" 0 0)
                       (make-bst (make-widget "4000" 0 0) false false)
                       (make-bst (make-widget "7000" 0 0) false false)))

;;    5000
;;   /    \
;; 4000  7000


;; (Value BST -> Boolean) (Value BST -> Boolean) Value BST -> Widget | False
(define (EQ-FUNC val bst)
  (string=? val (widget-name (bst-widget bst))))

(define (LT-FUNC val bst)
  (string<? val (widget-name (bst-widget bst))))

(check-expect (find EQ-FUNC LT-FUNC "4000" BST1) (make-widget "4000" 0 0))
(check-expect (find EQ-FUNC LT-FUNC "4000" false) false)
(check-expect (find EQ-FUNC LT-FUNC "4321" BST1) false)

(define (find eq lt value bst)
  (if (false? bst)
      false
      (if (eq value bst)
          (bst-widget bst)
          (if (lt value bst)
              (find eq lt value (bst-left bst))
              (find eq lt value (bst-right bst))))))

;; (Widget Widget -> Boolean) Widget Bst -> Bst
(define (lt w1 w2)
  (string<=? (widget-name w1) (widget-name w2)))

(define (gt w1 w2)
  (string>=? (widget-name w1) (widget-name w2)))

(check-expect (insert lt (make-widget "1000" 0 0) false) (make-bst (make-widget "1000" 0 0) false false))

(check-expect (insert lt (make-widget "6000" 0 0) BST1)
              (make-bst (make-widget "5000" 0 0)
                        (make-bst (make-widget "4000" 0 0) false false)
                        (make-bst (make-widget "7000" 0 0)
                                  (make-bst (make-widget "6000" 0 0) false false)
                                  false)))

(check-expect (insert gt (make-widget "6000" 0 0) BST1)
              (make-bst (make-widget "5000" 0 0)
                        (make-bst (make-widget "4000" 0 0) (make-bst (make-widget "6000" 0 0) false false) false)
                        (make-bst (make-widget "7000" 0 0) false false)))

(define (insert fn w bst)
  (cond ((false? bst) (make-bst w false false))
        (else
         (cond ((fn w (bst-widget bst))
                (make-bst (bst-widget bst) (insert fn w (bst-left bst)) (bst-right bst)))
               (else
                (make-bst (bst-widget bst) (bst-left bst) (insert fn w (bst-right bst))))))))

;; (Widget Widget -> Boolean) Field (listof Widget) Bst -> Bst
(check-expect (insert-all string<=? widget-name empty BST1) BST1)

(check-expect (insert-all string<=? widget-name (list (make-widget "1000" 0 0)
                                                      (make-widget "8000" 0 0)) BST1)
              (make-bst (make-widget "5000" 0 0)
                        (make-bst (make-widget "4000" 0 0) (make-bst (make-widget "1000" 0 0) false false) false)
                        (make-bst (make-widget "7000" 0 0)
                                  false (make-bst (make-widget "8000" 0 0) false false))))

(define (insert-all fn field low bst)
  (if (empty? low)
      bst
      (local ((define (comp w1 w2)
                (fn (field w1) (field w2))))
        (foldr (lambda (w1 bst)
                 (insert comp w1 bst)) bst low))))