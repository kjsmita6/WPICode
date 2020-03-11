## CS 2102 - Bterm 17

## Lab 2 - Class Hierarchies

_Thank you to Prof. Kathi Fisler for designing the lab exercises for this course._

### Lab Objectives

*   To work more with `extends` to share code and data across classes
*   To develop a sense of where to put methods that behave differently on some classes in a hierarchy

### Preliminaries

*   Sign the attendance sheet.

### Class Extension isn't Always Abstract

Abstract classes support field and method abstraction, but class extensions are also used to express hierarchy among non-abstract data. For example, let’s add two kinds of animals to our class hierarchy: Fish, which have a length and an optimal saline level for water in their tanks; and Sharks, which are fish for which we record the number of times they attacked people. Initial versions of the new classes (without extends or implements statements) appear as follows:

```java
  class Fish {
    int length;
    double salinity; 

    Fish (int length, double salinity) {
      this.length = length;
      this.salinity = salinity;
    }

    public boolean isNormalSize () {
      return 1 <= this.length && this.length <= 15;
    }
  }

  class Shark {
    int length;
    double salinity;
    int attacks;

    Shark (int length, int attacks) {
      this.length = length;
      this.salinity = 3.75;
      this.attacks = attacks;
    }

    public boolean isNormalSize () {
      return 1 <= this.length && this.length <= 15;
    }
  }
```

A few things to note here:

*   The salinity data has type `double`; this is a common type to use for real numbers.
*   Constructors do not need to take all of the initial field data as paramters. For example, if we assume that all sharks have the same saline level, then the `Shark` constructor asks for only the length and the number of attacks; it sets the fixed saline level as part of the constructor.

Develop your `Examples` class as you work on the following problems to check that you understand the definitions you are creating. Here is the starter [Examples.java](https://web.cs.wpi.edu/~cs2102/d17/Code/Examples.java) file.

#### Task 1: Integrate the new animal classes

Starting from [this file](https://web.cs.wpi.edu/~cs2102/d17/Labs/Lab2/AnimalsNoFish.java), integrate the `Fish` and `Shark` classes into our existing collection of animals classes. Your integration should achieve the following goals:

*   `Fish` and `Shark` should be part of the overall animals type.
*   The final set of classes should share common variables and methods.

Check your work before proceeding: Does your code require a shark to also be a fish? How? How does your code let a shark count as an animal? You can look at [this solution](https://web.cs.wpi.edu/~cs2102/d17/Labs/Lab2/AnimalsWithFish.java) to check your work (but obviously try it yourself before looking here).

#### Task 2: Overriding methods

In reality, sharks are larger than many other fish. The `isNormalSize` method that `Shark` inherits from `Fish` is too generous. Instead, we’d like a custom version of `isNormalSize` on sharks that returns true for any shark with length at least 6 (no upper bound).

Edit your `Shark` class to reintroduce an `isNormalSize` method with this behavior. Note that now the `Shark` class seems to have two versions of this method: the one it inherits from `Fish`, and the one you just wrote. Which one gets called on a shark? Add a test case to your `Examples` class to figure this out.

[Answer: When you call a method on an object in Java, Java uses the version that is "lowest down" in the class hierarchy tree. If Java doesn’t find a method with the given name and input types in the class from which you made the object, it checks the super class, then the superclass’ superclass, and so on.]

#### Task 3: Add a method

Now that we have sharks attacking people and boas eating in general, we want a method that determines whether a specific animal is dangerous to people. Write a method `isDangerToPeople` on animals that produces a boolean indicating whether that animal is expected to eat people. The method should return true if the animal is a boa with "people" as its eats value, or if it is a shark who has previously attacked someone (following the innocent until proven guilty principle). Dillos and non-shark fish are not dangerous to people.

Question: If you added a new kind of `Fish` (such as a `Whale`) by simply extending `Fish`, would you have to write an `isDangertoPeople` method in the `Whale` class to get that method to run on whales? You shouldn’t need to write this new method. Either explain (to yourself or someone else) why you don’t need to write this method, or edit your code so that you don’t need to write this method.

The point of this question is to make sure you know where to put method definitions in more complicated class hierarchies.

### What to Turn In

Submit a `zip` of the `.java` files that you produced for this assignment to [InstructAssist](https://ia.wpi.edu/cs2102/). The name of the InstructAssist project is **Lab 2**.

* * *