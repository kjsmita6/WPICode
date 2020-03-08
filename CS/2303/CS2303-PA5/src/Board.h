#ifndef BOARD_H_
#define BOARD_H_

#include <vector>
//#include "Ant.h"
//#include "Doodlebug.h"
class Ant;
class Doodlebug;
class Organism; // forward declaration, otherwise Board and Organism would have an infinite recursive inclusion
                // i.e. Board includes Organism and Organism includes Board

//#include "Organism.h"

class Board {
public:
    Board();
    Board(int l);
    virtual ~Board();
    Organism ***createBoard(int r, int c);
    Organism *getCell(int x, int y);
    void setCell(int x, int y, Organism *morg);
    int getSize();
    void printGrid();
    void randAddOrg(unsigned int numDoodle, unsigned int numAnt);
    std::vector<Ant*> *getAntList();
    std::vector<Doodlebug*> *getDoodleList();
    Board *copyBoard();
private:
    Organism ***board;
    int size;
    std::vector<Ant*> *antList;
    std::vector<Doodlebug*> *doodleList;
};

#endif
