#ifndef ORGANISM_H_
#define ORGANISM_H_

class Board; // forward declaration, see Board.h

#include "Board.h"

class Organism {
private:
	int x;
	int y;
public:
	Organism();
	virtual ~Organism();
	virtual void move(Board *b) = 0;
	virtual bool isPrey() = 0;
	int getX();
	int getY();
	void setCoords(int x, int y);
};

#endif /* ORGANISM_H_ */
