// grid.c -- Kyle Smith (kjsmith@wpi.edu)

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "grid.h"
#include "twoD.h"

/**
 * Copies one grid to another
 * These grids MUST have the same amount of rows and columns.
 * Additionally, this function will delete the old array from
 * memory before initializing with the new values.
 * This means the old value of the array is lost.
 * @param from The grid to copy from
 * @param to The new grid
 * @param r Number of rows
 * @param c Number of columns
 */
void copyGrid(char **from, char **to, int r, int c) {
	int i, j;
	for(i = 0; i < r; i++) {
		for(j = 0; j < c; j++) {
			// Loop Invariant: from and to are the same length, to[i][j] from[i][j] point to the same position
			to[i][j] = from[i][j]; // set the new value to the old value
		}
	}
}

/**
 * Creates the grid from the specified file stream
 * @param input The file stream, must already be open
 * @param rows Number of rows
 * @param columns Number of columns
 * @param grid 2d char array to store the grid in
 * @return 1 if creation was successful, 0 otherwise
 */
int makeGrid(FILE *input, int rows, int columns, char **grid) {
	int r = 0;
	int c = 0;
	int tempC = 0;
	int chara = fgetc(input);
	while(chara != EOF) { // read until end of file is reached
		// Loop Invariant: at the end of the loop, r and c will be greater than
		// or equal to rows and columns, and grid will be initialized with the
		// specified filestream characters
		if(r < rows) {
			if(chara == '\n') {
				r++;		// increase row count, new row
				c = tempC; 	// set "c" to tempC, c is the "actual" length of the pattern
				tempC = 0;	// reset tempC
			}
			else {
				tempC++;
			}
			chara = fgetc(input); // set chara to the next character in the file
			if(c > columns) { // specified columns wasn't big enough
				return 0;
			}
		}
		else {
			return 0; // speified rows wasn't big enough
		}
	}
	fseek(input, 0, SEEK_SET); // set file position to 0 to read the file again
	int i, j;
	// These 4 variables below are the 4 corners of the pattern within the grid
	int startRowOffset = ceil((rows - r) / 2.0);
	int startColOffset = ceil((columns - c) / 2.0);
	int endRowOffset = ceil((rows + r) / 2.0 + (rows + r));
	int endColOffset = ceil((columns + c) / 2.0 + (columns + c));

	i = startRowOffset;
	j = startColOffset;
	chara = fgetc(input); // start reading the file again to store the values
	for(i = startRowOffset; i < endRowOffset; i++) {
		for(j = startColOffset; j < endColOffset; j++) {
			// Loop Invariant: startRowOffset and startColOffset are greater than 0
			// if rows and columns are bigger than r and c respectively, and equal to 0
			// if rows and columns are equal to r and c. endRowOffset and endColOffset
			// are less than rows.
			if(chara != EOF) {
				if(chara == '\n') {
					i++;						// move to next row
					j = startColOffset - 1;		// reset column counter, needs -1 because the loop will increase it
				}
				else if(chara == 'o') { // replace o's with spaces
					grid[i][j] = ' ';
				}
				else {
					grid[i][j] = chara;
				}
			}
			chara = fgetc(input);
		}
	}
	for(i = 0; i < rows; i++) {
		for(j = 0; j < columns; j++) {
			if(!grid[i][j]) {
				grid[i][j] = ' '; // replace non-initialized characters with spaces
				// this will complete the centering of the board
			}
		}
	}
	fclose(input); // close file
	return 1; // success
}

/**
 * Prints the specified grid to the console
 * @param grid The grid to print
 * @param r Number of rows
 * @param c Number of columns
 */
void printGrid(char **grid, int r, int c) {
	int i, j;
	for(i = 0; i < r; i++) {
		for(j = 0; j < c; j++) {
			printf("%c", grid[i][j]); // loop through and print each indiv. char
		}
		printf("\n"); // newline between each row
	}
}

/**
 * Determines if two grids are equal. Grids MUST be BOTH r rows tall and c columns wide.
 * @param grid1 First grid to compare
 * @param grid2 Second grid to compare
 * @param r Number of rows
 * @param c Number of columns
 * @return 1 if grids are equal, 0 otherwise
 */
int gridEqual(char **grid1, char **grid2, int r, int c) {
	int i = 0;
	int j = 0;
	for(i = 0; i < r; i++) {
		for(j = 0; j < c; j++) {
			if(grid1[i][j] != grid2[i][j]) {
				return 0; // return false if not equal, don't check rest of loop
			}
		}
	}
	return 1;
}
