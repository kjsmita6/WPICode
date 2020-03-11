## CS 2102 - Bterm 17

## Lab 5 - Interfaces for Sets

_Thank you to Prof. Kathi Fisler for designing the lab exercises for this course._

### Lab Objectives

*   To give you practice with layers of interfaces, using sets as an example

### Preliminaries

*   Sign the attendance sheet.

### Background

In this lab you'll investigate how to allow code to be flexible on choices of specific data structures. Over the past week or so we've been discussing the pros and cons of implementing a set in various ways "under the hood", as a LinkedList, a binary search tree, or an AVL tree. Assume you had working versions of all three implementations. You want to be able to choose one of [LinkedList, BST, AVL] depending upon the needs of a specific application. For example, if your application needed to do a lot of hasElt() operations, you might want to choose the AVL implementation of sets, because the AVL implementation gives the best worst-case performance on hasElt().

Assume someone is writing an application that maintains a set of names of people (as single strings) who plan to attend a large event. We've omitted some types and the details of the methods:

```java
  // A class for storing guests at a (potentially large) event

  class EventGuests {

    ______ guests;

    EventGuests(_____ guests) {

      this.guests = guests;

    }

    // record a new guest as coming (add the guest to the set)

    void addGuest(String newGuestName) {

      this.guests = ....;

    }

    // check whether a guest is coming (use hasElt() to see if
    // the guest is in the set)

    boolean isComing(String name) {

      return ...;

    }

    // return the number of guests in the guest list 
    int numGuests(){

       return ...;

    }

  }
```

The developer isn't sure which data structure will end up being the best fit for how the application gets used, so she wants to leave the specific choice of data structure flexible, to allow for one of [LinkedList, BST, AVL].

### What you should do

Your task is to figure out how to write the EventGuests class such that the developer can choose _at the time of calling the EventGuests constructor_ whether to use a BST, Linked List, or AVL tree to store the set of guests. So you should be able to write code something like the following in your Examples class:

```java
  // an EventGuests that uses LinkedLists under the hood

  ____ guestsLists = new EventGuests(new ...);

  // an EventGuests that uses BSTs under the hood

  ____ guestsBSTs = new EventGuests(new ...);

  // an EventGuests that uses AVL trees under the hood

  ____ guestsAVLs = new EventGuests(new ...);
```

In other words, the choice between LinkedLists, BSTs, and AVL trees is made entirely outside the EventGuests class, not fixed within it.

Hint: consider making an interface for ISet that requires the three set methods `addElt()`, `hasElt()`, and `size()`. Figure out how to (a) hook BSTs or AVL's up to this interface, and (b) how to make LinkedLists satisfy this interface (since LinkedList is a built-in class, you'll have to handle this one a little bit differently). In a class hierarchy, interfaces can `extend` other interfaces.

To make the exercise more concrete, here's the [BST code](https://web.cs.wpi.edu/~cs2102/d17/Lectures/Code/BST/bst-string.java) from last week, modified to hold String as the element type. See if you can put all the pieces together (the BST code, your new ISet interface, the completed EventGuests class, and an Examples class) in a way that chooses the BST implementation of a set.

### What to Turn In

Submit a zip of the .java files that you produced for this assignment to [InstructAssist](https://ia.wpi.edu/cs2102/). The name of the InstructAssist project is **Lab 5**.

* * *