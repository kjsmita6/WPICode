;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |part 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct widget(name quantity time price parts))
;; a widget is a (make-widget String Natural Natural Number ListOfWidget)

#;
(define (fn-for-widget w)
  (... (widget-name w)
       (widget-quantity w)
       (widget-time w)
       (widget-price w)
       (fn-for-low (widget-parts w))))

#;
(define (fn-for-low low)
  (cond ((empty? low) empty)
        (else
         (... (fn-for-widget (first low)) (fn-for-low (rest low))))))

(define Wire (make-widget "Wire" 3 5 5 empty))
(define Cord (make-widget "Cord" 7 5 5 (list Wire)))
(define Numbers (make-widget "Numbers" 9 5 5 empty))
(define Buttons (make-widget "Buttons" 8 5 5 (list Numbers)))
(define Cell (make-widget "Cell" 6 25 7 (list Buttons)))
(define Receiver (make-widget "Receiver" 10 5 7 empty))
(define Telephone (make-widget "Telephone" 5 20 15 (list Receiver Buttons Cord)))

(define Glass (make-widget "Glass" 6 9 4 empty))
(define Beads (make-widget "Beads" 25 12 7 (list Glass)))
(define Bracelet (make-widget "Bracelet" 5 3 5 (list Beads)))
(define Chain (make-widget "Chain" 7 2 1 empty))
(define Pendant (make-widget "Pendant" 4 3 1 empty))
(define Necklace (make-widget "Necklace" 10 7 3 (list Chain Pendant)))
(define Rings (make-widget "Rings" 15 8 11 empty))
(define Jewelry (make-widget "Jewelry" 4 17 30 (list Rings Necklace Bracelet)))

;; =======================
;; =======================
;; Widget Number -> (listof Widget)
;; Finds all widgets/components where the name of the widget/component is longer than Number
;;
;; (listof Widget) Number -> (listof Widget)
;; Finds all components where the name of the component is longer than Number
;;
;(define (find-widget-name-longer-than w num) empty)
;(define (find-widget-name-longer-than-components low num) low)
(check-expect (find-widget-name-longer-than Glass 1) (list Glass))
(check-expect (find-widget-name-longer-than Beads 1) (list Beads Glass))
(check-expect (find-widget-name-longer-than Jewelry 1) (list Jewelry Rings Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widget-name-longer-than Jewelry 6) (list Jewelry Necklace Pendant Bracelet))

(check-expect (find-widget-name-longer-than-components empty 1) empty)
(check-expect (find-widget-name-longer-than-components (widget-parts Glass) 1) empty)
(check-expect (find-widget-name-longer-than-components (widget-parts Jewelry) 1)
              (list Rings Necklace Chain Pendant Bracelet Beads Glass))

#;
(define (find-widget-name-longer-than w num)
  (... (widget-name w)
       (fn-for-low (widget-parts w))))

#;
(define (find-widget-name-longer-than-components low num)
  (cond ((empty? low) empty)
        (else
         (... (find-widget-name-longer-than (first low) num) (find-widget-name-longer-than-components (rest low) num)))))

(define (find-widget-name-longer-than w num)
  (if (> (string-length (widget-name w)) num)
      (cons w (find-widget-name-longer-than-components (widget-parts w) num))
      (find-widget-name-longer-than-components (widget-parts w) num)))

(define (find-widget-name-longer-than-components low num)
  (cond ((empty? low) empty)
        (else
         (append (find-widget-name-longer-than (first low) num) (find-widget-name-longer-than-components (rest low) num)))))

;; ========================
;; ========================
;; Widget Number -> (listof Widget)
;; Finds all widgets/components where the quantity of the widget/component is greater than Number
;;
;; (listof Widget) Number -> (listof Widget)
;; Finds all components where the quantity of the component is greater than Number
;;
;(define (find-widget-quantity-over w num) empty)
;(define (find-widget-quantity-over-components low num) low)
(check-expect (find-widget-quantity-over Glass 1) (list Glass))
(check-expect (find-widget-quantity-over Beads 1) (list Beads Glass))
(check-expect (find-widget-quantity-over Jewelry 1) (list Jewelry Rings Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widget-quantity-over Jewelry 6) (list Rings Necklace Chain Beads))

