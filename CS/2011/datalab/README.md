# CS2011: D-Term 2018

# Data Lab: Manipulating Bits

# Assigned: March 12, Due: Friday, March 23, 8:00 PM

## 1 Introduction

The purpose of this assignment is to become more familiar with bit-level representations of integers and
floating point numbers. You’ll do this by solving a series of programming “puzzles.” Many of these puzzles
are quite artificial, but you’ll find yourself thinking much more about bits in working your way through
them.

## 2 Logistics

This is an individual project. While this assignment has itsown server at⁀cs2011.cs.wpi.edu, final submission
must be electronic via the Canvas system. In addition, see below for a ”Beat the Prof” contest.

Submissions to the contest and the assignment serverare not a substitute forsubmissions via Canvas. Clar-
ifications and corrections will be posted on the course Canvas site.

## 3 Handout Instructions

Start by creating a directory on your virtual machine to holdthis assignment. Then download the file
datalab-handout.tarfrom Canvas to this directory. Then give the command

```
unix> tar xvf datalab-handout.tar
```
This will cause a number of files to be unpacked in the directory. The only file you will be modifying and
turning in isbits.c.

Before you start:Insertyour nameandyour WPI usernamein a comment at the top of thebits.cfile.
The penalty for failing to include your name onany file of any submissionin this course is five points per
file. It does not count to include your name and/or username aspart of the name of a file or folder (although
you may be required toalsodo this), because files can easily become detached from theirnames.


Thebits.cfile contains a skeleton for each of the 15 programming puzzles. Your assignment is to
complete each function skeleton using onlystraightlinecode for the integer puzzles (i.e., no loops or con-
ditionals) and a limited number of C arithmetic and logical operators. Specifically, you areonlyallowed to
use the following eight operators:

```
! ̃ & ˆ | + << >>
```
A few of the functions further restrict this list, and some have fewer restrictions. Also, you are not allowed
to use any constants longer than 8 bits. See the comments inbits.cfor detailed rules and a discussion of
the desired coding style.

Note:For this assignment, we will always use 32-bit numbers. Bitsare numbered from the right, counting
from zero. So, the rightmost (least-significant) bit is bit 0, and the leftmost is bit 31.

## 4 The Puzzles

This section describes the puzzles that you will be solving inbits.c.

### 4.1 Bit Manipulations

Table 1 describes a set of functions that manipulate and testsets of bits. The “Rating” field gives the
difficulty rating (the number of points) for the puzzle, and the “Max ops” field gives the maximum number
of operators you are allowed to use to implement each function. See the comments inbits.cfor more
details on the desired behavior of the functions. You may also refer to the test functions intests.c. These
are used as reference functions to express the correct behavior of your functions, although they don’t satisfy
the coding rules for your functions.

```
Name Description Rating Max Ops
evenBits(void) Return word with all even-numbered bits set to 1 us-
ing only!, ̃,&,ˆ,|,+,<<, and>>.
```
#### 1 8

```
isTmax(x) Returns 1 if x is the maximum, two’s complement
number, and 0 otherwise.
```
#### 1 10

```
bitXor(x,y) xˆyusing only ̃and&. 1 14
conditional(x,y,z) Same asx? y : z. 3 16
greatBitPos(x) Return a mask that marks the position of the most
significant 1 bit. If x == 0, return 0. Example:
greatestBitPos(96) = 0x40.
```
#### 4 70

```
Table 1: Bit-Level Manipulation Functions.
```

### 4.2 Two’s Complement Arithmetic

Table 2 describes a set of functions that make use of the two’scomplement representation of integers. Again,
refer to the comments inbits.cand the reference versions intests.cfor more information.

```
Name Description Rating Max Ops
divpwr2(x,n) Computex/ 2 n 2 15
isNonNegative(x) x >= 0? 3 6
satMul3(x) Multiplies by 3, saturating to Tmin or Tmax if over-
flow.
```
#### 3 25

```
isLess(x, y) Return 1 ifx < y 3 24
isAsciiDigit(x) Return 1 if0x30 <= x <= 0x39(ASCII codes
for characters ’0’ to ’9’)
```
#### 3 15

```
trueFiveEighths(x) Multiplies by 5/8, rounding toward 0. 4 25
ilog2(x) Compute⌊log 2 (x)⌋ 4 90
```
```
Table 2: Arithmetic Functions
```
### 4.3 Floating-Point Operations

For this part of the assignment, you will implement some common single-precision floating-point opera-
tions. In this section, you are allowed to use standard control structures (conditionals, loops), and you may
use bothintandunsigneddata types, including arbitrary unsigned and integer constants. You may
not use any unions, structs, or arrays. Most significantly, you may not use any floating point data types,
operations, or constants. Instead, any floating-point operand will be passed to the function as having type
unsigned, and any returned floating-point value will be of typeunsigned. Your code should perform
the bit manipulations that implement the specified floating point operations.

Table 3 describes a set of functions that operate on the bit-level representations of floating-point numbers.
Refer to the comments inbits.cand the reference versions intests.cfor more information.

```
Name Description Rating Max Ops
float_neg(uf) Compute-f 2 10
float_i2f(x) Compute(float) x 4 30
```
float_twice(uf) Compute (^2) *f 4 30
Table 3: Floating-Point Functions. Valuefis the floating-point number having the same bit representation
as the unsigned integeruf.
Functionsfloat_negandfloat_twicemust handle the full range of possible argument values, in-
cluding not-a-number (NaN) and infinity. The IEEE standard does not specify precisely how to handle
NaN’s, and the IA32 behavior is a bit obscure. We will follow aconvention that for any function returning
a NaN value, it will return the one with bit representation0x7FC00000.


