**Due Tuesday September 12, 2017 @ 9:00 p.m. via turnin**

**Accepted until Wednesday September 13, 2017 @ 1pm with 25% penalty**

For functions operating on lists and structures, you must first construct the appropriate templates and follow those templates when constructing your functions.  In addition, **all functions** must have a signature and sufficient test cases to ensure they operate correctly.  Think hard about the test cases you will need to ensure correctness. 

For this assignment you will use Intermediate Student Language (edit 9/10 @ 7:23 p.m. You can use ISL-lambda if you want.  There is no need to make use of lambda in this assignment, but there are subtle differences between the languages that might make a difference for some of you).  For this assignment, you are restricted to constructs available in Beginning Student Language with List Abbreviations except the ability to invoke functions that are passed in as parameter.  If you don’t understand this last sentence, don’t worry.  Intermediate Student Language has some additional complexity that we do not yet want students attempting for this assignment.  If you follow the design recipes you are in good shape.  If in doubt, chat with a member of course staff. 

Part 1 is easier than part 2.  Get Part 1 working first. 

General assignment guidelines:

Put your names at the top of your submission.
If part of your code isn’t working, be sure that your submission can be executed without generating syntax errors. If we have to clean up syntax to see what parts of your code are working you will lose additional points.
Your code should run without crashing. If parts of the functionality aren’t working, have it return some legal value so the program can continue.  You are much better off having a solid program with partial functionality, then all of the features half-implemented.    
 

### Part 1:  a semi-tame cow

For part 1, you will have a cow that wanders around in a field (MTS).  The cow can move horizontally either left or right, but cannot move beyond the boundaries of MTS.  The cow’s speed can vary. 

You have a limited degree of control over the cow:

- Clicking the mouse relocates the cow to the mouse pointer’s position.
- Pressing the “a” key causes the cow’s speed to the left to increase by 1. If the cow is moving to the right, its speed decreases by 1.
- Pressing the “s” key causes the cow’s speed to the right to increase by 1. If the cow is moving to the left, its speed decreases by 1. 
- If the cow’s speed is 0, the cow just stands there.

When the cow is moving, use the rotation trick described in the video lectures to make it appear as though the cow is moving.  When the cow is standing still, it should not continue to rotate back and forth. 

If the cow reaches the edge of its enclosure, it keeps trying to escape – i.e., its speed remains unchanged and it keep moving (this part makes your lives a bit easier).  This assignment is BYOC – feel free to use any reasonably-sized cow image. 

**You must follow the HtDW recipe.**  Identify the constant information in the world and figure out what has to change.  Then use that knowledge to define your constants and structure definition. 

**Hints:**

0.  Read the How to Design Worlds document.  It has a ton of useful information, will keep you on track, and will answer a lot of your questions.

1.  You will need structures to maintain the world state.  More precisely, you should use structures to maintain the world state.  

2.  For an on-tick function, a decent stub is:

(define (on-tick ws) ws)

It is guaranteed to return a valid world state, and lets you debug your render function.

### Part 2:  fireworks

For Part 2, you will create a fireworks display that is initiated via the mouse.  Whenever the user clicks on the screen, a firework is created that travels upwards until its timer reaches 0, at which point it explodes.  This program should have the following behavior:

1. The background scene should be black (since we see fireworks at night)
2. A mouse click action creates a new firework
3. All fireworks have a fixed radius before they explode.
4. There is no limit on the number of fireworks created by the user
5. When a firework explodes, it generates an explosion specified by a function provided by the user.
6. All fireworks have the same explosion type (e.g., a circle, star, etc.) but may vary in size. The function provided has a signature:

        ;;  Natural String --> Image

        ;;  Takes the size parameter [1,9] and the color of the explosion

        ;;  Function instantiates an explosion within those constraints

The representation of fireworks is more complicated than the cow example in Part 1.  Your program will have to be able to keep track of an arbitrary number of independent fireworks. 

1. Fireworks have a random upwards and sideways velocity. They also have a random timer that determines when they will explode.  Experiment with settings to produce reasonable behavior.  Reasonable means most fireworks explode while on screen and fairly high in the sky, and do not all follow extremely similar trajectories. 
2. A firework has a color, described below.
3. A fireworks has an explosion size, described below.
4. All fireworks have the same explosion duration, how long the explosion stays on the screen.  All fireworks share the same explosion type.

The user has several controls

1. Clicking the mouse produces a firework with the current settings at position x,y
2. Hitting “r” changes the settings to produce red fireworks, “g” for green, “b” for blue, and “w” for “white.”
3. Hitting a number (1 through 9) changes the size of the explosion the firework generates. A “1” is the smallest explosion, and a “9” is the largest explosion.  Numbers in between should scale linearly.
4. When the program is instantiated, one of the arguments is a function specifying what the explosion looks like. This function will need to make use of the explosion size number to generate an image of the appropriate size.  This part is a bit trickier. 

Note that most of the properties are connected to a specific firework, and not the simulation as a whole.  For example, if the user hits “r2” and clicks the mouse, and then immediately hits “g9” and clicks the mouse twice, that will generate three fireworks.  Both fireworks have a (probably different) random dx, dy, and fuse.  The first firework will be red, and produce a small explosion.  The second and third fireworks will be green, and produce a large explosion. 

When a firework explodes, the explosion retains the dx and dy of the original firework. 

Once the timer on the firework’s explosion runs out, the firework disappears from the screen and from your program’s state.  In other words, your representation should not store “old” fireworks.

Again, you must follow the HtDW recipe.  What are the constant factors in this environment?  What varies across time?  What varies across fireworks?  Design your world-state representation carefully. 

### What to hand in:

1. You will submit two Racket files:  cow.rkt and fireworks.rkt
2. Your cow program should have a defined state called START that initializes the world in a reasonable initial configuration, and when we call (main START) should work.
3. For the fireworks program, you should define two initial states, START1 and START2.  (main START1) and (main START2) should start your program with different explosion functions.  The explosions should be different enough that we can easily grade them.  If you could not get this part working, do not create a constant START2.
 