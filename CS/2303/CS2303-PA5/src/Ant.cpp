#include <cstdlib>
//#include "Organism.h"
#include "Ant.h"


/**
 * @author Kyle Smith
 * Ant constructor, sets number of steps to 0 and coordinates to (0,0)
 * survSteps is the number of steps since the Ant last bred.
 */
Ant::Ant() {
	survSteps = 0;
	setCoords(0, 0);
}

/**
 * @author Kyle Smith
 * Overloaded Ant constructor, set x and y to the arguments
 * @param x X coordinate of the Ant
 * @param y Y coordinate of the Ant
 */
Ant::Ant(int x, int y) {
	survSteps = 0;
	setCoords(x, y);
}


/**
 * @author Kyle Smith
 * Ant destructor
 */
Ant::~Ant() {
	survSteps = 0;
	delete this;
}

/**
 * @author Akshaj Balasubramanian
 * Ant move method, determines how the Ant moves
 */
void Ant::move(Board *b) {
	int x = getX();
	int y = getY();
	Organism *left = b->getCell(x, y - 1);
	Organism *top = b->getCell(x - 1, y);
	Organism *right = b->getCell(x, y + 1);
	Organism *bot = b->getCell(x + 1, y);
	//Organism *neighbors[4] = { left, top, right, bot };

	if(x == 0) {
		if(y == 0) { // top left corner
			if(right && bot) { // no empty cells
				survSteps++;
				return;
			}
			int random = rand() % 2;
			if(random == 0 && !bot) { // go to bottom
				setCoords(x+1, y);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
			else { // go to right
				setCoords(x, y+1);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
		}
		else if(y == b->getSize()) { // top right corner
			if(left && bot) { // no empty cells
				survSteps++;
				return;
			}
			int random = rand() % 2;
			if(random == 0 && !bot) { // go to bottom
				setCoords(x+1, y);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
			else { // go to left
				setCoords(x, y-1);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
		}
		else { // top row
			if(right && left && bot) { // no empty cells
				survSteps++;
				return;
			}
			int random = rand() % 3;
			if(random == 0 && !bot) { // go to bottom
				setCoords(x+1, y);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
			else if(random == 1 && !right) { // go to right
				setCoords(x, y+1);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
			else { // go to left
				setCoords(x, y-1);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
		}
	}
	else if(x == b->getSize()) {
		if(y == 0) { // bottom left corner
			if(right && top) { // no empty cells
				survSteps++;
				return;
			}
			int random = rand() % 2;
			if(random == 0 && !top) { // go to top
				setCoords(x - 1, y);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
			else { // go to right
				setCoords(x, y + 1);
				survSteps++;
				b->setCell(x, y, (Organism *) NULL);
			}
		}
		else if(y == b->getSize()) { // bottom right corner
			if(y == 0) { // bottom left corner
				if(left && top) { // no empty cells
					survSteps++;
					return;
				}
				int random = rand() % 2;
				if(random == 0 && !top) { // go to top
					setCoords(x - 1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else { // go to left
					setCoords(x, y - 1);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
			}
			else { // bottom row
				if(right && left && top) { // no empty cells
					survSteps++;
					return;
				}
				int random = rand() % 3;
				if(random == 0 && !top) { // go to top
					setCoords(x-1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else if(random == 1 && !right) { // go to right
					setCoords(x, y+1);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else { // go to left
					setCoords(x, y-1);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
			}
		}
		else {
			if(y == 0) { // left side
				if(right && bot && top) { // no empty cells
					survSteps++;
					return;
				}
				int random = rand() % 3;
				if(random == 0 && !top) { // go to top
					setCoords(x-1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else if(random == 1 && !right) { // go to right
					setCoords(x, y+1);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else { // go to bottom
					setCoords(x + 1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
			}
			else if(y == b->getSize()) { // right side
				if(left && bot && top) { // no empty cells
					survSteps++;
					return;
				}
				int random = rand() % 3;
				if(random == 0 && !top) { // go to top
					setCoords(x-1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else if(random == 1 && !left) { // go to left
					setCoords(x, y-1);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else { // go to bottom
					setCoords(x + 1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
			}
			else { // middle
				if(right && left && bot && top) { // no empty cells
					survSteps++;
					return;
				}
				int random = rand() % 4;
				if(random == 0 && !top) { // go to top
					setCoords(x-1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else if(random == 1 && !left) { // go to left
					setCoords(x, y-1);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else if(random == 2 && !right) { // go to right
					setCoords(x, y+1);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
				else { // go to bottom
					setCoords(x + 1, y);
					survSteps++;
					b->setCell(x, y, (Organism *) NULL);
				}
			}
		}

	}
	x = getX();
	y = getY();
	if(survSteps%3 == 0){//checks for breeding by finding the modulo 3 value of survival steps (this avoids the need to reset survSteps after every if statement)
		if(x == 0) {
			if(y == 0) { // top left corner
				int random = rand() % 2;
				if(random == 0 && !bot) { // go to bottom
					b->setCell(x + 1, y, new Ant(x+1, y));
				}
				else { // go to right
					b->setCell(x, y+1, new Ant(x, y+1));
				}
			}
			else if(y == b->getSize()) { // top right corner
				int random = rand() % 2;
				if(random == 0 && !bot) { // go to bottom
					b->setCell(x + 1, y, new Ant(x+1, y));
				}
				else { // go to left
					b->setCell(x, y-1, new Ant(x, y-1));
				}
			}
			else { // top row
				int random = rand() % 3;
				if(random == 0 && !bot) { // go to bottom
					b->setCell(x + 1, y, new Ant(x+1, y));
				}
				else if(random == 1 && !right) { // go to right
					b->setCell(x, y+1, new Ant(x, y+1));
				}
				else { // go to left
					b->setCell(x, y-1, new Ant(x, y-1));
				}
			}
		}
		else if(x == b->getSize()) {
			if(y == 0) { // bottom left corner
				int random = rand() % 2;
				if(random == 0 && !top) { // go to top
					b->setCell(x - 1, y, new Ant(x-1, y));
				}
				else { // go to right
					b->setCell(x, y+1, new Ant(x, y+1));
				}
			}
			else if(y == b->getSize()) { // bottom right corner
				if(y == 0) { // bottom left corner
					int random = rand() % 2;
					if(random == 0 && !top) { // go to top
						b->setCell(x - 1, y, new Ant(x-1, y));
					}
					else { // go to left
						b->setCell(x, y-1, new Ant(x, y-1));
					}
				}
				else { // bottom row
					int random = rand() % 3;
					if(random == 0 && !top) { // go to top
						b->setCell(x - 1, y, new Ant(x-1, y));
					}
					else if(random == 1 && !right) { // go to right
						b->setCell(x, y+1, new Ant(x, y+1));
					}
					else { // go to left
						b->setCell(x, y-1, new Ant(x, y-1));
					}
				}
			}
			else {
				if(y == 0) { // left side
					int random = rand() % 3;
					if(random == 0 && !top) { // go to top
						b->setCell(x - 1, y, new Ant(x-1, y));
					}
					else if(random == 1 && !right) { // go to right
						b->setCell(x, y+1, new Ant(x, y+1));
					}
					else { // go to bottom
						b->setCell(x + 1, y, new Ant(x+1, y));
					}
				}
				else if(y == b->getSize()) { // right side
					int random = rand() % 3;
					if(random == 0 && !top) { // go to top
						b->setCell(x - 1, y, new Ant(x-1, y));
					}
					else if(random == 1 && !left) { // go to left
						b->setCell(x, y-1, new Ant(x, y-1));
					}
					else { // go to bottom
						b->setCell(x + 1, y, new Ant(x+1, y));
					}
				}
				else { // middle
					int random = rand() % 4;
					if(random == 0 && !top) { // go to top
						b->setCell(x - 1, y, new Ant(x-1, y));
					}
					else if(random == 1 && !left) { // go to left
						b->setCell(x, y-1, new Ant(x, y-1));
					}
					else if(random == 2 && !right) { // go to right
						b->setCell(x, y+1, new Ant(x, y+1));
					}
					else { // go to bottom
						b->setCell(x + 1, y, new Ant(x+1, y));
					}
				}
			}

		}
	}
}

/**
 * @author Kyle Smith
 * Determines whether an Organism is prey (Ants are prey, Doodlebugs are not)
 * @return True if the Organism is prey, false otherwise
 */
bool Ant::isPrey() {
	return true;
}
