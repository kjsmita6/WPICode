CS 1102

A term.  2017.

Assignment #5

Due:  Tuesday October 3, 2017 @ 9:00 p.m. via Canvas

## Assignment guidelines
You should use the intermediate student language with lambda. You may use any constructs in ISL-λ, unless doing so would contradict the assignment details.
You must provide templates. As data get more complex, being careful with getting started correctly becomes more important.
You should spend time thinking about good test cases for each part. Explain why you chose the test cases you did (a quick note in a comment in the line before the test case will usually suffice).  Show us that you’ve thought through boundary conditions and ways your program could break.
For complicated test cases, provide an explanation for why you believe your output is correct.
You probably do not want to modify any of the provided code, and must name your functions according to the guidelines given.

## Connect Four the game
In this assignment, you will create a computer player for a variant of the game Connect Four.  This version has a larger game board, somewhat complicating the search task.  You should familiarize yourself with the rules for the game (they’re fairly simple).  Your job is to create a computer player that is able to play a passable game of Connect Four, using what you’ve learned about templates and generative recursion. 

## Provided functionality
For this assignment, you are given a very simple Connect Four program that displays the board, accepts user input for moves and places the checker at the correct location, and has a sample (very crude) computer player that makes random, but legal, moves (connect four starter.rktPreview the document).  Moves are represented as a list of length 2 with X and Y coordinates of the move.   The world state is represented as a structure that contains the board position, whose turn it is, and additional configuration information (at present, unused).  The code is functional, but written by someone who didn’t understand Racket or the HtDF recipe. 

The following functions are provided for your use:

1.	legal-next-moves: world-state -> list of moves.  From the given world-state, it creates a list of legal moves the current player may make.
2.	check-win? World-state -> Boolean.   Determines whether the current world-state is a winning position.
3. make-move: world-state move -> world-state.  Takes as input the present state and a proposed move, and returns the world-state, which has been updated to include the current configuration of pieces on the board and changes who is the current player. 
4. main.  Initializes the world.  The starter file is designed to create a game board with (main start-state).

## Your assignment
You will have to extend the Connect Four game in several ways.

### Creating an evaluation function
Your first task is to create an evaluation function.  The input for this function is a world-state, and it outputs a Number.  The evaluation function determines how good a board is for each player.  Higher values indicate a strong board position for the human, while lower values indicate a strong board position for the computer.   This function must be called evaluation-function (-simple or -complex).

A key bit is that your evaluation function should recognize a won (or lost) game, and value it accordingly.  It should value non-terminal game positions between winning and losing according to how good they look for each player.  Create a simple function that reasonably orders moves – it’s fairly easy to do better than random.

Create a stronger version of the evaluation function.  Spend more effort creating something that’s a bit more clever.

Finally, extend the state representation so one of the parameters is the evaluation function used to evaluate a move.

### Searching for good moves
For this assignment you will implement MiniMax search to find a good move for the computer.  You should implement MiniMax search as was discussed in class so that both players are making good moves (from their opposing perspectives).  The search should stop when it reaches the specified search depth and then call the evaluation function.  If the search reaches a terminal state, it should return a value that is consistent with the evaluation function.  I.e., a winning/losing state should produce the maximum/minimum value possible for the function. 

You should experiment and find a search depth that will have the computer making a move within approximately 2 seconds (on your computer).  Create a constant called DEFAULT-DEPTH that represents this depth. 

Your function should be called computer-moves.  It consumes a world-state and returns the move to make.

Extend the world-state representation to take as an input the depth to which the computer player will search. 

### Evaluation
Running a head-to-head comparison of student programs would be difficult (maybe next year…).  For now, do two simple evaluations and describe the results:

Given a five-second budget per move, how deep can you search with the simple heuristic function? With the more complex one?  Which player is stronger? 
Have your program play 5 games against a human who is not a member of your project team. How does the program do?  Are there any flaws you notice?
Hand in a writeup (in a comment box is fine) of about 150 words that answers the above two questions.  Put the writeup at the bottom of your file to make it easy for the grader to find. 

## Hints
1.	Conceptual complexity is lower than assignment #4, but there are some tricky details and more programming.
2.	Use the generative recursion template and think about your “trivial?” cases that should terminate the recursion. Hint:  there are three distinct cases under which the search should stop. 
3.	Add functionality incrementally and remember test cases. If you are sure your evaluation function is working correctly, it will be easier to add search functionality.  Similarly, creating some test boards with clearly correct answers makes it easier to check your search functionality. 
4.	Tactical advice
	a.	All you need to do is extend the functions at the top.  You don't need to modify the other code.
	b.	The piece-at function is helpful -- you should use it.
	c.	The code for checking for victory might help with writing the heuristic
	d.	You should be able to modify the board size and your code should still work.
	e.	Think about how many times your evaluation function will be called (many many).  It will need to run quickly.
	f.	You may assume the human is red and moves first, and the computer is black.

## What to hand in
Hand in a single file with your code, as well as the brief writeup about the evaluation function and the program’s performance. 

You should have two constants defined, simple-player and complex-player.  (main simple-player) should start a game using the simple evaluation function; (main complex-player) should start a game with the more complicated evaluation function.