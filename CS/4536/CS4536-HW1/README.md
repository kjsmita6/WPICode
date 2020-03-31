Homework #1
Assigned: 3/16/2020, 12PM
Due: 3/23/2020, 11AM

Overview
Our programming assignments will be done in the plai-typed dialect of Racket. This assignment makes sure you are prepared to program in this language.

For those students who learned Racket in CS1101/1102, the programming part of this assignment will refresh your memory and shift you from using define-struct to using define-type (we will use the latter in this course). The coding part of this assignment should go fairly quickly for those with prior experience in functional programming.

Submission
Put your solutions to all of the following problems in a single .rkt file (the default DrRacket format). Include your name in the file as a comment. Finally, compress the file in a zip archive and submit the archive to the Homework #1 deliverable assignment on Canvas.

Be sure to name your functions exactly as asked for below; obviously our tests will expect this. Of course you can define whatever auxiliary functions you like, and name them as you like.

The Problems
For each problem, provide the code and a few test cases. We won't rigorously grade your test cases for this assignment, but want you to get into the habit that you'll need for the rest of the course (where the tests you've written will sometimes count significantly).

You are welcome to use any built-in Racket operators or constructs that you know (including map and filter). Some Racket operators are not included in plai-typed, however. See the plai-typed documentation for a full list of the included operators.

Problem #1 (0.5 pts)
Write a function sum which takes a list of numbers and produces the sum of the numbers in the list.

Problem #2 (0.5 pts)
Write a function sum-inrange which takes a list of numbers and produces the sum of the numbers in the list whose value is between -2 and -5 (included).

Problem #3 (0.5 pts)
Write a function startswith? which takes as input two strings and returns true if the first string begins with the second (you are encouraged to review Racket's string primitives at https://docs.racket-lang.org/reference/strings.html (Links to an external site.); many of them are available in plai-typed).

Problem #4 (0.5 pts)
Write a function replaceP which takes a list of strings and replaces every string starting with 'P' with 'none', keeping the other elements unchanged. For example:

```scheme
(test (replaceP (list "Potatoes" "Tomatoes" "Dill")) (list "none" "Tomatoes" "Dill"))
```

Problem #5 (0.5 pts)
Write a function alternating which takes a list (any type of element) and returns a list containing every other element (i.e., only even-numbered elements). For example:

```scheme
(test (alternating (list 1 2 3 4)) (list 2 4))
(test (alternating (list "hi" "there" "mom")) (list "there"))
```

Problem #6 (1 pt)
Define a datatype called Scores, which contains a homework 1 score (non-negative number), a homework 2 score (non-negative number), a homework 3 score (non-negative number), and a "extra_points" field (a boolean). Use scores as the name of the constructor. The define-type does not need to enforce that the numbers are non-negative; use number and we will agree not to test outside that range.

Then, define a datatype called Students with two variants: an undergrad has a name, grades (of type Scores), and a graduation year; a graduate has a name, grades (of type Scores), and a degree program ("MS" or "PhD"). (undergrad and graduate should be the names of your constructors). Your define-type does not need to enforce the specific strings for the degree, just use the string type.

Problem #7 (1.5 pts)
Write a function assign-points that takes a list of students and produces a list of students in which each student is assigned extra points (extra_points set to true) if the minimum score across all three homeworks is above 80.

Problem #8 (1 pts)
Write a function all-phd-haveextra? which consumes a list of students and produces a boolean indicating whether all phd students have achieved extra points (to be clear: assume the list has already been processed by assign-points).

Problem #9 (2 pts)
Write a function rainfall which takes a list of numbers representing daily rainfall readings. The list contains irrelevant values up to the first occurrence of the number -999. After that, the function should average all non-negative values encountered until the end of the list. Note that -999 may never show up in the list. It may also show up multiple times, but all occurrences past the first one should be ignored

Problem #10 (2 pts)
An online clothing store applies discounts during checkout. A shopping cart is a list of the items being purchased. Each item has a name (a string like "shoes") and a price (a real number like 12.50). Write a function called checkout that consumes a shopping cart and produces the total cost of the cart after applying the following two discounts:

(i) if the cart contains at least $100 worth of hats, take 20% off the cost of all hats (match only items whose exact name is "hat")

(ii) if the cart contains at least two shoes, take $10 off the total of the cart (match only items whose exact name is "shoes")

Each of these discounts applies to the total value of the cart before any discount is considered.

Use the following datatype for shopping cart items:

```scheme
(define-type CartItem
[item (name : string) (price : number)])
```

As an example:

```scheme
(test (checkout
(list (item "hat" 25) (item "bag" 50)
(item "hat" 85) (item "shoes" 15))) 153)
```

Use the built-in Racket operator `string=?` to compare strings.