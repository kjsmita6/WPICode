#lang plai-typed

; Kyle Smith (kjsmith@wpi.edu)

; #1 Write a function sum which takes a list of numbers and produces the sum of the numbers in the list.
(define (sum (nums : (listof number)))
  (if (empty? nums)
      0
      (+ (first nums) (sum (rest nums)))))

(test (sum (list 1 2 3 4 5 6)) 21)
(test (sum empty) 0)

; #2 Write a function sum-inrange which takes a list of numbers and produces the sum of the numbers in the list whose value is between -2 and -5 (included).
(define (sum-inrange (nums : (listof number)))
  (if (empty? nums)
      0
      (if (and (<= (first nums) -2) (>= (first nums) -5))
          (+ (first nums) (sum-inrange (rest nums)))
          (sum-inrange (rest nums)))))

(test (sum-inrange (list 1 2 3 4 5 6)) 0)
(test (sum-inrange empty) 0)
(test (sum-inrange (list -2 -3 -4 -5)) -14)
(test (sum-inrange (list -2 3 -4 5)) -6)

; #3 Write a function startswith? which takes as input two strings and returns true if the first string begins with the second.
(define (startswith? (str1 : string) (str2 : string))
  (if (< (string-length str1) (string-length str2))
      false
      (string=? (substring str1 0 (string-length str2)) str2)))

(test (startswith? "abcde" "a") true)
(test (startswith? "abcde" "abc") true)
(test (startswith? "a" "abcde") false)
(test (startswith? "abcde" "b") false)

; #4 Write a function replaceP which takes a list of strings and replaces every string starting with 'P' with 'none', keeping the other elements unchanged.
(define (replaceP (strings : (listof string)))
  (if (empty? strings)
      empty
      (if (string=? (substring (first strings) 0 1) "P")
          (cons "none" (replaceP (rest strings)))
          (cons (first strings) (replaceP (rest strings))))))
      

(test (replaceP empty) empty)
(test (replaceP (list "Tomatoes" "Dill")) (list "Tomatoes" "Dill"))
(test (replaceP (list "Potatoes" "Tomatoes" "Dill")) (list "none" "Tomatoes" "Dill"))

; #5 Write a function alternating which takes a list (any type of element) and returns a list containing every other element (i.e., only even-numbered elements).
(define (alternating lst)
  (if (or (empty? lst) (= (length lst) 1))
      empty
      (cons (second lst) (alternating (rest (rest lst))))))

(test (alternating empty) empty)
(test (alternating (list 1)) empty)
(test (alternating (list 1 2 3 4)) (list 2 4))
(test (alternating (list "hi" "there" "mom")) (list "there"))

; #6
; Define a datatype called Scores, which contains a homework 1 score (non-negative number), a homework 2 score (non-negative number),
; a homework 3 score (non-negative number), and a "extra_points" field (a boolean).
; Use scores as the name of the constructor. The define-type does not need to enforce that the numbers are non-negative,
; use number and we will agree not to test outside that range.
;
; Then, define a datatype called Students with two variants: an undergrad has a name, grades (of type Scores), and a graduation year.
; A graduate has a name, grades (of type Scores), and a degree program ("MS" or "PhD"). (undergrad and graduate should be the names of your constructors).
; Your define-type does not need to enforce the specific strings for the degree, just use the string type.
(define-type Scores
  [scores (hw1 : number) (hw2 : number) (hw3 : number) (extra_points : boolean)])

(define-type Students
  [undergrad (name : string) (grades : Scores) (grad_year : number)]
  [graduate (name : string) (grades : Scores) (degree : string)])

; #7 Write a function assign-points that takes a list of students and produces a list of students in which each student is assigned extra points (extra_points set to true)
; if the minimum score across all three homeworks is above 80.
(define (assign-points (students : (listof Students)))
  (if (empty? students)
      empty
      (cond
        [(undergrad? (first students))
         (if (and (and (> (scores-hw1 (undergrad-grades (first students))) 80) (> (scores-hw2 (undergrad-grades  (first students))) 80)) (> (scores-hw3 (undergrad-grades  (first students))) 80))
             (cons (undergrad (undergrad-name (first students)) (scores (scores-hw1 (undergrad-grades  (first students))) (scores-hw2 (undergrad-grades  (first students))) (scores-hw3 (undergrad-grades  (first students))) true) (undergrad-grad_year (first students))) (assign-points (rest students)))
             (cons (undergrad (undergrad-name (first students)) (scores (scores-hw1 (undergrad-grades  (first students))) (scores-hw2 (undergrad-grades  (first students))) (scores-hw3 (undergrad-grades  (first students))) false) (undergrad-grad_year (first students))) (assign-points (rest students))))]
        [(graduate? (first students))
         (if (and (and (> (scores-hw1 (graduate-grades  (first students))) 80) (> (scores-hw2 (graduate-grades  (first students))) 80)) (> (scores-hw3 (graduate-grades  (first students))) 80))
             (cons (graduate (graduate-name (first students)) (scores (scores-hw1 (graduate-grades  (first students))) (scores-hw2 (graduate-grades  (first students))) (scores-hw3 (graduate-grades  (first students))) true) (graduate-degree (first students))) (assign-points (rest students)))
             (cons (graduate (graduate-name (first students)) (scores (scores-hw1 (graduate-grades  (first students))) (scores-hw2 (graduate-grades  (first students))) (scores-hw3 (graduate-grades  (first students))) false) (graduate-degree (first students))) (assign-points (rest students))))])))

