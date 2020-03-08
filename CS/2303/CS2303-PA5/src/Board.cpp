#include "Board.h"
#include "Organism.h"
#include "Ant.h"
#include "Doodlebug.h"
#include <cstdlib>
#include <iostream>

/**
 * @author Kyle Smith
 * Board default constructor, creates a 20x20 Board
 */
Board::Board() {
	size = 20;
	board = createBoard(20, 20);
	antList = new std::vector<Ant*>;
	doodleList = new std::vector<Doodlebug*>;
}

/**
 * @author Kyle Smith
 * Board overloaded constructor, creates a lengthXlength Board
 */
Board::Board(int length) {
	size = length;
	board = createBoard(length, length);
	antList = new std::vector<Ant*>;
	doodleList = new std::vector<Doodlebug*>;
}

/**
 * @author Kyle Smith
 * Board destructor, frees memory held by Board's instance variables
 */
Board::~Board() {
	size = 0;
	delete board;
}

/**
 * @author Kyle Smith
 * Creates a rXc sized grid of Organisms
 * @param r Number of rows
 * @param c Number of columns
 * @return a rXc two dimensional array of Organisms
 */
Organism ***Board::createBoard(int r, int c) {
	Organism ***a = (Organism ***)malloc(r * sizeof(Organism **));
	if (!a) {
		return (Organism ***) NULL;
	}
	for (int i = 0; i < r; i++) {
		a[i] = (Organism **)malloc(c * sizeof (Organism *));
		if (!a[i]) {
			return (Organism ***) NULL;
		}
	}
	return a;
}

/**
 * @author Kyle Smith
 * Gets the Organism at the cell (x,y)
 * @param x X coordinate
 * @param y Y coordinate
 * @return Pointer to the Organism at (x,y)
 */
Organism *Board::getCell(int x, int y) {
	if(x < 0 || y < 0 || x >= size || y >= size) {
		return (Organism *)NULL; // return NULL if x any y would go off the board
	}
	return board[x][y]; // otherwise return the Organism
}

/**
 * @author Kyle Smith
 * Sets the Organism at (x,y) to the org parameter
 * @param x X coordinate
 * @param y Y coordinate
 * @param org New organism
 */
void Board::setCell(int x, int y, Organism *org) {
	board[x][y] = org;
}

/**
 * @author Kyle Smith
 * Gets the size of the board (length of 1 side since Board is guaranteed to be a square)
 * @return Length of 1 side of the board
 */
int Board::getSize() {
	return size;
}

/**
 * @author Kyle Smith
 * Prints the grid to console, 'x' represents a Doodlebug and 'o' represents an Ant.
 */
void Board::printGrid() {
	for(int i = 0; i < size; i++) {
		for(int j = 0; j < size; j++) {
			Organism *org = getCell(i, j);
			if(org) {
				if(org->isPrey()) {
					std::cout << "o";
				}
				else {
					std::cout << "x";
				}
			}
			else {
				std::cout << " ";
			}
		}
		std::cout << '\n';
	}
}

/**
 * @author Akshaj Balasubramanian
 * Prints doodlebugs and ants to random positions in a grid
 */
void Board::randAddOrg(unsigned int numDoodle, unsigned int numAnt) {
	while(antList->size() < numAnt) {
		int x = rand() % size;
		int y = rand() % size;
		if(!board[x][y]) {
			Ant *tempAnt = new Ant(x, y);
			board[x][y] = tempAnt;
			antList->push_back(tempAnt);
		}
	}
	while(doodleList->size() < numDoodle) {
		int x = rand() % size;
		int y = rand() % size;
		if(!board[x][y]) {
			Doodlebug *tempDood = new Doodlebug(x, y);
			board[x][y] = tempDood;
			doodleList->push_back(tempDood);
		}
	}
}

/**
 * @author Akshaj Balasubramanian
 * Getter for ant list
 * @return the ant list
 */
std::vector<Ant*> *Board::getAntList() {
	return antList;
}

/**
 * @author Akshaj Balasubramanian
 * Getter for doodlebugs list
 * @return the doodlebugs list
 */
std::vector<Doodlebug*> *Board::getDoodleList() {
	return doodleList;
}

/**
 * @author Akshaj Balasubramanian
 * Function to copy a current board state
 * @return a board exactly the same as the board it copied
 */
Board *Board::copyBoard() {
	Board *b = new Board(size);
	for(int i = 0; i < size; i++) {
		for(int j = 0; j < size; j++) {
			b->setCell(i, j, board[i][j]);
		}
	}
	return b;
}
