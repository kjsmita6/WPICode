; Part 1:  a semi-tame cow
; For part 1, you will have a cow that wanders around in a field (MTS).  The cow can move horizontally either left or right,
; but cannot move beyond the boundaries of MTS.  The cow’s speed can vary.
; 
; You have a limited degree of control over the cow:
; - Clicking the mouse relocates the cow to the mouse pointer’s position.
; - Pressing the “a” key causes the cow’s speed to the left to increase by 1. If the cow is moving to the right, its speed decreases by 1.
; - Pressing the “s” key causes the cow’s speed to the right to increase by 1. If the cow is moving to the left, its speed decreases by 1. 
; 
; If the cow’s speed is 0, the cow just stands there.
; When the cow reaches the edge of the window, it does not try to turn around and go the other way. It continues to shake back and forth though.
; When the cow is moving, use the rotation trick described in the video lectures to make it appear as though the cow is moving.
; When the cow is standing still, it should not continue to rotate back and forth.
; 
; If the cow reaches the edge of its enclosure, it keeps trying to escape – i.e., its speed remains unchanged
; and it keep moving (this part makes your lives a bit easier).
; This assignment is BYOC – feel free to use any reasonably-sized cow image.
; 
; You must follow the HtDW recipe.  Identify the constant information in the world and figure out what has to change.
; Then use that knowledge to define your constants and structure definition. 

(require 2htdp/image)
(require 2htdp/universe)

(define COW .)
(define WIDTH 1000)
(define HEIGHT 1000)
(define MTS (empty-scene WIDTH HEIGHT))

(define-struct cow (x y dx rot))

#;
(define (fn-for-cow c)
  (... (cow-x c) (cow-y c) (cow-dx c) (cow-rot c)))

;; ====================
;; Cow -> Cow
;; increase cow position (x) by dx
(check-expect (next-cow (make-cow 300 300 3 3)) (make-cow 303 300 3 -3))
(check-expect (next-cow (make-cow 300 300 -3 -3)) (make-cow 297 300 -3 3))

(check-expect (next-cow (make-cow (- WIDTH 5) 100 5 3)) (make-cow WIDTH 100 5 -3))
(check-expect (next-cow (make-cow 5 100 -5 -3)) (make-cow 0 100 -5 3))

(check-expect (next-cow (make-cow 300 300 3 3)) (make-cow 303 300 3 -3))
(check-expect (next-cow (make-cow 300 300 -3 -3)) (make-cow 297 300 -3 3))

(check-expect (next-cow (make-cow 1000 100 1 3)) (make-cow 1000 100 1 -3))
(check-expect (next-cow (make-cow 0 100 -1 -3)) (make-cow 0 100 -1 3))

(check-expect (next-cow (make-cow 998 100 2 3)) (make-cow 1000 100 2 -3))
(check-expect (next-cow (make-cow 2 100 -2 -3)) (make-cow 0 100 -2 3))
;(define (next-cow c) c) ; stub

#;
(define (next-cow c)
  (... (cow-x c) (cow-y c) (cow-dx c)))

(define (next-cow c)
  (cond ((> (+ (cow-x c) (cow-dx c)) WIDTH) (make-cow (cow-x c) (cow-y c) (cow-dx c) (- (cow-rot c))))
        ((< (+ (cow-x c) (cow-dx c)) 0) (make-cow (cow-x c) (cow-y c) (cow-dx c) (- (cow-rot c))))
        (else
         (make-cow (+ (cow-x c) (cow-dx c)) (cow-y c) (cow-dx c) (- (cow-rot c))))))


;; ====================
;; Cow -> Image
;; draw cow image to MTS using cow-x and CTR-Y
(check-expect (render-cow (make-cow 99 300 10 3)) (place-image (rotate 3 COW) 99 300 MTS))
(check-expect (render-cow (make-cow 100 200 -10 -3)) (place-image (rotate -3 COW) 100 200 MTS))
(check-expect (render-cow (make-cow 100 100 0 3)) (place-image COW 100 100 MTS))
;(define (render-cow c) MTS) ; stub

#;
(define (render-cow c)
  (... (cow-x c) (cow-y c) (cow-dx c)))

(define (render-cow c)
  (if(not (= (cow-dx c) 0))
  (place-image (rotate (cow-rot c) COW) (cow-x c) (cow-y c) MTS)
  (place-image COW (cow-x c) (cow-y c) MTS)))

;; ====================
;; Cow Key -> Cow
;; causes cow to accelerate in the specified direction
(check-expect (handle-key (make-cow 100 100 10 3) "a") (make-cow 100 100 9 3))
(check-expect (handle-key (make-cow 100 100 -10 3) "a") (make-cow 100 100 -11 3))
(check-expect (handle-key (make-cow 100 100 10 3) "s") (make-cow 100 100 11 3))
(check-expect (handle-key (make-cow 100 100 -10 3) "s") (make-cow 100 100 -9 3))
(check-expect (handle-key (make-cow 100 100 10 3) "z") (make-cow 100 100 10 3))

;(define (handle-key c ke) c) ; stub
#;
(define (handle-key c ke)
  (cond ((key=? ke " ") (... c))
        (else (... c))))

(define (handle-key c ke)
  (cond ((key=? ke "a") (make-cow (cow-x c) (cow-y c) (- (cow-dx c) 1) (cow-rot c)))
        ((key=? ke "s") (make-cow (cow-x c) (cow-y c) (+ (cow-dx c) 1) (cow-rot c)))
        (else (make-cow (cow-x c) (cow-y c) (cow-dx c) (cow-rot c)))))


;; ====================
;; Cow Natural Natural MouseEvent -> Cow
;; places cow where clicked
(check-expect (handle-mouse (make-cow 100 100 5 3) 500 100 "button-down") (make-cow 500 100 5 3))
(check-expect (handle-mouse (make-cow 100 100 -5 3) 500 100 "button-down") (make-cow 500 100 -5 3))
(check-expect (handle-mouse (make-cow 100 100 5 3) 500 100 "button-up") (make-cow 100 100 5 3))

;(define (handle-mouse c x y me) c) ; stub
#;
(define (handle-mouse c x y me)
  (cond ((mouse=? me "button-down") (... c x y))
        (else (... c x y))))

(define (handle-mouse c x y me)
  (cond ((mouse=? me "button-down") (make-cow x y (cow-dx c) (cow-rot c)))
        (else c)))

;; ===================
(define (main ws)
  (big-bang ws
            (on-tick next-cow)
            (on-key handle-key)
            (on-mouse handle-mouse)
            (to-draw render-cow)))

;; ===================
(define START (make-cow 0 500 3 3))