CS 1102

A term.  2017.

Assignment #3

**Due:  Tuesday September 19, 2017 @ 9:00 p.m. via turnin**

**Accepted until September 20, 2017 @ 1 p.m. with 25% late penalty**

## Corrections:

1. Changed cutoffnatural in Part 1 question 4
2. Made clearer that signature, purpose, and test cases are required for all student-designed functions.
3. Signature should be Widget | false for Part 1, question 5
4. Added &quot;what to submit&quot; for part 2

## Assignment guidelines

1. Vocabulary:  a &quot;widget&quot; is a word that refers to any device or item you would manufacture.
2. You **must** use the language specified for each part of the assignment.
3. This is a long assignment, and is more involved than assignment #2.  You are strongly advised to start early.
4. Do not divide the work up where one person does part 1, and someone else does part 2.  It will not go well for the person working on part 2.

## Part 1:  a warehouse of widgets

You are working as a summer intern at a Widget maker.  Your boss is old school, and insists on your using beginning student language with list abbreviations for Part 1 (&quot;If it was good enough for me on assignment #3 when I was a student, it&#39;s good enough for you.&quot;)

To help you get started with your task, your boss has given you a starter file you should use (starter.rkt).

For this assignment you will create a system that manages a warehouse of widgets.  Each widget has a name, the number in stock, the price of the widget, and the time to manufacture a new widget.  Additional widgets can be constructed, if the materials are available.  Thus, each widget also contains the necessary ingredients necessary to manufacture a new one.  The ingredients take the form of a list of components needed to manufacture a new item, where each component is a widget as well (so it is a recursive data definition).

Create a template for functions operating on a Widget.  This template is an important component of part 1.

## Basic properties about widgets

Your boss has given you several start-up tasks to get used to the widget inventory system.  After developing the template functions, he wants you to implement the following functions, and to provide a signature and test cases for each.  Note:  your boss doesn&#39;t care about niceties of Racket naming conventions and wants the functions to have these names.  Changing the names or operand order will make your boss Grumpy.   **All** function you develop should have a signature, purpose, and test cases.

1. find-widget-name-longer-than.  widget natural (listof widget)

This function will examine the widget, as well as all of the subwidgets used to manufacture it, and return all whose name length is longer than the specified natural.

2. find-widget-quantity-over:  widget natural (listof widget)

This function will examine the widget, as well as all of the subwidgets used to manufacture it, and return those whose quantity in stock is greater than the specified natural

3.  find-widgets-cheaper-than: widget number (listof widget)

This function will examine the widget, as well as all of the subwidgets used to manufacture it, and return those whose price is less than the provided number

4. find-widget-hard-make:  widget natural (listof widget)

Finds all subwidget who have at least one component widget whose quantity in stock is less than the cutoff.

1. find-widget-name:  widget string widget | false

This function takes as input a widget and a string, and returns the (sub)widget with the same name.  If there is no widget with that name, _false_ is returned.

2. list-all-widgets widget (listof widget)

Returns a list of all of the widget and all of the subwidgets used to manufacture it.

3. list-all-widget-names widget (listof string)

Returns a list of the names of the widget and all of the subwidgets used to manufacture it.

What to submit:  a racket file called &quot;part 1.rkt&quot;, that satisfies your boss&#39; requirements.

## Part 2:  generalizing your code

After finishing part 1, you&#39;re worried your boss will keep coming back with a trivial list of modifications and extensions to those functions for you to work on all summer.  You&#39;d prefer to have enough free time to work with the much trendier Object-Oriented Trash Can Widget group, who are having problems ([https://xkcd.com/1888/](https://xkcd.com/1888/)) and could use your help.  Therefore, you decide to get ahead of things and write some abstract functions to help you handle future function requests from your boss.  To further cement your rebel status, you decide to upgrade to the intermediate student language with lambda for this part.

First, use local to convert your _templates_ from part 1 into a single trampoline function.

Second, your goal is to recreate the 7 functions in part 1 as simply as possible.  Figure out which abstract functions, which consume a widget, you should write.  Making one extremely complex abstract widget function is possible, but might not be the best way to go.  Think about what the functions are doing and how 1 through 4, 5, and 6 through 7 all group together (that is one way to approach the problem, there are others).  For each abstract function you write, document it with a purpose, signature, and test cases.  Then, use those abstract functions to recreate the 7 functions from pat 1.

Third, you&#39;ve heard rumors that your boss will want functionality such as being able to find the most expensive widget, or the widget with the fewest parts in stock.  Create a function:

 sort-widgets: widget order --> (listof widget)

It sorts the widgets according to the specified order function.  For example, it could order widgets by increasing price.

Use sort-widgets to generate a longest-name-widget function for your boss, that returns the (sub)widget with the longest name.

## Hints

1. Conceptual complexity just jumped upwards relative to assignments #1 and #2.
2. Hopefully you copy/pasted a bunch for Part 1.  Doing so will make Part 2 easier.

What to submit:  A file called &quot;part 2.rkt&quot;

## Part 3:  displaying widget trees

You are happy that you have gotten ahead of what your boss may ask for but are horrified to find some of his notes for additional tasks.  Apparently he wants you to be able to display a widget in a hierarchical manner.  For example, to construct Jewelry requires Rings, Necklaces, and Bracelets; to construct a Necklace requires Chains and Pendants.

In addition, there are notes scribbled that he would like to be able to highlight items that are low in stock, and those that cost more than a prescribed price.  However, there could be other reasons he might want to highlight an entry.  Mercifully, the only type of highlight he is interested in is changing the color of the text for certain types of exciting events _such as_ a particular widget being too expensive, or having an odd number of letters in its name, or having a subwidget that is in short supply.   On the plus side, there is the beginnings of some code (&quot;starter display.rkt&quot;) left behind by a former intern who fled the company.

First, use your template function to design a function:

 simple-render: widget --> image

It produces a simple (image-based) textual representation of the hierarchy of widgets.  It should look something like the above example.

Once you have simple-render working, go back and write

 render: widget fn --> image

Generates a tree like simple render, but colors the text according to the function passed in.  For example, a function could have items under $10 be displayed in green text, over $25 in red text, and the rest in black text.  Or it could color items by how many are in stock, or based on…

Write two test functions for render, first, rewrite simple-render to make use of render.  Then write a function that colors text yellow if there are fewer than 10 items in stock, and red if there are fewer than 5 items in stock.

What to hand in:  a file called &quot;display widgets.rkt&quot;