(check-expect (find-widget-quantity-over-components empty 1) empty)
(check-expect (find-widget-quantity-over-components (widget-parts Glass) 1) empty)
(check-expect (find-widget-quantity-over-components (widget-parts Jewelry) 1)
              (list Rings Necklace Chain Pendant Bracelet Beads Glass))

#;
(define (find-widget-quantity-over w num)
  (... (widget-quantity w)
       (find-widget-quantity-over-components (widget-parts w))))

#;
(define (find-widget-quantity-over-components low num)
  (cond ((empty? low) empty)
        (else
         (... (find-widget-quantity-over (first low)) (find-widget-quantity-over-components (rest low))))))

(define (find-widget-quantity-over w num)
  (if (> (widget-quantity w) num)
      (cons w (find-widget-quantity-over-components (widget-parts w) num))
      (find-widget-quantity-over-components (widget-parts w) num)))

(define (find-widget-quantity-over-components low num)
  (cond ((empty? low) empty)
        (else
         (append (find-widget-quantity-over (first low) num) (find-widget-quantity-over-components (rest low) num)))))

;; =========================
;; =========================
;; Widget Number -> (listof Widget)
;; Finds all widgets/components where the price of the widget/component is less than Number
;
;; (listof Widget) Number -> (listof Widget)
;; Finds all components where the price of the component is less than Number
;;
;(define (find-widgets-cheaper-than w num) empty)
;(define (find-widgets-cheaper-than-components low num) low)
(check-expect (find-widgets-cheaper-than Glass 1) empty)
(check-expect (find-widgets-cheaper-than Beads 10) (list Beads Glass))
(check-expect (find-widgets-cheaper-than Jewelry 20) (list Rings Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widgets-cheaper-than Jewelry 6) (list Necklace Chain Pendant Bracelet Glass))

(check-expect (find-widgets-cheaper-than-components empty 1) empty)
(check-expect (find-widgets-cheaper-than-components (widget-parts Glass) 1) empty)
(check-expect (find-widgets-cheaper-than-components (widget-parts Jewelry) 6)
              (list Necklace Chain Pendant Bracelet Glass))

#;
(define (find-widgets-cheaper-than w num)
  (... (widget-name w)
       (fn-for-low (widget-parts w))))

#;
(define (find-widgets-cheaper-than-components low num)
  (cond ((empty? low) empty)
        (else
         (... (find-widgets-cheaper-than (first low)) (find-widgets-cheaper-than-components (rest low))))))

(define (find-widgets-cheaper-than w num)
  (if (< (widget-price w) num)
      (cons w (find-widgets-cheaper-than-components (widget-parts w) num))
      (find-widgets-cheaper-than-components (widget-parts w) num)))

(define (find-widgets-cheaper-than-components low num)
  (cond ((empty? low) empty)
        (else
         (append (find-widgets-cheaper-than (first low) num) (find-widgets-cheaper-than-components (rest low) num)))))

;; =========================
;; =========================
;; Widget Natural -> (listof Widget)
;; Finds all widgets/components where the quantity of the widget/component is less than Number
;;
;; (listof Widget) Natural -> (listof Widget)
;; Finds all components where the quantity of the component is less than Number
;;
;(define (find-widget-hard-make w num) empty)
;(define (find-widget-hard-make-components low num) low)
(check-expect (find-widget-hard-make Glass 1) empty)
(check-expect (find-widget-hard-make Beads 10) (list Beads Glass))
(check-expect (find-widget-hard-make Jewelry 15) (list Jewelry Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widget-hard-make Jewelry 6) (list Jewelry Necklace Pendant Bracelet))

(check-expect (find-widget-hard-make-components empty 1) empty)
(check-expect (find-widget-hard-make-components (widget-parts Glass) 1) empty)
(check-expect (find-widget-hard-make-components (widget-parts Jewelry) 6)
              (list Necklace Pendant Bracelet))

#;
(define (find-widget-hard-make w num)
  (... (widget-quantity w)
       (find-widget-hard-make-components (widget-parts w))))

#;
(define (find-widget-hard-make-components low num)
  (cond ((empty? low) empty)
        (else
         (... (find-widget-hard-make (first low)) (find-widget-hard-make-components (rest low))))))

(define (find-widget-hard-make w num)
  (if (is-hard-make w num)
      (cons w (find-widget-hard-make-components (widget-parts w) num))
      (find-widget-hard-make-components (widget-parts w) num)))

