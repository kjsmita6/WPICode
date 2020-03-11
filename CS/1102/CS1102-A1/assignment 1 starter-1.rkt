;Andrew Markoski amarkoski@wpi.edu
;Kyle Smith kjsmith@wpi.edu
(require 2htdp/image)


; Question 1.  Write a function that takes as input three colors, and draws 3 overlapping rings -- one
; of each color.  The first two circles should overlap so that the endpoint of one circle is the horizontal
; midpoint of the other.  The third circle should be centered, and vertically offset so its top is the
; middle of the other two circles.

; Hint:  you know about the function "circle."  Right click and look in the docs for related image
; functions that might help.

(check-expect
 (three-rings "red" "green" "blue" 80)

 .
 )

(check-expect(three-rings "yellow" "purple" "black" 314.159) ; testing different colors and decimal radius
             .)

;;String String String Number -> Image
;;Creates three overalapping circles that have the given colors and radius

;(define (three-rings color1 color2 color3 r)(circle 0 "outline" "red"))

(define (three-rings color1 color2 color3 d)
  (overlay/offset
   (overlay/offset (circle (/ d 2) "outline" color1)
                   (/ d 2) 0
                   (circle (/ d 2) "outline" color2))
   0 (/ d 2)
   (circle (/ d 2) "outline" color3)))




; Question 2.  Write a function that responds to an input string according to whether it is a question, 
; an exclamation, a declarative sentence, or none of those.  You can assume the type of sentence is based
; on whatever type of punctuation is at the end of the string.


(check-expect 
 (respond "is this working correctly?")
 "Were you trying to ask a question?")

(check-expect
 (respond "please work correctly!")
 "You tried to tell me to do something!")

(check-expect
 (respond "I think this function is working correctly.")
 "Thank you for the information.")

(check-expect
 (respond "woohoo!o")
 "I'm confused...")

(check-expect (respond "?" )"Were you trying to ask a question?") ;testing punctuation by itself in a string with length = 1

(check-expect (respond "") "I'm confused...") ;testing an empty string

;;String -> String
;;Returns a string stating whether a string is a question, exclamation, or a declarative sentence, or none of those

;(define (respond str)"")

(define (respond str)
  (cond[(string=? str "") "I'm confused..."]
       [(string=?(substring str (- (string-length str) 1)) "!") "You tried to tell me to do something!"]
       [(string=?(substring str (- (string-length str) 1)) ".") "Thank you for the information."]
       [(string=?(substring str (- (string-length str) 1)) "?") "Were you trying to ask a question?"]
       [else "I'm confused..."]))


; Question 3.  Write a function that takes as input an image, a color, and a border size, and creates 
; a frame around the image with the specified color.  The border size is the thickness of the border 
; in pixels around the inner image (not the thickness of the line).


(check-expect
 (draw-frame (rotate -45 (ellipse 50 80 "solid" "blue")) "green" 25)
 .)
  

(check-expect
 (draw-frame (ellipse 30 60 "solid" "blue") "red" -10)
 .)


(check-expect (draw-frame (triangle 50 "outline" "teal") "magenta" 30) ;testing a different shape within the frame
              .)

;;image string number -> image
;;Creates a frame with the specified color around the shape with a border 
;(define (draw-frame img str num) img)
(define (draw-frame img str num)
  (overlay(rectangle (+ (image-width img) num) (+ (image-height img) num) "outline" str) img))

; Question 4.  Write a function that inputs two images.  It scales the first image to be large (or small)
; enough to be the same size as the second image.  Your program should scale the image the smallest amount
; that will result in at least one of the dimensions of the two images being identical.
; 
; You are not responsible for neither image entirely encapsulating the other (as in the example provided)
; 
; Hint:  by defining constants and using those in the tests, it becomes much easier to expand the 
; test cases into Racket code.  This function will be tricky if you try to just start writing it, 
; but not so bad if you work in terms of generalizing your test cases.  


(define IMG1 (triangle  10  "outline" "green"))
(define IMG2 (ellipse 80 45 "solid" "blue"))

(check-expect (scale-image IMG1 IMG2)
              .)

(check-expect (scale-image (rectangle 50 90 "outline" "green")(ellipse 45 40 "outline" "red")) ;testing different shapes and the first image being scaled down
              .)

;;image image -> image
;;Scales the first image to be the same size as the second image and outputs the scaled image and second image as one image
;(define (scale-image img1 img2) img1)
(define (scale-image img1 img2)
  (overlay (scale(/ (image-height img2)(image-height img1)) img1)img2))
  


