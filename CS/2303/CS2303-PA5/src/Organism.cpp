#include "Organism.h"

/**
 * @author Kyle Smith
 * Organism constructor, sets x and y to 0.
 */
Organism::Organism() {
    x = 0;
    y = 0;
}

/**
 * @author Kyle Smith
 * Organism destructor
 */
Organism::~Organism() {
    x = 0;
    y = 0;
}

/**
 * @author Kyle Smith
 * Gets the x coordinate occupied by the Organism
 * @return x coordinate of the Organism
 */
int Organism::getX() {
    return x;
}

/**
 * @author Kyle Smith
 * Gets the y coordinate occupied by the Organism
 * @return y coordinate of the Organism
 */
int Organism::getY() {
    return y;
}

/**
 * @author Kyle Smith
 * Sets the coordinates of the Organism
 * @param x1 New x coordinate
 * @param y1 New y coordinate
 */
void Organism::setCoords(int x1, int y1) {
    x = x1;
    y = y1;
}
