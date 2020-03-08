PA5 -- Kyle Smith (kjsmith@wpi.edu) and Akshaj Balasubramanian (abalasubramanian@wpi.edu)

This is a program similar to Game of Life (PA2), which simulates two types of organisms: Ants and Doodlebugs.
Ants are the "prey", and Doodlebugs are the "predators". Through each step of the simulation,
each creature moves and lives as Ants and Doodlebugs live.

To run from console:
$ make
$ ./PA5 [gridSize] [numDoodle] [numAnt] [steps] [seed] [pause?]

Where gridSize is the length of one side of the grid (grids are squares),
numDoodle and numAnt is the number of Doodlebugs and Ants, respectively.
Steps is the maximum number of steps to play. Seed is the seed for the random number generator.
And pause is a boolean value of whether to pause between each round, any non-zero positive number is YES PAUSE,
anything else is NO PAUSE.

As you can see, all the arguments are optional. The program will check for user input, and if none is given it will
assign default values.

One of the main issues we had was the mutual inclusions in Board and Organism. That is, Board included Organism and
Organism included Board. We got around this by doing a forward declaration, by writing

class Board;

inside of Organism.h, and by writing

class Organism;

inside of Board.h. This told the compiler and the linker that these classes exist, so it doesn't create an error
and so that it has the correct behavior.

Note - Our program doesn't work correctly, mostly because the Ant.move() and Doodlebug.move() methods do not work.
Ant.move() works to an extend, as in the Ants move in the grid but not correctly,
but Doodlebug.move() doesn't work at all, and all the Doodlebugs die after the first round.
We have most of the other things correct, like correct methods and class hierarchy, and logic to an extent, but the
move methods do not work and that breaks our entire program.
