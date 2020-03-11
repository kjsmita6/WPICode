;; Kyle Smith
;; Samantha Woodland
;; A01

(require 2htdp/image)
(require 2htdp/universe)

;; do not modify the constants
(define RED 1) 
(define BLACK 2)
(define BLANK 0)
(define ROWS 10)  
(define COLUMNS 10)
(define DEFAULT-DEPTH 4)

;; state --> state
;; you will implement this function to make a move   
(define (computer-moves state)
  (make-move state (minimax state DEFAULT-DEPTH BLACK)))
 
;; state --> Number
;; you will implement this function to determine the value of a state (terminal or non-terminal)
(define (evaluation-function-simple ws)
  (cond [(and (check-win? ws) (= (world-state-whose-turn ws) RED)) 9999]
        [(and (check-win? ws) (= (world-state-whose-turn ws) BLACK)) -9999]
        [else 0]))

;; state --> Number
;; you will implement this function to determine the value of a state (terminal or non-terminal)
(define (evaluation-function-complex ws)
  (local [(define (eval-helper ws)
  (if (= (world-state-whose-turn ws) RED)
      (cond [(check-win? ws) 8]
            [(check-three? ws) 7]
            [(check-two? ws) 6]
            [else 5])
      (cond [(check-win? ws) 1]
            [(check-three? ws) 2]
            [(check-two? ws) 3]
            [else 4])))]
  (if (= (world-state-whose-turn ws) RED)
      (local [(define other-user (make-world-state
                                  (world-state-position ws)
                                  BLACK
                                  (world-state-settings ws)
                                  (world-state-other-info ws)
                                  (world-state-function ws)))]
        (- (eval-helper ws) (eval-helper other-user)))
      (local [(define other-user (make-world-state
                                  (world-state-position ws)
                                  RED
                                  (world-state-settings ws)
                                  (world-state-other-info ws)
                                  (world-state-function ws)))]
        (- (eval-helper other-user) (eval-helper ws))))))

;; you must implement the above two functions as part of the asignment, but may create additional
;; helper functions

(define-struct world-state (position whose-turn settings other-info function))
;; position is what checkers are on the board
;; whose-turn is the player who is about to move
;; settings and other-info are future functionality

  
;; returns the checker color (RED, BLACK, or BLANK) of the specified position
;; on the board
(define (piece-at board row column)
  (get-nth row (get-nth column board)))


;; Natural List --> Element
;; returns the nth element of a list.  for former LISP programmers learning Racket :-)
(define (get-nth n alist)
  (list-ref alist n))

