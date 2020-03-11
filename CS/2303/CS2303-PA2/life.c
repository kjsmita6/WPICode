/* Game of Life -- Kyle Smith (kjsmith@wpi.edu)
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "twoD.h"
#include "grid.h"

int playTurn(char **before, char **after, int r, int c/*, int *nums*/);
int isOccupied(char cell);
void determineSurvival(int occupiedNeighbors, int i, int j, char cell, char **after);

/** Main function.
 * @param argc Number of words on the command line.
 * @param argv Array of pointers to character strings containing the
 *    words on the command line.
 * @return 0 if success, 1 if invalid command line or unable to open file.
 *
 */
int main(int argc, char **argv) {
	printf("Game of Life\n");

	char *inputFileName; // Name of file containing initial grid
	FILE *input; // Stream descriptor for file containing initial grid
	int rows; // Number of rows in the grid
	int columns; // Number of columns in the grid
	int gens; // Number of generations to produce
	int doPrint; // 1 if user wants to print each generation, 0 if not
	int doPause; // 1 if user wants to pause after each generation, 0 if not
	char **gridA; // A 2D array to hold the pattern

	// See if there are the right number of arguments on the command line
	if ((argc < 5) || (argc > 7)) {
		// If not, tell the user what to enter.
		printf("Usage:\n");
		printf("  ./life rows columns generations inputFile [print] [pause]\n");
		return EXIT_FAILURE;
	}

	/* Save the command-line arguments.
	   Also need to check if print and/or pause arguments were entered,
	   and if so, what they were.
	   A switch statement might be handy here.
	 */
	rows = atoi(argv[1]); // Convert from character string to integer.
	columns = atoi(argv[2]);
	gens = atoi(argv[3]);
	inputFileName = argv[4];
	if(gens <= 0) {
		printf("Gens must be greater than 0.\n");
		return EXIT_FAILURE;
	}

	// Determine whether to print or pause during the game
	if(argc >= 6 && *argv[5] == 'y') {
		doPrint = 1;
	}
	else {
		doPrint = 0;
	}

	if(argc >= 7 && *argv[6] == 'y') {
		doPause = 1;
	}
	else {
		doPause = 0;
	}

	/* Here is how you would allocate an array to hold the grid.
	 */
	gridA = make2Dchar(rows, columns);
	// You should check that it succeeded.
	if(!gridA) {
		printf("Unable to create grid.\n");
		return EXIT_FAILURE;
	}

	/* Eventually, need to try to open the input file.
	 */
	input = fopen(inputFileName, "r");
	if (!input || input == NULL) {
		printf("Unable to open input file: %s\n", inputFileName);
		return EXIT_FAILURE;
	}
	/*Once opened, you can read from the file one character at a time with fgetc().
	 * You can read one line at a time using fgets().
	 * You can read from standard input (the keyboard) with getchar().
	 */
	makeGrid(input, rows, columns, gridA);
	if(!gridA) {
		printf("The specified rows or columns is too small for the config!\n");
		return EXIT_FAILURE;
	}
	printf("Initial board state:\n");
	printGrid(gridA, rows, columns); // print initial board state no matter if they specify print flag or not

	char **gridB = make2Dchar(rows, columns); // create other grids
	char **gridC = make2Dchar(rows, columns);
	// grid C is the older grid, grid A is the old grid, and grid B is the new grid
	// after a round is played
	int rounds = 0;
	for(rounds = 0; rounds < gens; rounds++) {
		// Loop invariant: the total number of rounds played is less than the
		// number of generations the user specified. The loop will return early
		// if a) if all organisms die after the turn or b) the current round is the
		// same as the previous round
		int res = playTurn(gridA, gridB, rows, columns);
		// after turn, B is updated and A is the old
		// copy A to C and copy B to A

		if(res) { // playTurn returns TRUE (1) if a termination condition is met, false otherwise
			printf("Game terminated because all organisms died. Game lasted %d rounds.\n", rounds);
			printf("Final board state:\n");
			printGrid(gridB, rows, columns);
			printf("\n");
			return EXIT_SUCCESS;
		}
		if(gridEqual(gridB, gridC, rows, columns)) { // test if the new generation and the older one are the same i.e. duplicate generation
			printf("Game terminated because generations were the same. Game lasted %d round(s).\n", rounds);
			printf("Final board state:\n");
			printGrid(gridB, rows, columns);
			printf("\n");
			return EXIT_SUCCESS;
		}
		if(doPrint) {
			printf("Round %d:\n", rounds + 1);
			printGrid(gridB, rows, columns);
			printf("\n");
		}
		copyGrid(gridA, gridC, rows, columns); // copy the old grid to the older grid
		copyGrid(gridB, gridA, rows, columns); // copy the new grid to the old grid
		if(doPause) {
			printf("Press enter to continue...\n");
			getchar(); // wait for the user to send \n  (or \r\n?) to stdin
		}
	}
	printf("Game terminated because the maximum number of generations (%d) was reached.\n", gens);
	printf("Final board state:\n");
	printGrid(gridB, rows, columns);
	printf("\n");
	return EXIT_SUCCESS;
}

/**
 * Plays a turn of the game. Returns 1 if a termination condition is met.
 * To create the next board, at least one of three conditions must be met:
 * 	1. Death : Occupied cell has 0,1,4,5,6,7,8 occupied neighbors
 * 	2. Survival : Occupied cell has 2,3 occupied neighbors
 * 	3. Birth : Unoccupied cell has 3 occupied neighbors
 * The game stops when one of 3 conditions is met:
 * 	1. All organisms die
 * 	2. The pattern repeats itself from a previous generation
 * 	3. A set number of generations is reached
 * This function can only check the 1st condition due to not having access
 * to the previous rounds or the generation count specified by the user.
 * 	@return 1 if a termination condition is met (all organisms die), 0 otherwise
 */
