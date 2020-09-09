// grid.h -- Kyle Smith (kjsmith@wpi.edu)

#include <stdlib.h>

#ifndef GRID_H_
#define GRID_H_

int makeGrid(FILE *file, int rows, int columns, char **grid);
void copyGrid(char **from, char **to, int r, int c);
void printGrid(char **grid, int r, int c);
int gridEqual(char **grid1, char **grid2, int r, int c);

#endif /* GRID_H_ */