(define ec (scores 85 85 85 false))
(define afterec (scores 85 85 85 true))
(define noec (scores 81 81 79 false))

(define s1 (undergrad "kyle" ec 2021))
(define s1after (undergrad "kyle" afterec 2021))
(define s2 (graduate "kyle" noec "BS"))

(test (assign-points empty) empty)
(test (assign-points (list s1)) (list s1after))
(test (assign-points (list s2)) (list s2))
(test (assign-points (list s1 s2)) (list s1after s2))

; #8 Write a function all-phd-haveextra? which consumes a list of students and produces a boolean indicating whether all phd students have achieved extra points
; (to be clear: assume the list has already been processed by assign-points).
(define (all-phd-haveextra? (students : (listof Students)))
  (if (empty? students)
      true
      (if (and (and (graduate? (first students)) (string=? (graduate-degree (first students)) "PHD")) (equal? (scores-extra_points (graduate-grades (first students))) false))
          false
          (all-phd-haveextra? (rest students)))))

(define ec1 (scores 85 85 85 true))
(define phd1 (graduate "kyle" ec1 "PHD"))
(define phd2 (graduate "kyle" noec "PHD"))
(define phd3 (graduate "kyle" ec1 "PHD"))
(define ms1 (graduate "kyle" ec1 "MS"))

(test (all-phd-haveextra? (list phd1 phd2)) false)
(test (all-phd-haveextra? (list phd2 ms1)) false)
(test (all-phd-haveextra? (list phd1 phd3)) true)

; #9 Write a function rainfall which takes a list of numbers representing daily rainfall readings. The list contains irrelevant values up to the first occurrence of the number -999.
; After that, the function should average all non-negative values encountered until the end of the list. Note that -999 may never show up in the list.
; It may also show up multiple times, but all occurrences past the first one should be ignored
(define (rainfall (readings : (listof number)))
  (cond
    [(empty? readings) 0]
    [(= (first readings) -999) (let ([processed (filter positive? readings)]) (/ (sum processed) (length processed)))]
    [else (rainfall (rest readings))]))

(define (last list)
  (first (reverse list)))

(define (positive? (num : number))
  (>= num 0))

(define readings1 (list 1 1 1 -999 1 2 3 4 5))
(define readings2 (list 1 1 1 1 1 1))
(define readings3 (list 1 1 -999 1 2 3 4 5 -999 6 7 -999))

(test (rainfall readings1) 3)
(test (rainfall readings2) 0)
(test (rainfall readings3) 4)

; #10 An online clothing store applies discounts during checkout. A shopping cart is a list of the items being purchased.
; Each item has a name (a string like "shoes") and a price (a real number like 12.50).
; Write a function called checkout that consumes a shopping cart and produces the total cost of the cart after applying the following two discounts:
;
;     (i) if the cart contains at least $100 worth of hats, take 20% off the cost of all hats (match only items whose exact name is "hat")

;     (ii) if the cart contains at least two shoes, take $10 off the total of the cart (match only items whose exact name is "shoes")

; Each of these discounts applies to the total value of the cart before any discount is considered.
(define-type CartItem
  [item (name : string) (price : number)])

(define (checkout (items : (listof CartItem)))
  (if (empty? items)
      0
      (+ (+ (item-total items) (hat-discount (filter-items items "hat"))) (shoes-discount (filter-items items "shoes")))))
      
(define (hat-discount (items : (listof CartItem)))
  (if (empty? items)
      0
      (if (>= (item-total items) 100)
          (- 0 (sum (map discount20 items)))
          0)))
      
(define (shoes-discount (items : (listof CartItem)))
  (if (empty? items)
      0
      (if (>= (length items) 2)
          -10
          0)))

(define (filter-items (items : (listof CartItem)) (item : string))
  (if (empty? items)
      empty
      (if (string=? item (item-name (first items)))
          (cons (first items) (filter-items (rest items) item))
          (filter-items (rest items) item))))

(define (item-total (items : (listof CartItem)))
  (if (empty? items)
      0
      (+ (item-price (first items)) (item-total (rest items)))))

(define (discount20 (item : CartItem))
  (* (item-price item) 0.2))

(test (checkout empty) 0)
(test (checkout (list (item "hat" 25) (item "bag" 50) (item "hat" 85) (item "shoes" 15))) 153)
(test (checkout (list (item "hat" 30) (item "bag" 150) (item "shoes" 30) (item "shoes" 15))) 215)
