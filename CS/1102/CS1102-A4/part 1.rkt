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

#;
(define (fn-for-low low)
  (cond ((empty? low) empty)
        (else
         (... (first low) (fn-for-low (rest low))))))

;; =========================
;; ========FUNCTIONS========
;; =========================
;; Natural Natural -> (listof Widget)
(define (random-widgets num max)
  (if (< num 2)
      (cons (make-widget (number->string (random max)) (random max) (random max)) empty)
      (cons (make-widget (number->string (random max)) (random max) (random max)) (random-widgets (- num 1) max))))

;; Widget Bst -> Bst
(define BST1 (make-bst (make-widget "5000" 0 0)
                       (make-bst (make-widget "4000" 0 0) false false)
                       (make-bst (make-widget "7000" 0 0) false false)))

;;    5000
;;   /    \
;; 4000  7000

(check-expect (insert (make-widget "1000" 0 0) false) (make-bst (make-widget "1000" 0 0) false false))
(check-expect (insert (make-widget "6000" 0 0) BST1)
              (make-bst (make-widget "5000" 0 0)
                        (make-bst (make-widget "4000" 0 0) false false)
                        (make-bst (make-widget "7000" 0 0)
                                  (make-bst (make-widget "6000" 0 0) false false)
                                  false)))

(check-expect (insert (make-widget "5000" 0 0) BST1)
              (make-bst (make-widget "5000" 0 0)
                        (make-bst (make-widget "4000" 0 0) false (make-bst (make-widget "5000" 0 0) false false))
                        (make-bst (make-widget "7000" 0 0) false false)))

(define (insert w bst)
  (cond ((false? bst) (make-bst w false false))
        (else
         (cond ((string<=? (widget-name w) (widget-name (bst-widget bst)))
                (make-bst (bst-widget bst) (insert w (bst-left bst)) (bst-right bst)))
               ((string>=? (widget-name w) (widget-name (bst-widget bst)))
                (make-bst (bst-widget bst) (bst-left bst) (insert w (bst-right bst))))))))

;; (listof Widget) Bst -> Bst
(check-expect (insert-all empty BST1) BST1)
(check-expect (insert-all (list (make-widget "1000" 0 0)
                                (make-widget "8000" 0 0)) BST1)
              (make-bst (make-widget "5000" 0 0)
                        (make-bst (make-widget "4000" 0 0) (make-bst (make-widget "1000" 0 0) false false) false)
                        (make-bst (make-widget "7000" 0 0)
                                  false (make-bst (make-widget "8000" 0 0) false false))))

(define (insert-all low bst)
  (cond ((empty? low) bst)
        (else
         (insert-all (rest low) (insert (first low) bst)))))

;; String Bst -> Widget | false
(check-expect (find-name "4000" BST1) (make-widget "4000" 0 0))
(check-expect (find-name "4000" false) false)
(check-expect (find-name "4321" BST1) false)

(define (find-name str bst)
  (cond ((false? bst) false)
        (else
         (cond ((string=? str (widget-name (bst-widget bst))) (bst-widget bst))
               ((string<=? str (widget-name (bst-widget bst))) (find-name str (bst-left bst)))
               ((string>=? str (widget-name (bst-widget bst))) (find-name str (bst-right bst)))))))
            
;; Bst -> Image
(check-expect (render false) .)
(check-expect (render (make-bst (make-widget "4000" 0 0) BST1 BST1)) .)

(define (render bst)
  (local [(define TEXT-SIZE 24)    
          (define TEXT-COLOR "black")
          (define MTS (rectangle 0 0 "solid" "white"))

          (define (blanks n)
            (list->string (build-list n (lambda (x) #\ ))))

          (define (render-helper bst)
            (render bst 0 "T"))
          
          (define (render bst n LR) (cond ((false? bst) MTS)
                                          (else
                                           (above/align "left" (draw-widget (bst-widget bst) n LR)
                                                        (render (bst-left bst) (+ n 4) "L")
                                                        (render (bst-right bst) (+ n 4) "R")))))

          (define (draw-widget widget n LR)
            (cond[(string=? LR "R") (text (string-append (blanks n)
                                                         " R: "
                                                         (widget-name widget))
                                          TEXT-SIZE TEXT-COLOR)]
                 [(string=? LR "L") (text (string-append (blanks n)
                                                         " L: "
                                                         (widget-name widget))
                                          TEXT-SIZE TEXT-COLOR)]
                 [else (text (string-append (blanks n)
                                            " T: "
                                            (widget-name widget))
                             TEXT-SIZE TEXT-COLOR)]))

          ]
    (render-helper bst)))















