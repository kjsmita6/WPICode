## CS 2102 - Bterm 17

## Lab 3 - Planning Programs

_Thank you to Prof. Kathi Fisler for designing the lab exercises for this course._

### Lab Objectives

*   To get you to think about different code organizations for problems that use lists
*   To practice designing a class hierarchy

### Preliminaries

*   Sign the attendance sheet.

### What you should do

#### Task 1: A Programming Problem

Up until now, all of the programs you have had to write (here and in CS1101 if you took it) needed a straightforward traversal of the input data (in CS1101 terms, they followed the templates). Often, we need to write programs that combine multiple tasks on the same data. Then we have to think about how to organize the code. This organizational task is called planning.

To investigate what we mean by planning, we want you to write a program that involves multiple tasks.

Create a class called `Planning` and put your solution to the following problem in that class.

**The Problem**: Write a method called `rainfall` that consumes a `LinkedList<Double>` representing daily rainfall readings. The list may contain the number -999 indicating the end of the data of interest. Produce the average of the non-negative values in the list up to the first -999 (if it shows up). There may be negative numbers other than -999 in the list (representing faulty readings). If you cannot compute the average for whatever reason, return -1.

For example, given a list containing (1.0, -2.0, 5.0, -999.0, 8.0), the program would return 3.0 (the average of 1.0 and 5.0).

Make sure you write a set of test cases for your program.

#### Task 2: Designing a class hierarchy

This problem is intentionally a bit vague, to give you practice turning a more realistic problem into a class hierarchy. Just figure out the class names and field declarations (names and types). You don’t need to write constructors, methods, etc. This would be a good problem to review with staff if you are unsure of your answers or just want a sanity check.

**Problem**: A medical research team needs to manage information about its experiments with mice. Each mouse is assigned to a particular regimen of a food to eat, how many grams of that food to eat per meal, how many treadmill workouts to do each day, and how many minutes each workout should last. Each day, the team weighs the mice, recording the date of the experiment along with the weight (and tying each piece of data to a specific mouse).

Design a set of classes to capture this scenario, including field names and types, any class extensions or abstract classes, and any interfaces you think you might need.

### What to Turn In

Submit a `zip` of the `.java` files that you produced for this assignment to [InstructAssist](https://ia.wpi.edu/cs2102/). The name of the InstructAssist project is **Lab 3**.

* * *