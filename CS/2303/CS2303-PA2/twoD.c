#include <stdio.h>
#include <stdlib.h>
#include "twoD.h"

/** Make a 2D array of integers
 *
 * @param rows Number of rows
 * @param columns Number of columns
 * @return Pointer to the array of pointers to the rows.
 * 	  or null pointer if unable to allocate memory.
 * 	  Note: Will not free partially-allocated memory.
 *
 * @author Mike Ciaraldi
 */
int** make2Dint(int rows, int columns) {

	int **a; // Array of pointers to rows
	unsigned int i; // Loop counter

	// First allocate the array of pointers to rows
	a = (int **) malloc(rows * sizeof(int *));
	if (!a) { // Unable to allocate the array
		return (int **) NULL;
	}

	// Now allocate array for each row
	for (i = 0; i < rows; i++) {
		// i is the row we are about to allocate
		a[i] = malloc(columns * sizeof (int));
		if (!a[i]) {
			return (int **) NULL; // Unable to allocate
		}
	}
	return a;
}

/**
 * Create a 2D array of characters (strings)
 * @param rows Number of rows
 * @param columns Number of columns
 * @return Pointer to the two dimensional array of chars,
 * or a null pointer if unable to allocate.
 */
char** make2Dchar(int rows, int columns) {

	char **a = (char**)calloc(rows, sizeof(char *));
	if(!a) { // if a is a falsy value i.e. unable to allocate the memory,
			// return a NULL pointer
		return (char **)NULL;
	}
	int i = 0;
	for(i = 0; i < rows; i++) { // initialize each column
		a[i] = (char *)calloc(columns, sizeof(char));
		if(!a[i]) { // unable to allocate memory for this column
			return (char **)NULL;
		}
	}
	return a;
}
