Homework 1 - Classes and interfaces

CS 2102 - B-term 17
-------------------

Homework 1 - Classes, Methods, and Interfaces
---------------------------------------------

### Due: Tuesday, October 31, 2017, 5:00 pm

 Read the [Expectations on Homework](http://www.cs.wpi.edu/~cs2102/common/hw-expectations.html).

Assignment Goals
----------------

-   To be able to define classes with methods
-   To use JUnit to create a test suite
-   To be able to construct a hierarchy of classes and interfaces

* * * * *

Problem Statement
-----------------

One popular event in the winter Olympics is the biathlon. In this competition, athletes participate in two events, cross-country skiing and shooting. In this program you'll model athletes competing in the biathlon. Your job will be to create the initial software to record athletes’ results in these events and to provide methods that do some basic performance comparisons between individual athletes. Specifically, your tasks are as follows:

1.  Create an `Athlete` class with two fields: one holds a `ShootingResult` object and the other holds a `SkiingResult` object.
2.  The `ShootingResult` class holds four separate `ShootingRound` objects, one for each of four rounds (e.g., `round1`, `round2`, `round3`, and `round4`). Each `ShootingRound` stores the number of targets hit (out of five). Use `int` for this value. Assume that only valid numbers of targets hit will be created; you do not need to do any error checking at this point in the course.
3.  The `SkiingResult` class holds the time (in seconds) at which the athlete crossed the finish line in the cross-country race, the athlete’s position in the finishing order (1 for first, 2 for second, etc), and the athlete's ShootingResult. Use a double for the time and an int for the position.
4.  Each of `ShootingResult` and `SkiingResult` should implement an `IEvent` interface. This interface should require a method called `pointsEarned` which takes no additional inputs and returns a `double` representating an athlete’s score on that event.
    -   The points earned for a `ShootingResult` is the sum of the targets hit for each round.
    -   For most athletes, the points earned for a `SkiingResult` is the finishing time modified by the number of shots missed in each shooting round (see the next step regarding the addShootingPenalties method). Then, the points for the first place finisher takes 10 seconds off this modified finishing time. Similarly, the second-place finisher gets 7 points off, and the third-place finisher gets 3 points off. All other finishers have just their modified finishing time as the points.

5.  In the `SkiingResult` class, include a method called `addShootingPenalties`. This method should take a ShootingResult as an input and add 20 seconds for each target (out of five) missed in each round. It should return the modified time as a double.
6.  In the `Athlete` class, include a `betterSkiier` method that takes another `Athlete` as input and produces the athlete with the better (lower) Skiier score. Assume there are no ties (meaning we won’t test for ties and neither should you, as the behavior in event of a tie is not specified).
7.  In the `Athlete` class, include a `hasBeaten` method that takes another `Athlete` as input and returns a boolean indicating whether the athlete has either a higher Shooting score or a lower skiing score than the given (input) `Athlete`.
8.  Create a test suite for your work. Put all of your tests and test data in a class called `Examples`.

    **Note on testing Doubles:** When you want to use assertEquals to compare doubles, you include a third argument which is the allowable difference between the two values for them to still be considered equal. For example:

              assertEquals(5.0, 4.995, .01)

    returns `true`. Doubles can be imprecise due to the way they are represented within the computer, hence the need for this third argument.

    **Note on Writing Tests that Compare Objects**: A subtlety to JUnit (that we will talk about next week) affects how you write tests that compare objects. When writing these tests, name the objects for your rounds and use the names in the `assertEquals` test. The example below assumes that ShootingResult contains a hypothetical method called bestRound() that returns a ShootingRound:

              public class Examples {

                ShootingRound longRound = new ShootingRound(...);
                ShootingResult goodResult = new ShootingResult(... longRound ...);

                ...

                @Test
                public void testLongBest() {
                  assertEquals(longRound, goodResult.bestRound());
                }
              }

    You should NOT make a new `ShootingRound` for the expected answer in the `assertEquals`. Such a test would fail, even if the two rounds had the same contents (again, for reasons we will explain in detail in week 2).

Support Files
-------------

Here are three files that may be helpful. You can download these directly into your project directory for this assignment.

-   a basic [Main.java](https://web.cs.wpi.edu/~cs2102/b17/Code/Main.java) file, which Java needs to compile and run your program.
-   a skeletal [Examples.java](https://web.cs.wpi.edu/~cs2102/b17/Code/Examples.java) file showing you the imports that you need in order to include JUnit and the shape of a test case. Remove the sample test case as you add your own.
-   a [checking stub file](https://web.cs.wpi.edu/~cs2102/b17/hw1/CompileCheck.java) that attempts to create objects from the expected classes and call the expected methods within those classes. Including this file when you compile will check that you have the class and method names that our grading tools expect, which saves you from losing points.

    If you get a compilation error involving this file on a class or method that you defined, **do not edit this file – edit your files instead!** As you are working, you may wish to comment out sections of the file that check methods you haven’t written yet (that’s fine). The final work you turn in should, however, compile against the entire contents of this file.

    You are welcome to leave this file in the directory when you submit your work.

Grading
-------

You can find the grading rubric for this assignment by [clicking on this link](hw1/hw1-grading.xlsx). It will prompt you to download an Excel file.

Here are some details on what we will look for in grading this assignment:

-   Did you create classes with the fields required in the problem?
-   Do your methods produce the answers expected based on the problem statements?
-   Is your code neatly indented and presented in a clean, readable manner?
-   Are your test cases correct relative to the problem statement?
-   Are your test cases thorough, covering different situations (based on input data) and exercising all of your code?

*Programs must compile in order to receive credit.* If you submit a program that doesn't compile, the grader will notify you and give you one chance to resubmit within 24 hours; a penalty (25% of the total points for the assignment) will be applied as a resubmission penalty. Code that is commented out will not be graded.

What to Turn In
---------------

Submit (via [InstructAssist](https://ia.wpi.edu/cs2102/)) a single zip file (not tar, rar, 7zip, etc) containing all of your .java files that contain your classes, interfaces, and examples for this assignment. Do not submit the .class files. You may put all of your other classes and interfaces either into a single file or into separate ones (as you prefer). If you have separate src and test subdirectories, you may retain that structure in your zip file.

Make sure all of your tests are in separate files from your code, as explained in the [Expectations for Preparing Homework](https://web.cs.wpi.edu/~cs2102/common/hw-expectations.html).

* * * * *
