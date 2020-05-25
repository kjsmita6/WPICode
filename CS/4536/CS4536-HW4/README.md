# Homework #4
WPI CS 4536, 2019/20 Term D - Homework #4

Assigned: 4/30/2020 11AM

Due: 5/7/2020 11AM

This homework differs from homework #2 and #3 in that you will be asked to implement type-checking for a language, rather than implementing the interpreter for that language. As a result, the language is going to be somewhat different/more complex than the ones you have seen and implemented so far. This is necessary to challenge you with the implementation of some non-trivial type checking code.

## Assignment
Your job is to implement a type checker for the language of expressions given below in "Language Specifications".  A starter kit including a parser and other goodies is given in the file "starter.type-checking.rkt" (follow the link or look into the folder for lecture 9). Also, there is no sugaring/de-sugaring in this assignment: you  will work with typing for ExprS expressions.

It is very important to understand that you are NOT writing an interpreter for this language - just the type-checker. Please make sure you understand this before you look at the language or get to work. In practice, much like the previous homeworks, you should be able to complete this assignment by filling in the "undefined" parts in the starter kit (but you can modify any part of the starter kit if you deem it necessary).

Dealing with type errors: When an expression fails to type-check, it is ok to simply throw an error. It would be much nicer, of course, for type-checking to give a nice informative error message as to what went wrong and where, but you can just keep it simple here. Make sure your error message has the phrase "type error". That's what  we will be looking for in our automated tests.

## Starter kit
The starter kit is provided in the file "starter.type-check.rkt".

## Language specifications
In this assignment, you will work with a typed language that includes numbers, booleans, conditionals, functions, and lists of numbers. The concrete syntax for the language is given by the following BNF grammars:

```
<expr> ::= <num>
         | tru
         | fls
         | (+ <expr> <expr>)
         | (- <expr> <expr>)
         | (* <expr> <expr>)
         | (iszero <expr>)
         | (bif <expr> <expr> <expr>)

         | <id>

         | (with ((<id> <expr>)) <expr>)
         | (rec ((<id> <expr>)) <expr>) 
         | (fun (<id> : <type>) : <type> <expr>)
         | (<expr> <expr>)

         | nempty
         | (ncons <expr> <expr>)
         | (nempty? <expr>)
         | (nfirst <expr>)
         | (nrest <expr>)

<type> ::= number
         | boolean
         | nlist
         | (<type> -> <type>)
```

In practice, this is very similar to what you have seen in the book.

### Note on with construct
The with construct in this language takes only a single binding. We have retained the extra set of parentheses around this binding in case you want to reuse some test expressions from earlier assignments. The parser will, however, throw an error if you introduce more than one binding in a single with statement.

### Note on surface syntax for types
In the surface syntax for types, base types are represented by symbols, and the arrow type by a list of three elements: the type of the argument, the symbol ->, and the type of the result. This surface syntax gets used when writing lambda expressions. Here is an example of annotating a function that consumes a number and returns a function:

```
  (fun (x : number) : (number -> number)
    (fun (y : number) : number
      (+ x y)))
```

### New constructs!
The language for this assignment has some constructs that you have not implemented this term. However, all should be familiar to you from your prior programming experience:

- iszero consumes a number, and returns true if it is 0, false otherwise

- the test expression of bif ("boolean if") must evaluate to true or false

- ncons consumes a number and a numeric list, and produces a numeric list. The other list-like operators consume a numeric list and perform the corresponding operation (first, rest, etc).

- the construct rec defines recursive functions. The right hand side of the rec binding must be, syntactically, a fun expression. In other words, the following expression is legal:


```
(rec ((f (fun (n : number) : nlist
           (f (- n 1)))))
           (f 12))
```

while the following are not legal:


```
(rec ((f (with ((y 4)) 
               (lambda (x) (f y))))) 
       ...)
     (rec ((f f))
       ...)

     (rec ((f (+ 1 f)))
       ...)
```
     
You may assume that all of our test cases will respect this  assumption.

### Typing
Here is a specification of the typing rules for the core fragment of this language: identifiers, numbers, addition, application, and functions. These rules comprise the correctness condition for your type-checker (the type-of function in the starter kit, that you will have to implement). In other words, they tell you how your type checker is expected to behave in the presence of expressions of various types.  I leave it to you to formalize the appropriate rules for the other language constructs. Note that those rules are meant to provide a guidance - a "specification" of sort for your code. You do not need to include any such rule in your solution, just upload your code.

```
TypeEnv = listof (symbol, type)
type-of : Expr x TypeEnv -> Type
```

### Inference rules

If you find the following rules hard to digest: they simply express pre- and post-conditions. A rule such as:

```
A
B
-----
C
```

means that, whenever your code encounters conditions A and B, your code should produce C. Also note that the term inference here does not refer to type inference, as you are asked to implement type checking. It just refers to the process through which you are going to use basic rules to check that the programmer's type annotations are correct. This works exactly as we have seen in class when we discussed type checking.

Numbers:

```
n is a number
-------------------------
type-of n te = number
```

Identifiers:

```
x is an identifier
---------------------
type-of x te = te(x)
```

Sum:

```
type-of e1 te = number
type-of e2 te = number 
-----------------------------
type-of (+ e1 e2) te = number
```

Function application:

```
type-of f te = T1 -> T2
type-of arg te = T1 
-----------------------------
type-of (f arg) te = T2
```

Function definition:
 
```
type-of bdy te[x : T1] = T2
----------------------------------------------
type-of (fun (x : t1) : T2 bdy ) te = T1 -> T2
```

## Submission and grading
Submit your work in Canvas, using the appropriate assignment for homework #4. Grading will consider the following aspects:

- types of basic language constructs: arithmetic, conditionals, list, with: 3 points
- identifiers and type environment: 3 points
- type-checking functions (definition and applications): 2 points
- type-checking recursive functions: 2 points

Differently from the previous submissions, we will not grade your tests. However, we will use tests to grade your code, so it is still important that you write your own to make sure everything works correctly. Some sample tests are provided in the starter kit.