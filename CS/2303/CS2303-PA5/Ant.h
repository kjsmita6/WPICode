#ifndef ANT_H_
#define ANT_H_

#include "Organism.h"
//class Organism; //forward declaration

class Ant: public Organism {
public:
	Ant();
	Ant(int x, int y);
	virtual ~Ant();
	void move(Board *b);
	bool isPrey();
private:
	int survSteps;
};

#endif /* ANT_H_ */