(define (find-widget-hard-make-components low num)
  (cond ((empty? low) empty)
        (else
         (append (find-widget-hard-make (first low) num) (find-widget-hard-make-components (rest low) num)))))

(define (is-hard-make w num)
  (or (< (widget-quantity w) num) (is-hard-make-low (widget-parts w) num)))

(define (is-hard-make-low low num)
  (cond ((empty? low) false)
        (else
         (or (is-hard-make (first low) num) (is-hard-make-low (rest low) num)))))

;; =========================
;; =========================
;; Widget String -> Widget | false
;; Finds the Widget with the name String and returns the Widget, false otherwise
;;
;; (listof Widget) String -> Widget | false
;; Finds the Widget with the name String and returns the Widget, false otherwise
;;
;(define (find-widget-name w str) w)
;(define (find-widget-name-components low str) false)
(check-expect (find-widget-name Jewelry "Glass") Glass)
(check-expect (find-widget-name Beads "GLass") false)
(check-expect (find-widget-name-components (widget-parts Jewelry) "Rings") Rings)

#;
(define (find-widget-name w str)
  (... (widget-quantity w)
       (find-widget-name-components (widget-parts w) str)))

#;
(define (find-widget-name-components low str)
  (cond ((empty? low) empty)
        (else
         (... (find-widget-name (first low) str) (find-widget-name-components (rest low) str)))))

(define (find-widget-name w str)
  (cond ((string=? (widget-name w) str) w)
        (else (find-widget-name-components (widget-parts w) str))))

(define (find-widget-name-components low str)
  (cond ((empty? low) false)
        (else
         (if (widget? (find-widget-name (first low) str))
             (find-widget-name (first low) str)
             (find-widget-name-components (rest low) str)))))

;; ========================
;; ========================
;; Widget -> (listof Widget)
;; Returns a list of all the components needed to make Widget
;;
;; (listof Widget)  -> (listof Widget)
;; Returns a list of all the components needed to make Widget
;;
;(define (list-all-widgets w) w)
;(define (list-all-widgets-components low) false)
(check-expect (list-all-widgets Beads) (list Beads Glass))
(check-expect (list-all-widgets Chain) (list Chain))
(check-expect (list-all-widgets-components empty) empty)
(check-expect (list-all-widgets-components (list Rings Necklace Bracelet))
              (list Rings Necklace Chain Pendant Bracelet Beads Glass))

#;
(define (list-all-widgets w)
  (... (widget-quantity w)
       (list-all-widgets-components (widget-parts w))))

#;
(define (list-all-widgets-components low)
  (cond ((empty? low) empty)
        (else
         (... (list-all-widgets (first low)) (list-all-widgets-components (rest low))))))

(define (list-all-widgets w)
  (cons w (list-all-widgets-components (widget-parts w))))

(define (list-all-widgets-components low)
  (cond ((empty? low) empty)
        (else
         (append (list-all-widgets (first low)) (list-all-widgets-components (rest low))))))

;; ========================
;; ========================
;; Widget -> listof String
;; Returns a list of all the names of the components needed to make Widget
;;
;; (listof Widget)  -> listof String
;; Returns a list of all the names of the components needed to make Widget
;;
;(define (list-all-widget-names w) w)
;(define (list-all-widget-names-components low) false)
(check-expect (list-all-widget-names Beads) (list "Beads" "Glass"))
(check-expect (list-all-widget-names Chain) (list "Chain"))
(check-expect (list-all-widget-names-components empty) empty)
(check-expect (list-all-widget-names-components (list Rings Necklace Bracelet))
              (list "Rings" "Necklace" "Chain" "Pendant" "Bracelet" "Beads" "Glass"))

#;
(define (list-all-widget-names w)
  (... (widget-quantity w)
       (list-all-widget-names-components (widget-parts w))))

#;
(define (list-all-widget-names-components low)
  (cond ((empty? low) empty)
        (else
         (... (list-all-widget-names (first low)) (list-all-widget-names-components (rest low))))))

(define (list-all-widget-names w)
  (cons (widget-name w) (list-all-widget-names-components (widget-parts w))))

(define (list-all-widget-names-components low)
  (cond ((empty? low) empty)
        (else
         (append (list-all-widget-names (first low)) (list-all-widget-names-components (rest low))))))