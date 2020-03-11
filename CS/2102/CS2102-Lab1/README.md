## CS 2102 - Bterm 17

## Lab 1 - Setting up your environment; Java classes

_Thank you to Prof. Kathi Fisler for designing the lab exercises for this course._

### Lab Objectives

*   Get your Java environment configured, including JUnit for testing
*   Create a simple class, with Examples class and a test case
*   Know how to run your tests
*   Check that you can submit homework structured for automatic grading
*   (if time) Create a nested class reference

### Preliminaries

*   Sign the attendance sheet.
*   If you already know Java or have your environment configured, jump to the optional problems on creating nested Java objects.
*   Please make sure you submit your work to InstructAssist by the end of the lab. We are not grading your lab work, but we are going to use this submission to check that you know how to submit files such that the autograding scripts can process them. This will hopefully catch many configuration errors before it counts on the first homework.

### What you should do

#### Setting up your Java environment

The course staff will support two development environments (DrJava and Eclipse). There are descriptions of each environment on [Textbook and Software](http://www.cs.wpi.edu/~cs2102/d17/#textbook) section of the syllabus, including tutorials that you can follow to get everything set up. DrJava is the easier one to learn to use, but it has fewer features for developing code and flagging errors as you go than Eclipse (which is a professional-grade programming tool).

Pick your environment. If you are using the lab computers, type the name of the application you chose in the search box under the programs menu on the lab machines.

If you are using your own laptop, download and install whichever tool you wish to use. If you are on a Mac, note that you need to download/use the "JAR File", not the "Mac OS X App". See the [Textbook and Software](http://www.cs.wpi.edu/~cs2102/d17/#textbook) page for instructions on how to use the JAR file, as well as general instructions to configure your environment.

#### Creating a basic Java program

We’ll start by having you create a project, add a class, and run your code.

1.  Create a new project and open a new file in your chosen environment. Copy the following class definition into the new file:

    ```java
    
          class Song {
           String title;
           int lenInSeconds;  // duration of the song  

           Song (String title, Integer lenInSeconds) {
            this.title = title;
            this.lenInSeconds = lenInSeconds;
           }
          }
    ```

2.  Add this [Main.java](http://www.cs.wpi.edu/~cs2102/d17/Code/Main.java) file to your project. Java looks for a function (a.k.a. a "method" in Java) named `main` to call to start running your program. We have given you this main method, enclosed in a class (for reasons we will explain later this week).
3.  To check for typos and notation errors in your program, press the icon in your enviroment to compile your program. In DrRacket, you used to hit a single Run button. In Java, you do two steps: compile (which checks for a bunch of notational and other errors) then run (which actually runs your program).

Once your program compiles, then press the icon to Run your program (you will have to run the Main.java class, not the Song class). You’ll see a message print out that your program ran, but nothing else at this point.

#### Adding examples and tests

Now we’ll include examples of data and a simple test case. Add this empty [Examples class](http://www.cs.wpi.edu/~cs2102/d17/Code/Examples.java) to your project (as a separate file). The top of the file has two `import` statements, which tell Java that we want to use the JUnit testing framework. More on that in a moment.

1.  First, create some objects (a.k.a examples of data in 1101 terms). Define two song objects in the `Examples` class, each through code such as

    ```java
          Song HapBD = new Song("Happy Birthday", 18);
    ```

    Compile and run your program. You should get the same message as before, reporting that your program ran.
2.  Now we will create a test case. Test cases are a kind of function; Java uses the term _methods_ instead of functions. Since you haven’t learned how to write methods yet, in today’s lab we will simply copy the code to create a test that checks the `lenInSeconds` value in one of your `Song` objects. This is not an interesting test, but the goal is to make sure you can set up a test while you have the staff around to help.

    Copy the following code into your Examples class.

    ```java
          @Test

          public void checkHBLen() {
             assertEquals(18, HapBD.lenInSeconds);
           }
    ```

    What is this code saying? In JUnit the `@Test` labels a test case. The next line defines a method called `checkHBLen` that takes no arguments. The method uses the built-in `assertEquals` to ask JUnit to make sure that the two expressions produce the same answer (similar to `check-expect` from cs1101). The first argument to `assertEquals` should be the expected answer and the second should be the computed answer.

    Ignore the `public void` part for now – we will explain those in the next couple of classes. For now, just include them when you write a test case.

    Compile and run your project. You should get the same message you have been getting.

3.  Add another test that has the wrong expected answer (and hence should fail). Run your tests again to see how your programming environment reports failed test cases.

    **Note to those who already know JUnit:** you may put your tests in other (multiple) classes, as long as those classes have `Examples` or `Test` as part of the class name.

Submit your work (instructions at bottom), to make sure you know how to submit assignments.

Everyone should finish up to this point.

#### If you have time: nested class references

Songs are typically affiliated with Albums. We want to add an `Album` class and include a field with album information in each `Song`.

1.  Define a class for albums, which contain two strings. One is the name of the artist; the other is the genre of music ("Rock", "Jazz", etc) that is on the album. You can put this class in its own file (proper Java style) or in the file with your `Song` class (easier to follow as you are learning Java)
2.  Edit your `Song` class to include a field `onAlbum` with type `Album`.
3.  Revise your examples of `Song` data to include the new `Album` field.
4.  Add a test case that checks the genre of a `Song` object.

You do NOT need to resubmit your files if you get to this part. Submission is only to check that your files are properly configured to work with the grading scripts.

### What to Turn In

Submit a `zip` file of all `.java` files that you produced for this assignment to the Lab1 assignment in [InstructAssist](https://ia.wpi.edu/cs2102/). Your zipped directory may contain subdirectories (such as "src" and "test", which some Java environments will create automatically). Do NOT include the `.class` files.

If you don’t have an account in InstructAssist, ask your lab staff for help.

* * *