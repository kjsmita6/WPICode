#ifndef DOODLEBUG_H_
#define DOODLEBUG_H_

//class Organism;
#include "Organism.h"

class Doodlebug: public Organism {
public:
	Doodlebug();
	Doodlebug(int x, int y);
	virtual ~Doodlebug();
	void move(Board *b);
	bool isPrey();
private:
	int survSteps;
	int eatSteps;
};

#endif /* DOODLEBUG_H_ */
