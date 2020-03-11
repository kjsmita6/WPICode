## CS 2102 - B-term 17

## Homework 2 - Abstract Classes and Programming with Lists

### Due: Tuesday, November 7 at 5pm

Read the [Expectations on Homework](http://www.cs.wpi.edu/~cs2102/common/hw-expectations.html).

## Important Reminders

*   Please use the default package in your Java project. There will be a penalty for using a named package.
*   Starting with this assignment, please include a purpose statemnt above each method. There will be a penalty for forgetting your purpose statements.
*   Starting with this assignment, a grading rubric will not be provided.

## Assignment Goals

*   To be able to share data/code among classes using abstract classes
*   To use the Java LinkedList class
*   To become familiar with element-based for loops

**Note to those with prior Java experience:** One goal of 2102 is to help everyone learn when different iteration constructs (for, while, etc) are needed for a particular problem. Style grading will check whether you are using appropriate constructs. This week, we will cover the per-element style for loop, not the for loop that uses a variable to index into elements. For full points, do not use index-based for loops on this assignment. Use a per-element style loop instead.

We will have covered the material for questions 1 and 2 by the end of Tuesday. We will do lists by Friday.

* * *

## Problem Statement

This week, we extend your initial classes for athletic competitions so you can practice programming with lists in Java. We also add a new kind of event so you can practice working with abstract classes.

1.  Another Nordic event in the Olympics is called the Mass Start event. This is similar to a marathon for runners; all the skiers assemble en masse and the first skier to cross the finish line wins. Add a class `MassStartResult` to your project. Like a `SkiingResult`, a `MassStartResult` has a finishing time and position. However, the `pointsEarned` for a mass start race is simply the finishing time (position is irrelevant). `MassStartResult` should also be an IEvent.

    Create abstract classes as needed to share appropriate details between `SkiingResult` and `MassStartResult`. You may use whatever names you wish for these classes.

    Do NOT add a `MassStartResult` field to your `Athlete` class. We are simply creating the ability to have a new kind of event, but the athletes in this assignment will not participate in it. Larger projects often have classes that don't get used in all scenarios.

2.  Add a name field (type String) to the `Athlete` class.
3.  Create a class `Competition`, which contains an integer indicating the (non-negative) number of `ShootingRound`s to be used in this competition. It should also contain a `LinkedList` of `Athlete`s.
4.  Modify your `ShootingResult` class to now contain a list of `ShootingRound`s (rather than a fixed four rounds). We assume the rounds are in order (the first round went first, the second went second, etc).
5.  Modify `pointsEarned` in `ShootingResult` to now total the points across all rounds in the list.
6.  Write a method called `bestRound` in the `ShootingResult` class to return the best round in the list. If there is a tie between the top two rounds, just return one of the rounds.

    _Pay particular attention to creating a thorough set of tests for this method._

7.  Within a single competition, all of the athletes should have completed the same number of rounds in the Shooting event. Write a method in the `Competition` class called `shootingDNF` (for "did not finish"), which produces a `LinkedList` of the names of the Athletes in the competition whose list of `ShootingRound`s is less than the number of rounds stored in the `Competition` class.

    The names of the Athletes should occur in the same order in the returned list as they were in the list within the Competition.

8.  Write a method in the `Competition` class called `skiingScoreForAthlete`, which takes the name of an athlete and returns the score that the athlete earned in the skiing race. You may assume that no two athletes have the same name. You may also assume that the athlete name given is in the competition (we'll talk about how to handle error cases later in the course).
9.  Write a method in the `Competition` class called `anySkiingImprovement`, which takes another `Competition` as input and returns true if any of the athletes in "this" competition had a better Skiing score than they had in the given competition. You may assume that both competitions have the same athletes, but the athletes may appear in different orders within the athlete lists in both competitions.

    _Pay particular attention to creating a thorough set of tests for this method._

10.  Look back on your solutions to `skiingScoreForAthlete` and `anySkiingImprovement`. In hindsight, do you see any helper methods that you should have written that could have been shared over those two problems, or are you happy with how you organized the code?

    Put your answer (a couple of sentences) in a comment at the bottom of your `Competition` class. You do not need to write any code or rewrite either method for this question. We're just asking you to reflect on your code and tell us what changes you might have made were you to do this pair of problems again.

## Support Files

Here are three files that may be helpful. You can download these directly into your project directory for this assignment.

*   a basic [Main.java](https://web.cs.wpi.edu/~cs2102/b17/Code/Main.java) file, which Java needs to compile and run your program.
*   a skeletal [Examples.java](https://web.cs.wpi.edu/~cs2102/b17/Code/Examples.java) file showing you the imports that you need in order to include JUnit and the shape of a test case. Remove the sample test case as you add your own.
*   a [checking stub file](https://web.cs.wpi.edu/~cs2102/b17/hw2/CompileCheck.java) that attempts to create objects from the expected classes and call the expected methods within those classes. Including this file when you compile will check that you have the class and method names that our grading tools expect, which saves you from losing points.

    If you get a compilation error involving this file on a class or method that you defined, **do not edit this file; edit your files instead!** As you are working, you may wish to comment out sections of the file that check methods you haven't written yet (that's fine). The final work you turn in should, however, compile against the entire contents of this file.

    You are welcome to leave this file in the directory when you submit your work.

## Grading

The grading rubric for Homework 2 will not be posted.

Here are some details on what we will look for in grading this assignment:

*   Did you create classes with the fields required in the problem?
*   Do your methods produce the answers expected based on the problem statements?
*   Is each method (in both classes and interfaces) documented with a brief purpose statement?
*   Is your code neatly indented and presented in a clean, readable manner?
*   Are your test cases correct relative to the problem statement?
*   Are your test cases thorough, covering different situations (based on input data) and exercising all of your code?

_Programs must compile in order to receive credit._ If you submit a program that doesn't compile, the grader will notify you and give you one chance to resubmit within 24 hours; a penalty (25% of the total points for the assignment) will be applied as a resubmission penalty. Code that is commented out will not be graded.

## What to Turn In

Submit (via [InstructAssist](https://ia.wpi.edu/cs2102/)) a single zip file (not tar, rar, 7zip, etc) containing all of your .java files that contain your classes, interfaces, and examples for this assignment. The name of the project in InstructAssist is **Homework 2**. Do not submit the .class files. Make sure all of your tests are in separate files from your code, as explained in the [Expectations for Preparing Homework](https://web.cs.wpi.edu/~cs2102/common/hw-expectations.html). You may put all of your other classes and interfaces either into a single file or into separate ones (as you prefer). If you have separate src and test subdirectories, you may retain that structure in your zip file.

Make sure that your test files include **ONLY** calls to methods that are listed in the assignment handout. If your tests include calls to other/helper methods or references to fields, your tests will fail to compile against our solution and we won’t be able to auto-grade your work.

* * *