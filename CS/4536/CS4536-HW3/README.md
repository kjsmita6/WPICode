# Homework #3
WPI CS 4536, 2019/20 Term D - Homework #3
Assigned: 4/23/2020 11AM
Due: 4/30/2020 11AM

The goal of this homework is, as usual, to implement a variant of the language we have been building in class. In this case, the language requires you to extend the implementation of mutable state that we have seen in class to the case of multi-argument variables.

## Language Syntax
The syntax of the language is given in "mutations.starter.rkt" (this file can be found in Canvas, under the "Files" tab, "lectures" -> "lecture07" folder; or just follow the link above).

## Language Semantics
The homework language adds mutation, both explicit (boxes) and  implicit ( "set" on variables). At its core, this  language is based on the language in Chapter 8 of the text, with the addition of allowing:

In the core syntax:
1. A list of arguments to "fun" expressions, not just a single argument. Empty lists are ok!

And in the sugared syntax, we allow:
1. A list of bindings in "with" expressions, and
2. A list of expressions in "seq" expressions. Empty lists here are NOT ok.

Since we have mutation, we have to specify a few things
- In an application, evaluate the function first, then the arguments. (The arguments are all evaluated in the same environment, but NOT necessarily in the same store.)
- Evaluate the arguments to a function in left-to-right order.
- The set and setbox operators return the value that has been assigned to the variable or box contents (i.e., both (set x 5) and (setbox b 5) should return (numV 5)).

## Notes
- You do not need to edit the parser. Don't test programs with parse errors (we won't either in grading your work).
- The desugaring of with into an applied fun doesn't need to change from hw2. So that's given to you.
- The desugaring from the arbitrary-non-empty-list argument secS into the two-argument seqC should be relatively easy. Remember that a one-argument seqS is not an error!
- The code for interpreting boxC, unboxC, setboxC, setC, and seqC is just as given in the text!
- So, at a high level, the only interp thing you have to do in this hw is adapt the text code for apply to the multiargument case. So, maybe you're thinking: "that sounds easy, I'll do it right before the deadlinw". But there's actually a fair amount to do, so don't get complacent! True, it's not hard to see what to do but implementing it will really test your understanding of the ideas for the single-variable case.
- You will see that I have laid out the apply function in a rather verbose and explicit way. This is meant to help, but if you prefer to organize writing your apply in a different way, that's ok too!
- If you are familiar with currying, you might be tempted to finess the multiple-function-argument issue by treating multiple-argument functions as syntactic sugar for curried functions. DON'T DO THAT. These are not equivalent, in the presence of mutation.
- The starter file contains two functions, run and run-v that take a program in the given grammar (as an s-expression) and run it through all the stages of your implementation. run evaluates the program in an empty environment and empty store, while run-v does the same thing but only returns the Value part of a Result. This run function is the more natural function, since the store really only exists as a tool used to get ultimate values, but run-v is good to use sometimes in your debugging.

## Grading
- To assess the correctness of your interpreter, we will run your implementation against our master test suite to check whether it implements the expected behavior (semantics) of this language. We will use the run-v function in mutation.starter.rkt
- To assess the thoroughness of your tests, we will run them on a suite of broken implementations. It is expected that you write one or more tests for each of the following functions:

1. override-store
2. desugar
3. interp-list
4. interp
5. apply

### Grading rubric
- Correct desugaring: 3 points
- Correct interpretation: 4 points
- Program returns correct error messages: 2 points
- Tests are comprehensive: 1 points