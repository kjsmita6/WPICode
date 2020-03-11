#


Project 1 (100 points)
 Assigned: Monday, January 15, 2018
Due: Monday, January 22, 2018, 6:00 PM

Programming Assignment #1 — Display a 12-month Calendar


Programming Assignment #1 — Display a 12-month Calendar

### Abstract

Write a _C_ program called **PA1.c** that displays a twelve month calendar for an arbitrary year. Prompt the user for the year of the calendar, and print out the calendar month by month, so that it looks like a real calendar.

### Outcomes

After successfully completing this assignment, you should be able to:–

- Develop a _C_ program on a Unix or Linux platform
- Design a program that contains nested selection and iteration constructs and separate functions
- Specify the loop invariants that you use to reason about your program
- Use advanced formatting strings and conversion specifiers to do I/O in a _C_ program

### Before Starting

Re-read Chapter 1, Chapter 2, and sections §§3.1-3.5 K&amp;R. These chapters should be very easy because of the similarity to Java. It is also suggested that you complete _Lab #1_, either during the scheduled lab session or during your own time.

### The Assignment

Write a _C_ program that displays twelve-month calendar for a particular year. The program should prompt the user for the year to be printed, and then it should figure out (a) whether the year is a leap-year and (b) what day of the week the chosen year starts on.

The calendar should be formatted as shown in the sample execution below. Note that the numbers of the days must be right-justified under the names of the days and that two spaces separate the names of the days from each other.

#### Interfaces

The header file **<stdio.h>** provides the prototypes (interfaces) for the functions **printf()** and **scanf()**.

#### Assumptions and Restrictions

The user may enter any strictly positive integer for the year; if the user enters a number <= 0, print an informative error message and exit. You must calculate the calendar according to the modern international standard calendar (introduced by Pope Gregory XIII in the year 1582). For input years earlier than 1582, calculate them as if the modern calendar were in effect. In the modern calendar, years that are divisible by 4 are leap years, except that years divisible by 100 are not leap years unless they are also divisible by 400. That is, there are 97 leap years every four centuries.

You will have to figure out which day of the week the calendar starts on. You may do this by referring to a known year in which you know the day of the week of a particular date. You will then work backwards or forwards from that known date to find the start of the input year.1

### Sample Execution

**                        MONTHLY CALENDAR**

**Please enter year for this calendar:- 2009**

**  \*\*\*    CALENDAR for 2009   \*\*\***

**January 2009**

**Sun  Mon  Tue  Wed  Thu  Fri  Sat**

**                      1    2    3**

**  4    5    6    7    8    9   10**

** 11   12   13   14   15   16   17**

** 18   19   20   21   22   23   24**

** 25   26   27   28   29   30   31**

**February 2009**

**Sun  Mon  Tue  Wed  Thu  Fri  Sat**

**  1    2    3    4    5    6    7**

**  8    9   10   11   12   13   14**

**                 .**

**                 .**

**                 .**

(Output continues for all 12 months. Note that dates must be _right justified_ under day names.)

### Implementation Notes

Since we have not yet studied arrays, strings, or arrays of strings, you should design your algorithm to use **if-else** or **switch** statements to print the month names and to set other variables.

Note: Sometimes in this course we will require you to do something a particular way, because we want to be sure that you have practice in that technique. In that case, you **must** use the specified technique.

You should partition your program into at least three functions. Here is an example partition:–

- The function **main()** prompts the user for input, then calls a function of your own design to determine the starting day of the input year. It then invokes the function **printCalendar()** to actually print the twelve month calendar.
-
The function **printCalendar()** takes two arguments: the year number and the starting day2. It then loops through the year and calls the function **printMonth()** twelve times, once for each month.
- The function **printMonth()** takes three arguments: the year number, the month number, and the starting day of that particular month, and it returns the number of the day on which the next month starts. This function has to first call a function **printMonthName()** and then print out the days of the month in calendar format.
- The function **printMonthName()** takes the year number and the month number as arguments, prints out the line identifying the month, and returns the number of days in that month, taking into account leap year. The example output of **printMonthName()** should resemble the following:–

**January 2009**

Since we are not using arrays of strings, **printMonthName()** should use a **switch** statement to select and print the name of the month and to determine the number of days in that month. If the month is February, it should also figure out whether the year is a leap year and return the correct number of days.

You will probably find it easiest to design and implement in a _top-down_ manner. For example, design the main function as a series of calls to functions, where each function does one thing. Design each loop, figure out the initial conditions, ending condition, and step/increment; then fill in the body of the loop.

### Source Code Format

Your source code must all be in the single file **PA1.c**. It must be properly indented to show its structure. Don&#39;t forget: If you invoke a function before it is defined, you will need a function prototype somewhere before that function is invoked.

Your code must also be fully commented, including:

- A comment on each variable declaration, saying what the variable is used for. If information is encoded, this must be made clear. For example:

**int day; // Which day to print, where Sunday == 0**

- Javadoc-compatible Doxygen comments on all functions. This must include what the function does, the parameters, the return value, and anything special (such as warnings about input values).
- Description of what each loop does.
- For **if** statements, what is being tested, and which branch is which.
- Loop invariants, as described in the next section.
- Pre- and post-conditions for loops.

Remember: Comments show the intention of the program. Do not merely restate the obvious, like this:

  **j++; // Add 1 to j Bad comment!!**

### Algorithm and Loop Invariants

There are many sources on the web and at WPI for a suitable algorithm for this assignment. You may consult any of these, _but you must cite your source_. If you worked out the algorithm on your own, you should say in your write up file that this is entirely your work.

Note: If you borrow some or all of an algorithm from someone else or from somewhere else, _do not copy it_. Write it out in your own words and your own coding style. Also, please explain enough about how the algorithm works that the graders can conclude that you understand it.

This project requires at least two loops. For each loop, write one or more _loop invariants_ — that is, a logical statement in English or mathematical notation that says what salient facts are true about the relationships of the variables at the same point in the loop for each iteration.

Write each loop invariant as a comment in the body of the loop at the exact point during the execution of the loop body where the invariant is true; **this could be at the beginning of the body of the loop, at the end, and/or somewhere in the middle**. Also include information about each loop invariant in your **README** document below.

### Deliverables

Write a document called **README.txt** , **README.doc** , or **README.docx** summarizing your program, how to run it, and detailing any problems that you had. Also, if you borrowed all or part of the algorithm for this assignment, be sure to cite your sources _and_ explain in detail how it works. Be sure also to describe the _loop invariants_ of each loop.

From a browser, submit the _C_ source code file and **README** to _Canvas_.

Programs submitted after the due date Monday, 2018/01/22) will be tagged as late, and will be subject to the late homework policy, a penalty of 20% of the maximum points for the assignment, per day or partial day.

### Grading

Graders will compile your assignment by executing the following command on an _Ubuntu_ Linux system compatible with your course virtual machine:–

  **gcc –Wall –o PA1 PA1.c**

_Your program_ must _compile without errors in order to receive_ any _credit_ for this assignment_._ You _must not_ use any extra switches — for example, **-ansi** or **-std=C99**. These will cause incompatibilities that will cause it to fail to compile for the graders. If you do your work on some other system, you may find that your system adheres to a slightly different standard and that some details of the _C_ language may be different from those on the course virtual machine. Before submitting your assignment, be sure that it compiles on the course virtual machine and correct it if it does not.

This assignment is worth one hundred (100) points. See the grading form for more details.