(define (main state)
  (local 
    [(define board 
       (make-list COLUMNS
                  (make-list ROWS 0)))
     
     (define PIECE-SIZE 30)
     
     (define RED-CHECKER (circle PIECE-SIZE "solid" "red"))
     (define BLACK-CHECKER (circle PIECE-SIZE "solid" "black"))
     (define BLANK-CHECKER (circle PIECE-SIZE "solid" "white"))
     
     (define OFFSET (/ PIECE-SIZE .66))
     (define WIDTH
       (+ (* COLUMNS 2.5 PIECE-SIZE) (* 0.5 PIECE-SIZE)))
     (define HEIGHT
       (+ (* ROWS 2.5 PIECE-SIZE) (* 0.5 PIECE-SIZE)))
     
     (define MTS 
       (rectangle WIDTH HEIGHT "solid" "yellow"))
     
     (define (place-checker state x y mouse-event)
       (local
         [(define move (map-coordinates x y))
          (define next-state (make-move state move))]
         (cond
           [(and (string=? mouse-event "button-down")
                 (member move (legal-next-moves state)))
            (if (check-win? next-state)  
                (cond
                  [(= (world-state-whose-turn state) RED)
                   "RED WINS"]
                  [(= (world-state-whose-turn state) BLACK)
                   "BLACK WINS"])
                (local [(define result (computer-moves next-state))]
                  (if (check-win? result)
                      (cond
                        [(= (world-state-whose-turn next-state) RED)
                         "RED WINS"]
                        [(= (world-state-whose-turn next-state) BLACK)
                         "BLACK WINS"])
                      result)))]
           [else state])))
     (define (display-column2 column x-offset y-offset image)
       x-offset)
     (define (display-column column x-offset y-offset image)
       (cond
         [(empty? column) image]
         [else
          (place-image
           (cond 
             [(= (first column) RED) RED-CHECKER]
             [(= (first column) BLACK) BLACK-CHECKER]
             [(= (first column) BLANK) BLANK-CHECKER])
           x-offset y-offset 
           (display-column (rest column) x-offset (+ y-offset (* 2.5 PIECE-SIZE)) image))]))
     
     (define (display-board-helper position x-offset image)
       (cond 
         [(empty? position) image]
         [else
          (display-board-helper
           (rest position)
           (+ x-offset (* 2.5 PIECE-SIZE))
           (display-column (first position)
                           x-offset
                           OFFSET image))]))
     
     (define (display-board position)
       (display-board-helper position OFFSET MTS))
     (define (render state)
       (display-board (world-state-position state)))
     
     (define (map-coordinate lower upper click pos)
       (cond
         [(and (> click lower) (< click upper)) pos]
         [(> pos (max ROWS COLUMNS)) -1]
         [else
          (map-coordinate (+ lower (* 2.5 PIECE-SIZE)) (+ upper (* 2.5 PIECE-SIZE)) click (+ 1 pos))]))
     
     (define (map-coordinates x y) 
       (list (map-coordinate (/ PIECE-SIZE 2) (+  (/ PIECE-SIZE 2) (* 2 PIECE-SIZE)) x 0)
             (map-coordinate (/ PIECE-SIZE 2) (+  (/ PIECE-SIZE 2) (* 2 PIECE-SIZE)) y 0)))]
    
    (big-bang state 
              (on-mouse place-checker) 
              (to-draw render))))

;; *** this function permits you to make both legal and illegal moves
;; *** you do not need to use this function and probably should not.  someone thought of a reason
;; *** for it to exist and so i included it.  to be clear, your program is only permitted to 
;; *** make legal moves.
(define (make-hypothetical-move state move)
  (local [(define (update-column turn column current move)
            (cond
              [(empty? column) empty]
              [else
               (cons
                (cond
                  [(= current move)
                   turn]
                  [else (first column)])
                (update-column turn (rest column) (+ 1 current) move))]))
          
          (define (do-move board turn move-x move-y current-x)
            (cond
              [(empty? board) empty]
              [else
               (cons
                (cond
                  [(= move-x current-x) (update-column turn (first board) 0 move-y)]
                  [else (first board)])
                (do-move (rest board) turn move-x move-y (+ 1 current-x)))]))]
    (make-world-state
     (do-move (world-state-position state)
              (world-state-whose-turn state) 
              (first move) (second move) 0)
     (cond
       [(= (world-state-whose-turn state) RED) BLACK]
       [(= (world-state-whose-turn state) BLACK) RED])
     (world-state-settings state)
     (world-state-other-info state)
     (world-state-function state))))

;; you will use this function.  it takes as input the move you will make, represented as a list of X Y coordinates
(define (make-move state move)
  (if (member move (legal-next-moves state))
      (make-hypothetical-move state move)
      state))

;; world-state --> list
;; returns all of the legal moves for the current position
(define (legal-next-moves state)
  (local [(define (first-blank column pos)
            (cond
              [(empty? column) (- pos 1)]
              [(not (= (first column) BLANK))
               (- pos 1)]
              [else (first-blank (rest column) (+ 1 pos))]))
          (define (get-moves board-state column)
            (cond
              [(empty? board-state) empty]
              [else
               (local [(define blank (first-blank (first board-state) 0))]
                 (if (< blank 0)
                     (get-moves (rest board-state) (+ 1 column))
                     (cons
                      (list column (first-blank (first board-state) 0))
                      (get-moves (rest board-state) (+ 1 column)))))]))]
    (get-moves (world-state-position state)
               0)))

