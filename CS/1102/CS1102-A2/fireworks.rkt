; Kyle Smith, Hunter Caouette


(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH 1000)
(define HEIGHT 1000)
(define MTS (rectangle 1000 1000 "solid" "black"))

(define-struct firework (x y dx dy time clr size))
(define-struct world (lof func nclr nsize))

#;
(define (fn-for-fw fw)
  (... (firework-x fw)
       (firework-y fw)
       (firework-dx fw)
       (firework-dy fw)
       (firework-time fw)
       (firework-clr fw)
       (firework-size fw)))

#;
(define (fn-for-world w)
  (... (world-lof w)
       (world-func w)
       (world-nclr w)
       (world-nsize w)))

#;
(define (fn-for-lof lof)
  (cond ((empy? lof) empty)
        (else
         (... (first lof) (fn-for-lof (rest lof))))))

;; ====================
;; World -> World
;; updates the world and each firework

;(define (next-w w) w)
#;
(define (next-w w)
  (... (world-lof w)
       (world-func w)
       (world-nclr w)
       (world-nsize w))) 

(define FW1 (make-firework 75 75 5 -3 0 "Asd" 5))
(define FW2 (make-firework 100 100 5 5 28 "asd" 5))
(define FW2D (make-firework 105 95 5 5 21 "asd" 5))
(define FW1D (make-firework 80 78 5 -3 -7 "Asd" 5))

(define (next-w w)
  (make-world (update-fws (delete-explodeds (world-lof w))) (world-func w) (world-nclr w) (world-nsize w)))

(check-expect (update-fws empty) empty)
(check-expect (update-fws (list FW2 FW1))
              (list FW2D FW1D))
(check-expect (update-fws (list FW1)) (list FW1D))

(define (update-fws lof)
  (cond ((empty? lof) empty)
        (else
         (cons (update-fw (first lof)) (update-fws (rest lof))))))

(check-expect (update-fw (make-firework 100 100 5 5 28 "asd" 5)) (make-firework 105 95 5 5 21 "asd" 5))
(check-expect (update-fw (make-firework 75 75 5 -3 0 "Asd" 5)) (make-firework 80 78 5 -3 -7 "Asd" 5))

(define (update-fw fw)
  (make-firework
   (+ (firework-x fw) (firework-dx fw))
   (- (firework-y fw) (firework-dy fw))
   (firework-dx fw)
   (firework-dy fw)
   (- (firework-time fw) 7)
   (firework-clr fw)
   (firework-size fw)))

(check-expect (delete-explodeds (list FW2 (make-firework -50 50 -3 3 -99 "asd" 4)))
                                (list FW2 (make-firework -50 50 -3 3 -99 "asd" 4)))
(check-expect (delete-explodeds empty) empty)
(check-expect (delete-explodeds (list FW2 (make-firework -50 50 -3 3 -150 "asd" 4)))
                                (list FW2))

(define (delete-explodeds lof)
  (cond ((empty? lof) empty)
        (else
         (filter (lambda (fw)
                   (> (firework-time fw) -100)) lof))))

;; ==================
;; World -> Image
;; draws firework to MTS
;(define (render-fw fw) MTS)

#;
(define (render w)
  (... (world-lof w)
       (world-func w)
       (world-nclr w)
       (world-nsize w)))

(define (render w)
  (cond ((empty? (world-lof w)) (place-image (circle 0 "solid" "black") 0 0 MTS))
        (else
         (place-images (generate-loi (world-lof w) w) (generate-loposn (world-lof w)) MTS))))

(define (generate-loi lof w)
  (cond((empty? lof) empty)
       (else
        (cons (generate-img (first lof) w) (generate-loi (rest lof) w)))))

(define (generate-img fw w)
  (if (< (firework-time fw) -100)
      (circle 0 "solid" "black")
      (if (< (firework-time fw) 1)
          ((world-func w) (firework-clr fw) (firework-size fw))
          (circle 5 "solid" (firework-clr fw)))))

(check-expect (generate-loposn empty) empty)
(check-expect (generate-loposn (list FW1 FW2)) (list (make-posn (firework-x FW1) (firework-y FW1))
                                                     (make-posn (firework-x FW2) (firework-y FW2))))

(define (generate-loposn lof)
  (cond((empty? lof) empty)
       (else
        (cons (make-posn (firework-x (first lof)) (firework-y (first lof))) (generate-loposn (rest lof))))))

;; ====================
;; World Key -> World
;; changes size/color of firework when key is pressed
;(define (handle-key fw ke) fw)

#;
(define (handle-key w ke)
  (cond ((key=? ke " ") (... w))
        (else (... w))))

(define (handle-key w ke)
  (cond ((key=? ke "w") (make-world (world-lof w) (world-func w) "white" (world-nsize w)))
        ((key=? ke "r") (make-world (world-lof w) (world-func w) "red" (world-nsize w)))
        ((key=? ke "g") (make-world (world-lof w) (world-func w) "green" (world-nsize w)))
        ((key=? ke "b") (make-world (world-lof w) (world-func w) "blue" (world-nsize w)))
        (else
         (if(and (number? (string->number ke)) (> (string->number ke) 0))
            (make-world (world-lof w)
                        (world-func w)
                        (world-nclr w)
                        (* 6 (string->number ke)))
            (make-world (world-lof w)
                        (world-func w)
                        (world-nclr w)
                        (world-nsize w))))))

;; ====================
;; World Natural Natural MouseEvent -> World
;; creates new firework when mouse is clicked
;(define (handle-mouse w x y me) w)

#;
(define (handle-mouse w x y me)
  (... (world-lof w)
       (world-func w)
       (world-nclr w)
       (world-nsize w)))

(define (random-num min max)
  (+ (* (/ (random 100) 100.0) max) min))

(define (handle-mouse w x y me)
  (if(string=? me "button-down")
     (make-world (cons (make-firework x y
                                      (random-num -5 10)
                                      (random-num 1 5)
                                      (* (random-num 4 8) 54)
                                      (world-nclr w)
                                      (world-nsize w)) (world-lof w)) (world-func w) (world-nclr w) (world-nsize w))
     w))

;; ====================
(define (main ws)
  (big-bang ws
            (on-tick next-w)
            (on-key handle-key)
            (on-mouse handle-mouse)
            (to-draw render)))

(define (expl-func clr size)
  (text "Eat at Joe's" size clr))

(define (expl-func2 clr size)
  (star size "solid" clr))

(define START1 (make-world empty expl-func "blue" 36))
(define START2 (make-world empty expl-func2 "white" 18))