; Question 5. Create a function that takes as input a list of images.  It creates an image composed
; of overlaying all of the images on top of each other, placed on top of a white rectangle 300 x 300.
; You should make use of the constant (defined below) MTS in your answer that represents the rectangle.  
; When you overlay the images, if an image is taller than it is wide then that image should be rotated 
; by 45 degrees.  
; 
; For this question, you must follow the rules for defining your data, creating a template, 
; and specifying the template rules used.  
; 
; Hint:  you will need to create two templates (and therefore, two functions)


(define LOI
  (list
   (rectangle 150 120 "outline" "red")
   (triangle 120  "outline" "green")
   (rectangle 50 200 "solid" "blue")
   (ellipse 95 180  "outline" "cyan")))

(define MTS (rectangle 300 300 "outline" "white"))

(check-expect (overlay-images LOI)
              
              .)


(check-expect(overlay-images empty)MTS)

(define LOI1
  (list
   (rectangle 50 75 "solid" "yellow")
   (ellipse 80 40 "outline" "red")
   (circle 40 "solid" "orange")))

(check-expect(overlay-images LOI1) ; testing different shapes and colors
             .)


;;ListOfImages is one of:
;; - empty
;; -(cons(image ListOfImages))
;;interp. a list of images to be overlayed


;;ListOfImages -> Image
;;Overlay list of images onto one image
;;(define (overlay-images loi)(rectangle 0 0 "solid" "red"))

#;
(define (fn-for-loi loi)
  (cond
    ((empty? loi)(...))
    (else
     (...)(first loi)(fn-for-loi(rest loi)))))

;;Template Rules used
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Image ListOfImages)
;; - self-reference: (rest loi) is ListOfImages

(define (overlay-images loi)
  (cond
    ((empty? loi) MTS)
    (else
     (overlay(overlay-image(first loi))(overlay-images(rest loi))))))


;;Image -> Image
;;Rotates image if the image height is greater than the width
;;(define (overlay-image img) img)

#;
(define (fn-for-img img)
  (...img)
  )

(define (overlay-image img)
  (if (< (image-width img) (image-height img))
      (rotate 45 img)
      img))

             
        
               

; Question 6.  Create a function that takes a list of strings.  It returns the same list of 
; strings, except any string that ends in "!" is converted to be all uppercase.  
; 
; For this question, you must follow the rules for defining your data, creating a template, 
; and specifying the template rules used.  Note how similar it is to the same step for 
; Question 5.
; 
; Hint:  you probably want to make use of the provided upcase-string function


; Some constants that are helpful for building test cases


(define STR1 "hello, world.")
(define STR2 "how now brown cow")
(define STR3 "third string in the list!")
(define LOS (list STR1 STR2 STR3))

(check-expect (concat-strings LOS)
              (cons "hello, world." (cons "how now brown cow" (cons "THIRD STRING IN THE LIST!" empty))))


(check-expect (concat-strings empty)empty) ;testing an empty list
(check-expect (concat-strings (cons "test" (cons "" (cons "test!" empty))))(cons "test" (cons "" (cons "TEST!" empty)))) ; testing a list with an empty string and the string to be upcased in the middle of the list


;;ListOfStrings is one of:
;; - empty
;; - (cons(string ListOfStrings))
;;interp. a list of strings

;;ListOfString -> ListOfString
;;Convert letters in a string that ends in an exclamation point to upper case
;;(define (concat-strings list)list)

#;
(define (fn-for-los los)
  (cond
    ((empty? los) ...)
    (else
     (...)(first los)(fn-for-los(rest los)))))

;;Template Rules used
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Image ListOfStrings)
;; - self-reference: (rest los) is ListOfStrings

(define (concat-strings los)
  (cond
    ((empty? los) empty)
    (else
     (if(string=? (first los) "")
        (cons "" (concat-strings (rest los)))
        (if(string=? (substring (first los) (- (string-length(first los)) 1)) "!")
           (cons(upcase-string (first los))(concat-strings(rest los)))
           (cons(first los)(concat-strings(rest los))))))))



  ; Racket student language does not provide functionality to make a string upper case.
; I was going to have you write string-upcase as part of question 6, but realized how 
; ugly it got and decided to provide it.  If someone finds an elegant solution, please 
; let me know.
; 
; You do *not* need to understand this code, nor should you try to write code like
; it (for now)

  ;; helper function for upcase-string
  (define (upcase-helper loc loc2)
    (cond
      [(empty? loc) (reverse loc2)]
      [else
       (upcase-helper 
        (rest loc)
        (cons
         (char-upcase (first loc)) loc2))]))
    

  ;String -> String
  ;converts a string to uppercase
  ;; start the accumulator and some string hacking
  (define (upcase-string str)
    (list->string (upcase-helper (string->list str) empty)))

  (check-expect (upcase-string "abCDe!") "ABCDE!")


  