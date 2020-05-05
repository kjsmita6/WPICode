# Homework #2
WPI CS 4536, 2019/20 Term D - Homework #2
Assigned: 3/26/2020 11AM
Due: 4/2/2020 11AM

This homework requires you to implement a simple language similar to the one we have seen in class, and discussed in the book up to chapter 7. As part of the assignment, you will need to implement a few extensions to the language, described in this page.

## Language syntax & starter file
The syntax of the language is given in "first-class-funcs.starter.rkt" (this file can be found in Canvas, under the "Files" tab, "lectures" -> "lecture04" folder; or just follow the link above). In practice, your main job for this homework is to fill in the missing ("undefined") parts of the code given in the file.

As you can see from the ExprC and ExprS data types, we treat the "with" construct as syntactic sugar. Don't change that! Just as we described in class with "let",
`(with ( (x a) ) b)`
is syntactic sugar for

`( (fun (x) b) a )`
The desugaring you have actually implement is a little more involved that that because of the fact that with can bind several (or no) variables.
You do not need to edit the parser. Don't test programs with parse errors (we won't either in grading your work).
The starter file contains two functions, [run] and [run/env] that take a program in the given grammar (as an s-expression) and run it through all the stages of your implementation. run evaluates the program in an empty environment, while run/env takes an additional parameter with an initial environment (this may be useful to you in debugging).

## Language semantics
For homework #2, you are going to implement the language discussed up to the end of chapter 7 of the book (arithmetic expressions with lambda functions), with three additional features:

### Conditionals
Multiple arguments for (first-class) functions
Local variables, introduced via the "with" construct. Such variables might denote functions
Conditionals
A basic if-statement. To save the trouble of having to add a boolean type we just create the construct if0, which has three parts:

- A test expression
- A “then” expression, which is evaluated iff the test expression
evaluates to zero
- An “else” expression, which is evaluated iff the test expression
evaluates to a number other than zero
Evaluation should signal an error for non-numeric test values.

### Multi-argument functions
In this language, functions can accept a list of zero or more arguments (rather than the fixed single argument used in the text and lecture).

All arguments to the function are to be evaluated in the same environment. (That's important)

### Local Variables
The language adds a "with" construct for defining local variables. A with clause takes a series of bindings of identifiers to expressions and an expression in which to use the bindings (the body). For example:

```
(with ((x 3)
(y 5))
(+ x y))
```

The bindings introduced in a with are only visible in the body. In particular, they are not visible in the expressions bound to other identifiers in the same with statement. This semantics is equivalent to the let construct in Racket.

Use static scoping. (That's important.)

## Notes
1. We use the syntax "with" rather than "let" to help you avoid confusion between the language you are implementing and the language you are using to implement, ie Racket.

2. In the same way, we use the syntax "fun" rather than "lambda" but your "fun"s will behave just like Racket's "lambda"s

3. Note that, compared to the language in earlier chapters, the language does not have a separate category of standalone function definitions. We get the same effect using "with". For example, the following program defines a function named add1 and then calls it with 5 as an argument.

(with ((add1 (fun (n) (+ n 1))))
(add1 5))
4. Be careful that you make "with" behave the same way that "let" behaves in Racket, NOT as "let\*" behaves. For example the following should be an error if written at the top-level

```
(with ((x 3)
(y x)) ;; this x is NOT the x one line above
(+ x y))
```

## Grading
To assess the *correctness* of your interpreter, we will run your implementation against our master test suite to check whether it implements the expected behavior (semantics) of this language. We will use the [run] function seen in the code examples in class.
To assess the thoroughness of your *tests*, we will run your tests on our collection of broken implementations, to see how many of them your test suite can detect (by having a test case that passed our correct implementation but failed on the broken one). It will be important that your failed tests give error messages that are expected. See the next paragraph.
You can test whether running a program yields a particular error by using the test/exn construct, which takes the expression to run and a string that should be *contained within* the resulting error message. Your tests and implementation should provide/expect the following error substrings:
Grammar violation: substring "expected" (which is a substring of  "unexpected" if you prefer that)
Type error: substring "type"
Unbound identifiers: message must contain the substring "unbound"
Same identifier multiple times in the same with or parameter list: substring "multiple"

### Grading rubric
Feature implementation:
- Conditionals: 2 points
- Multi-argument functions: 2 points
- Local variables: 3 points

Testing and errors:
- Error messages returned as expected: 2 points
- Comprehensiveness of tests: 1 point

## Additional information and errata
- You are expected to write your own test cases to make sure your code is correct. We are going to test your code beyond the few tests provided in the starter kit (which are there mostly for your convenience and as examples)
- You should return an error if the number of parameters differs from the number of arguments in a function application. There are two helper functions to assist you with it: different-length? And length-mismatch-error. Unfortunately there is a typo in the latter as its warning message states "string lengths don't match" rather than "list lengths don't match". As long as there is "lengths don't match" in the error we'll accept it.
- In order to generate error messages, you can either alter the provided code or incorporate error checking in the implementation of the “undefined” parts. While you are by no mean prohibited to modify the starter code, I personally think it is much easier and safer to implement the needed checks within your own code.
- Someone has cleverly pointed out that returning an error for a call to sum w/o enough arguments (e.g. (+ 42)) would require modifying the starter code (as the interpretation of plusC is provided, and performs no error checking). You won’t be penalized if you do not catch this error (but feel free to modify the code so that the error is detected!).