;; check-win:  world-state --> boolean
;; determines whether the game has ended with a victory for whoever just moved
(define (check-win? state)
  (local [(define (up-column board color x y)
            (if (< y 3)
                false
                (= (piece-at board (- y 1) x)
                   (piece-at board (- y 2) x)
                   (piece-at board (- y 3) x)
                   color)))
          (define (right-row board color x y)
            (if (>= x (- COLUMNS 3))
                false
                (= (piece-at board y (+ 1 x))
                   (piece-at board y (+ 2 x))
                   (piece-at board y (+ 3 x))
                   color)))          
          (define (up-right board color x y)
            (if (or (< y 3)
                    (>= x (- COLUMNS 3)))
                false
                (= (piece-at board (- y 1) ( + x 1))
                   (piece-at board (- y 2) ( + x 2))
                   (piece-at board (- y 3) ( + x 3))
                   color)))          
          (define (down-right board color x y)
            (if (or (>= y (- ROWS 3))
                    (>= x (- COLUMNS 3)))
                false
                (= (piece-at board (+ y 1) ( + x 1))
                   (piece-at board (+ y 2) ( + x 2))
                   (piece-at board (+ y 3) ( + x 3))
                   color)))           
          (define (victory? board x y)
            (let
                ([color (get-nth y (get-nth x board))])
              (if (= color BLANK)
                  false
                  (or
                   (up-column board color x y)
                   (right-row board color x y)
                   (up-right board color x y)
                   (down-right board color x y)))))          
          (define (walk-column board col row)
            (cond
              [(= row ROWS) false]
              [else
               (or
                (victory? board col row)
                (walk-column board col (+ 1 row)))]))           
          (define (walk-board board col)
            (cond
              [(= col COLUMNS) false]
              [else
               (or (walk-column board col 0)
                   (walk-board board (+ 1 col)))]))]
    (walk-board (world-state-position state) 0)))

;; check-three:  world-state --> boolean
;; determines whether the game can be won in next move
(define (check-three? state)
    (local [(define (up-column board color x y)
              (if (< y 2)
                  false
                  (= (piece-at board x (- y 1))
                     (piece-at board x (- y 2))
                     color)))
                 
            (define (right-row board color x y)
              (if (>= x (- COLUMNS 2))
                  false 
                  (= (piece-at board (+ 1 x) y)
                     (piece-at board (+ 2 x) y)
                     color)))
         
            (define (up-right board color x y)
              (if (or (< y 2)
                      (>= x (- COLUMNS 2)))
                  false
                  (= (piece-at board (+ x 1) (- y 1))
                     (piece-at board (+ x 2) (- y 2))
                     color)))
         
            (define (down-right board color x y)
              (if (or (>= y (- ROWS 2))
                      (>= x (- COLUMNS 2)))
                  false
                  (= (piece-at board (+ x 1) (+ y 1))
                     (piece-at board (+ x 2) (+ y 2))
                     color)))
         
            (define (three? board x y)
              (let
                  ([color (get-nth y (get-nth x board))])
                (if (= color BLANK)
                    false
                    (or
                     (up-column board color x y)
                     (right-row board color x y)
 
                     (up-right board color x y)
                     (down-right board color x y)))))
         
            (define (walk-column board col row)
              (cond
                [(= row ROWS) false]
                [else
                 (or
                  (three? board col row)
                  (walk-column board col (+ 1 row)))]))

            (define (walk-board board col)
              (cond
                [(= col COLUMNS) false]
                [else
                 (or (walk-column board col 0)
                     (walk-board board (+ 1 col)))]))]
      (walk-board (world-state-position state) 0)))
            