The included programfshowhelps you understand the structure of floating point numbers. To compile
fshow, switch to the handout directory and type:

```
unix> make
```
You can usefshowto see what an arbitrary pattern represents as a floating-point number:

```
unix> ./fshow 2080374784
```
```
Floating point value 2.658455992e+
Bit Representation 0x7c000000, sign= 0,
exponent= f8, fraction= 000000
Normalized. 1.0000000000 X 2ˆ(121)
```
You can also givefshowhexadecimal and floating point values, and it will decipher their bit structure.

## 5 Evaluation

Your score will be computed out of a maximum of 80 points basedon the following distribution:

42 Correctness points.

30 Performance points.

8 Style points.

Correctness points.The 15 puzzles you must solve have been given a difficulty rating between 1 and 4, such
that their weighted sum totals to 42. We will evaluate your functions using thebtestprogram, which is
described in the next section. You will get full credit for a puzzle if it passes all of the tests performed by
btest, and no credit otherwise.

Performance points. Our main concern at this point in the course is that you can getthe right answer.
However, we want to instill in you a sense of keeping things asshort and simple as you can. Furthermore,
some of the puzzles can be solved by brute force, but we want you to be more clever. Thus, for each function
we’ve established a maximum number of operators that you areallowed to use for each function. This limit
is very generous and is designed only to catch egregiously inefficient solutions. You will receive two points
for each correct function that satisfies the operator limit.

Style points.Finally, we’ve reserved 8 points for a subjective evaluation of the style of your solutions and
your commenting. Your solutions should be as clean and straightforward as possible. Your comments should
be informative, but they need not be extensive.

## 6 Autograding your work

We have included some autograding tools in the handout directory —btest,dlc, anddriver.pl—
to help you check the correctness of your work.


- **btest:** This program checks the functional correctness of the functions inbits.c. To build and
    use it, type the following two commands:

```
unix> make
unix> ./btest
```
```
Notice that you must rebuildbtesteach time you modify yourbits.cfile.
You’ll find it helpful to work through the functions one at a time, testing each one as you go. You can
use the-fflag to instructbtestto test only a single function:
```
```
unix> ./btest -f bitAnd
```
```
You can feed it specific function arguments using the option flags-1,-2, and-3:
```
```
unix> ./btest -f bitAnd -1 7 -2 0xf
```
```
Check the fileREADMEfor documentation on running thebtest program.
```
- **dlc** :This is a modified version of an ANSI C compiler from the MIT CILK group that you can use
    to check for compliance with the coding rules for each puzzle. The typical usage is:

```
unix> ./dlc bits.c
```
```
The program runs silently unless it detects a problem, such as an illegal operator, too many operators,
or non-straightline code in the integer puzzles. Running with the-eswitch:
```
```
unix> ./dlc -e bits.c
```
```
causesdlcto print counts of the number of operators used by each function. Type./dlc -help
for a list of command line options.
```
- **driver.pl** :This is a driver program that usesbtestanddlcto compute the correctness and
    performance points for your solution. It takes no arguments:

```
unix> ./driver.pl
```
```
Your instructors will usedriver.plto evaluate your solution.
```
## 7 Submission Instructions

Please copy yourbits.cfile to a file named<username>-bits.c, where<username>is your WPI
username. For example, if your WPI email address is wsmith2@wpi.edu, your file namemustbe

wsmith2-bits.c

It is essential that you duplicate your file and give the copy this new name as instructed, so that the auto-
grader can identify your file and return the appropriate grade.The penalty is 25% of the total project points
for not naming your file correctly, thereby requiring the TAsto manually rename your file.

Submit this file using the Web-based Canvas system. This assignment is calledDatalab.


## 8 Notes and Advice

- This is anindividual assignment. You may discuss general strategy for solving any puzzle, but you
    may not copyor even look atanyone else’s code, including solutions found online. In previous terms,
    several students were found to have identical code for a number of the puzzles, all copied from the
    same online source.
- Don’t include the<stdio.h>header file in yourbits.cfile, as it confusesdlcand results in
    some non-intuitive error messages. You will still be able touseprintfin yourbits.cfile for
    debugging without including the<stdio.h>header, althoughgccwill print a warning that you
    can ignore.
- Thedlcprogram enforces a stricter form of C declarations than is the case for C++ or that is enforced
    bygcc. In particular, any declaration must appear in a block (whatyou enclose in curly braces) before
    any statement that is not a declaration. For example, it willcomplain about the following code:

```
int foo(int x)
{
int a = x;
a *= 3; /* Statement that is not a declaration*/
int b = a; /* ERROR: Declaration not allowed here */
}
```
## 9 The “Beat the Prof” Contest

For fun, we’re offering an optional “Beat the Prof” contest that allows you to compete with other students
and the instructor to develop the most efficient puzzles. Thegoal is to solve each Data Lab puzzle using the
fewest number of operators. Students who match or beat the instructor’s operator count for each puzzle are
winners!

To submit your entry to the contest, type:

```
unix> ./driver.pl -u ‘‘Your Nickname’’
```
Nicknames are limited to 35 characters and can contain alphanumerics, apostrophes, commas, periods,
dashes, underscores, and ampersands. You can submit as often as you like. Your most recent submission
will appear on a real-time scoreboard, identified only by your nickname. You can view the scoreboard by
pointing your browser at

```
http://cs2011.cs.wpi.edu:
```
Submitting your solution to the “Beat the Prof” contest isnot a substitutefor submitting it to Canvas. That
is, the contest server keeps track of scores by nickname, butit does not keep copies ofbits.cfiles. The
graders need thebits.cfiles (appropriately named) in order to award grades.


