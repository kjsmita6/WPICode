#include <iostream>
#include <cstdlib>
#include <algorithm>
#include <array>
#include <math.h>
#include "Board.h"
#include "Ant.h"
#include "Doodlebug.h"

/**
 * @author Kyle Smith and Akshaj Balasubramanian
 * Takes in arguments from the user, or else defaults to the specified values
 * Executes the simulation for the specified number of generations
 * @return 0 if it runs correctly
 */
int main(int argc, char **argv) {
	// set up arguments to what the user says or the default value (ternary if)
	int gridSize = argc >= 2 ? atoi(argv[1]) : 20;//grid size
	int numDoodle = argc >= 3 ? atoi(argv[2]) : 5;//number of doodlebugs
	int numAnt = argc >= 4 ? atoi(argv[3]) : 100;//number of ants
	int steps = argc >= 5 ? atoi(argv[4]) : 1000;//number of generations
	int seed = argc >= 6 ? atoi(argv[5]) : 1;//seed
	bool pause = argc == 7 && atoi(argv[6]) > 0 ? true : false;//determines pause, and all other arguments
	srand(seed);//random generated from seed
	Board *board = new Board(gridSize);//initialises the game board
	board->randAddOrg((unsigned int)numDoodle, (unsigned int)numAnt);//creates the random game board
	std::cout << "Initial board state" << std::endl;//title
	std::cout << "__________" << std::endl;//formatting
	board->printGrid();//prints the grid

	Board *before = board->copyBoard();//stores the previous board state
	for(int gen = 0; gen < steps; gen++) {//cycles through the generations
		// Move Doodlebugs
		for(int i = 0; i < gridSize; i++) {
			for(int j = 0; j < gridSize; j++) {
				if(before->getCell(i, j)) {
					if(!before->getCell(i, j)->isPrey()) {//checks if the organism is a doodlebug
						before->getCell(i, j)->move(board);//moves the organism
					}
				}
			}
		}
		// Move Ants
		for(int i = 0; i < gridSize; i++) {
			for(int j = 0; j < gridSize; j++) {
				if(before->getCell(i, j)) {
					if(before->getCell(i, j)->isPrey()) {//checks if the organism is an ant
						before->getCell(i, j)->move(board);//moves the organism
					}
				}
			}
		}
		std::cout << "Round " << gen + 1 << std::endl;//formatting
		std::cout << "__________" << std::endl;//formatting
		board->printGrid();//prints the current
		if(pause) {//checks if pause has been requested
			std::cout << "Press ENTER to continue...";//printing the message
			std::cin.get();//waits for the enter
		}
		before = board->copyBoard();//copies the new board state
	}
}
