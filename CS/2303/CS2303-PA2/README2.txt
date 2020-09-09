life -- Kyle Smith (kjsmith@wpi.edu)

Steps to run (<> denotes a required command, [] renotes an optional command):
1. $ make
2. $ ./life <rows> <columns> <generations> <filename> [print?] [pause?]

To generate the documentation using Doxygen:
1. $ make docs
2. $ cd html
3. $ open index.html

To clean the directory (remove binary and executable files):
1. $ make clean

Options with a ? require either a 'y' or a 'n' response, can also be left blank.
It is impossible to specify a pause? without specifying a print?.

The main problem I had with this assignment was properly loading the file and centering it.
At first I loaded it but couldn't center it. I worked about 2 days on the center function,
and after writing it out I figured out how to do it mathametically. 
Writing the function to determine survival and to actually play the turn was easier 
since I did a lot with 2d arrays and grids and such in high school AP computer science.
At the beginning I was getting a lot of seg faults with the arrays because I kept going
off the edge but eventually I figured out how to avoid it.

Loop Invariants:
	grid.c:24 - from and to are the same length (same number of elements),
	and to[i][j] and from[i][j] point to the same "postion" in the array

	grid.c:44 - at the end of the loop, r and c will be greater than or
	equal to rows and columns, and grid wlil be initialized with the 
	specified filestream characters.

	grid.c:78 - startRowOffset and startColOffset are greater than 0
	if rows and columns are bigger than r and c respectively, and equal
	to 0 if rows and columns are equal to r and c. endRowOffset and
	endColOffset are less than rows.

	grid.c:104 - the total number of rounds played is less than the number
	of generations the user specified. The loop will return early if 
	a) if all organisms die after the turn or
	b) the current round is the same as the previous round

	grid.c:169 - after is a blank 2D array that holds an r amount
	of rows and a c amount of columns. before is the grid from the 
	previous round.

Testing:

Using the glider.txt file as a pattern, and starting with the command:
	$ ./life 10 10 100 glider.txt
The intial pattern was
	         
          
          
          
      x   
    x x   
     xx   
          
          
          
and the final pattern was
         
          
          
          
          
          
          
          
        xx
        xx


The game was terminated after 16 rounds because the patterns were the same.
This is used as my test case.