int playTurn(char **before, char **after, int r, int c) {
	int i = 0;
	int j = 0;
	for(int i = 0; i < r; i++) {
		for(j = 0; j < c; j++) {
			after[i][j] = ' ';
		}
	}
	for(i = 0; i < r; i++) {
		for(j = 0; j < c; j++) {
			// Loop Invariant: after is a blank 2D array that holds
			// and r amount of rows and c amount of columns. before is the
			// grid from the previous round.
			if(i == 0) { // top row
				if(j == 0) { // left corner
					char right = before[i][j + 1];
					char rightBotDiag = before[i + 1][j + 1];
					char bot = before[i + 1][j];
					char neighbors[] = { right, rightBotDiag, bot };
					char cell = before[i][j];
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 3; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
				else if(j == c - 1) { // right corner
					char left = before[i][j - 1];
					char leftBotDiag = before[i + 1][j - 1];
					char bot = before[i + 1][j];
					char cell = before[i][j];
					char neighbors[] = { left, leftBotDiag, bot };
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 3; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
				else { // top row middle
					char left = before[i][j - 1];
					char leftBotDiag = before[i + 1][j - 1];
					char bot = before[i + 1][j];
					char rightBotDiag = before[i + 1][j + 1];
					char right = before[i][j + 1];
					char cell = before[i][j];
					char neighbors[] = { left, leftBotDiag, bot, rightBotDiag, right };
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 5; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
			} // top row
			else if(i == r - 1) { // bottom row
				if(j == 0) { // left corner
					char right = before[i][j + 1];
					char rightTopDiag = before[i - 1][j + 1];
					char top = before[i - 1][j];
					char neighbors[] = { right, rightTopDiag, top };
					char cell = before[i][j];
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 3; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
				else if(j == c - 1) { // right corner
					char left = before[i][j - 1];
					char leftTopDiag = before[i - 1][j - 1];
					char top = before[i - 1][j];
					char cell = before[i][j];
					char neighbors[] = { left, leftTopDiag, top };
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 3; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
				else { // bottom row middle
					char left = before[i][j - 1];
					char leftTopDiag = before[i - 1][j - 1];
					char top = before[i - 1][j];
					char rightTopDiag = before[i - 1][j + 1];
					char right = before[i][j + 1];
					char cell = before[i][j];
					char neighbors[] = { left, leftTopDiag, top, rightTopDiag, right };
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 5; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
			} // bottom row
			else { // everywhere else
				if(j == 0) { // left edge
					char right = before[i][j + 1];
					char rightTopDiag = before[i - 1][j + 1];
					char top = before[i - 1][j];
					char bot = before[i + 1][j];
					char rightBotDiag = before[i + 1][j + 1];
					char neighbors[] = { right, rightTopDiag, top, bot, rightBotDiag };
					char cell = before[i][j];
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 5; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
				else if(j == c - 1) { // right edge
					char left = before[i][j - 1];
					char leftTopDiag = before[i - 1][j - 1];
					char top = before[i - 1][j];
					char bot = before[i + 1][j];
					char leftBotDiag = before[i + 1][j - 1];
					char neighbors[] = { left, leftTopDiag, top, bot, leftBotDiag };
					char cell = before[i][j];
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 5; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
				else { // middle of board (no edges)
					char leftTopDiag = before[i - 1][j - 1];
					char top = before[i - 1][j];
					char rightTopDiag = before[i - 1][j + 1];
					char right = before[i][j + 1];
					char rightBotDiag = before[i + 1][j + 1];
					char bottom = before[i + 1][j];
					char leftBotDiag = before[i + 1][j - 1];
					char left = before[i][j - 1];
					char cell = before[i][j];
					char neighbors[] = { leftTopDiag, top, rightTopDiag, right, rightBotDiag,
							bottom, leftBotDiag, left };
					int occupiedNeighbors = 0;
					int k;
					for(k = 0; k < 8; k++) {
						if(isOccupied(neighbors[k])) {
							occupiedNeighbors++;
						}
					}
					determineSurvival(occupiedNeighbors, i, j, cell, after);
				}
			}
		}
	}

	// check if all organisms died
	for(i = 0; i < r; i++) {
		for(j = 0; j < c; j++) {
			if(after[i][j] == 'x') { // stop if 1 organism is alive, not termination condition
				return 0;
			}
		}
	}
	return 1;
}


/**
 * Determines whether a cell (char) is occupied (x) or not (' ')
 * @param cell The cell to check
 * @return 1 if cell is occupied, 0 otherwise
 */
int isOccupied(char cell) {
	return cell == 'x';
}

/**
 * Determines whether a given cell will survive given the amount of neighbors it has.
 * A unoccupied cell becomes occupied if it has exactly 3 (THREE) occupied neighbors
 * A occupied cell survives if it has either 2 (TWO) or 3 (THREE) occupied neighbors
 * A occupied cell dies if it has 0-1 or 4-8 occupied neighbors
 * @param occupiedNeighbors The number of occupied neighbors the given cell has
 * @param i The row the cell is in
 * @param j The column the cell is in
 * @param cell The cell (either X or space
 * @param after The new array after survival is determined
 */
void determineSurvival(int occupiedNeighbors, int i, int j, char cell, char **after) {
	if(!isOccupied(cell)) {
		if(occupiedNeighbors == 3) {
			after[i][j] = 'x'; // birth
		}
	}
	else {
		if(occupiedNeighbors == 0 || occupiedNeighbors == 1 || occupiedNeighbors >= 4) {
			after[i][j] = ' '; // death
		}
		else {
			after[i][j] = 'x'; // survival
		}
	}
}