;; check-win:  world-state --> boolean
;; determines whether the game can be won in 2 moves
(define (check-two? state)
  (local [(define (up-column board color x y)
            (if (< y 1)
                false
                (= (piece-at board x (- y 1))
                   color)))
                 
          (define (right-row board color x y)
            (if (>= x (- COLUMNS 1))
                false
                (= (piece-at board (+ 1 x) y)
                   color)))
         
          (define (up-right board color x y)
            (if (or (< y 1)
                    (>= x (- COLUMNS 1)))
                false
                (= (piece-at board (+ x 1) (- y 1))
                   color)))
         
          (define (down-right board color x y)
            (if (or (>= y (- ROWS 1))
                    (>= x (- COLUMNS 1)))
                false
                (= (piece-at board (+ x 1) (+ y 1))
                   color)))
         
          (define (two? board x y)
            (let
                ([color (get-nth y (get-nth x board))])
              (if (= color BLANK)
                  false
                  (or
                   (up-column board color x y)
                   (right-row board color x y)
 
                   (up-right board color x y)
                   (down-right board color x y)))))
         
          (define (walk-column board col row)
            (cond
              [(= row ROWS) false]
              [else
               (or
                (two? board col row)
                (walk-column board col (+ 1 row)))]))
         
          (define (walk-board board col)
            (cond
              [(= col COLUMNS) false] 
              [else
               (or (walk-column board col 0)
                   (walk-board board (+ 1 col)))]))]
    (walk-board (world-state-position state) 0)))
  
;; WorldState Number Number -> Move 
;; Executes a minimax search on the worldstate and returns the best move
(define (minimax ws depth player)
  (local [(define (next-boards ws)
  (map (lambda (m) (make-move ws m)) (legal-next-moves ws)))
          (define (minimax-helper ws depth player)
            (if (or (= 0 depth) (empty? (legal-next-moves ws)))
                (evaluation-function-complex ws)
                (cond [(= RED player)
                       (apply max (map (lambda (ws)
                                         (minimax-helper ws (- depth 1) RED))
                                       (next-boards ws)))]
                      [(= BLACK player)
                       (apply min (map (lambda (m) 
                                         (minimax-helper ws (- depth 1) RED))
                                       (next-boards ws)))])))]
    (cond [(= RED player)
           (argmax (lambda (m)
                     (minimax-helper (make-move ws m) (- depth 1) BLACK))
                   (legal-next-moves ws))]
          [(= BLACK player)
           (argmin (lambda (m)
                     (minimax-helper (make-move ws m) (- depth 1) BLACK))
                   (legal-next-moves ws))])))

(define START-BOARD
  (make-list COLUMNS
             (make-list ROWS BLANK)))
  
(define complex-player
  (make-world-state START-BOARD RED 5 empty evaluation-function-complex))
  
(define simple-player
  (make-world-state START-BOARD RED 5 empty evaluation-function-simple))

(define test-board
  (list
   (list 1 2 3 4 5 6 7 8 9)
   (list 11 12 13 14 15 16 17 18 19)
   (list 21 22 23 24 25 26 27 28 29)
   (list 31 32 33 34 35 36 37 38 39)
   (list 0 0 0 0 0 0 0 0 0)
   (list 0 0 0 0 0 0 0 0 0)
   (list 0 0 0 0 0 0 0 0 0)
   (list 0 0 0 0 0 0 0 0 0)))

(define test-state (make-world-state test-board RED 5 empty evaluation-function-complex))

; Evaluation
; 
; 1. Given a 5 second time budget, both the simple function and the complex function are able to search to 4 levels.
; The complex player is stronger because it is able to make better decisions on good moves because the evaluation
; function is more complex. The complex function searches the board more thoroughly, and returns a wider range of
; numbers than the simple function.
; 
; 2. After playing the program, the computer does worse than the human. The humans are more easily able to make traps
; that the computer can't block. The computer will constantly try to create four in a row, and will block the human
; if he approaches four in a row.
