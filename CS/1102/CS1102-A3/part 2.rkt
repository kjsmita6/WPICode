;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |part 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
;; (Widget Num -> Boolean) (listof Widget) Natural -> (listof Widget)
;; Abstract function for finding widgets

(define (find-widgets fn w num)
  (local ((define (find-widgets-element fn w num)
            (if(fn w num)
               (cons w (find-widgets-list fn (widget-parts w) num))
               (find-widgets-list fn (widget-parts w) num)))
          (define (find-widgets-list fn low num)
            (cond ((empty? low) empty)
                  (else
                   (append (find-widgets-element fn (first low) num) (find-widgets-list fn (rest low) num))))))
    (find-widgets-element fn w num)))


;; ==========================
;; ==========================
;; Widget Number -> (listof Widget)
;; Finds all widgets/components where the name of the widget/component is longer than Number
;;
;(define (find-widget-name-longer-than w num) empty)
(check-expect (find-widget-name-longer-than Glass 1) (list Glass))
(check-expect (find-widget-name-longer-than Beads 1) (list Beads Glass))
(check-expect (find-widget-name-longer-than Jewelry 1) (list Jewelry Rings Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widget-name-longer-than Jewelry 6) (list Jewelry Necklace Pendant Bracelet))

(define (find-widget-name-longer-than w num)
  (find-widgets (lambda (w num)
               (> (string-length (widget-name w)) num)) w num))

;; ========================
;; ========================
;; Widget Number -> (listof Widget)
;; Finds all widgets/components where the quantity of the widget/component is greater than Number
;(define (find-widget-quantity-over w num) empty)
(check-expect (find-widget-quantity-over Glass 1) (list Glass))
(check-expect (find-widget-quantity-over Beads 1) (list Beads Glass))
(check-expect (find-widget-quantity-over Jewelry 1) (list Jewelry Rings Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widget-quantity-over Jewelry 6) (list Rings Necklace Chain Beads))

#;
(define (find-widget-quantity-over w num)
  (... (widget-quantity w)
       (find-widget-quantity-over-components (widget-parts w))))

(define (find-widget-quantity-over w num)
  (find-widgets (lambda (w num)
                (> (widget-quantity w) num)) w num))

;; =========================
;; =========================
;; Widget Number -> (listof Widget)
;; Finds all widgets/components where the price of the widget/component is less than Number
;(define (find-widgets-cheaper-than w num) empty)
(check-expect (find-widgets-cheaper-than Glass 1) empty)
(check-expect (find-widgets-cheaper-than Beads 10) (list Beads Glass))
(check-expect (find-widgets-cheaper-than Jewelry 20) (list Rings Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widgets-cheaper-than Jewelry 6) (list Necklace Chain Pendant Bracelet Glass))

#;
(define (find-widgets-cheaper-than w num)
  (... (widget-name w)
       (fn-for-low (widget-parts w))))

(define (find-widgets-cheaper-than w num)
  (find-widgets (lambda (w num)
                  (< (widget-price w) num)) w num))

;; =========================
;; =========================
;; Widget Natural -> (listof Widget)
;; Finds all widgets/components where the quantity of the widget/component is less than Number
;(define (find-widget-hard-make w num) empty)
(check-expect (find-widget-hard-make Glass 1) empty)
(check-expect (find-widget-hard-make Beads 10) (list Beads Glass))
(check-expect (find-widget-hard-make Jewelry 15) (list Jewelry Necklace Chain Pendant Bracelet Beads Glass))
(check-expect (find-widget-hard-make Jewelry 6) (list Jewelry Necklace Pendant Bracelet))

#;
(define (find-widget-hard-make w num)
  (... (widget-quantity w)
       (find-widget-hard-make-components (widget-parts w))))

(define (find-widget-hard-make w num)
  (find-widgets is-hard-make w num))

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
;(define (find-widget-name w str) w)
(check-expect (find-widget-name Jewelry "Glass") Glass)
(check-expect (find-widget-name Beads "GLass") false)

#;
(define (find-widget-name w num)
  (... (widget-quantity w)
       (find-widget-name-components (widget-parts w))))

(define (find-widget-name w str)
  (if (empty? (find-widgets (lambda (w str)
                  (string=? (widget-name w) str)) w str))
              false
              (first (find-widgets (lambda (w str)
                                     (string=? (widget-name w) str)) w str))))

;; ========================
;; ========================
;; Widget -> (listof Widget)
;; Returns a list of all the components needed to make Widget
;(define (list-all-widgets w) w)
(check-expect (list-all-widgets Beads) (list Beads Glass))
(check-expect (list-all-widgets Chain) (list Chain))

#;
(define (list-all-widgets w)
  (... (widget-quantity w)
       (list-all-widgets-components (widget-parts w))))

#;
(define (list-all-widgets-components low num)
  (cond ((empty? low) empty)
        (else
         (... (list-all-widgets (first low)) (list-all-widgets-components (rest low))))))

(define (list-all-widgets w)
  (find-widgets (lambda (w str) true) w 0))

;; ========================
;; ========================
;; Widget -> (listof String)
;; Returns a list of all the names of the components needed to make Widget
;(define (list-all-widget-names w) w)
(check-expect (list-all-widget-names Beads) (list "Beads" "Glass"))
(check-expect (list-all-widget-names Chain) (list "Chain"))

#;
(define (list-all-widget-names w)
  (... (widget-quantity w)
       (list-all-widget-names-components (widget-parts w))))

(define (list-all-widget-names w)
  (map widget-name (list-all-widgets w)))

;; =========================
;; =========================
;; Widget (Widget Widget -> Boolean) -> (listof Widget)
;; Sorts 2 widgets based on a specified comparator function
;(define (sort-widgets w fn) empty)
(check-expect (sort-widgets Jewelry (lambda (w1 w2)
                        (> (string-length (widget-name w1)) (string-length (widget-name w2)))))
              (list Bracelet Necklace Pendant Jewelry Glass Beads Chain Rings))
(check-expect (sort-widgets Cell (lambda (w1 w2)
                                   (< (string-length (widget-name w1)) (string-length (widget-name w2)))))
              (list Cell Numbers Buttons))

(define (sort-widgets w fn)
  (sort-low (list-all-widgets w) fn))
(define (sort-low LOW fn)
  (cond
    [(empty? LOW) empty]
    [else
     (insert
      (first LOW) fn
      (sort-low (rest LOW) fn))]))

(define (insert any comparison loa)
  (cond
    [(empty? loa) (list any)]
    [(comparison any (first loa))
     (cons any loa)]
    [else
     (cons (first loa)
          (insert any comparison (rest loa)))]))

;; =========================
;; =========================
;; Widget -> (listof Widget)
;; Sorts 2 widgets based on a specified comparator function
(check-expect (longest-name-widget Jewelry) Bracelet)
(check-expect (longest-name-widget Cell) Numbers)

(define (longest-name-widget w)
  (first (sort-widgets w (lambda (w1 w2)
                    (> (string-length (widget-name w1)) (string-length (widget-name w2)))))))