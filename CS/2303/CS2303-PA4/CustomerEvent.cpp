/*
 * CustomerEvent.cpp
 *
 *  Created on: Feb 9, 2018
 *      Author: kjsmith
 */

#include "CustomerEvent.h"

/**
 * @author Kyle Smith
 * Constructor, instantiates the objects and the instance variables
 * @param arrivalTime The time the customer arrived at the bank
 */
CustomerEvent::CustomerEvent(double arrivalTime) {
	setTime(arrivalTime);
	isServed = false;
}

/**
 * @author Kyle Smith
 * Destructor
 */
CustomerEvent::~CustomerEvent() {
	delete this;
}

/**
 * @author Kyle Smith
 * Determines if a customer has been served already
 * @return True if the customer has already been served, false if they are still waiting
 */
bool CustomerEvent::hasBeenServed() {
	return isServed;
}

/**
 * @author Kyle Smith
 * Serve the customer (set isServed to the opposite value)
 * If the customer has already been served, nothing will happen
 */
void CustomerEvent::serve() {
	if(isServed) {
		return; // don't do anything if the customer has already been served
	}
	isServed = true;
}

/**
 * @author Kyle Smith
 * Method that is invoked when a CustomerEvent is removed from the queue
 */
void CustomerEvent::action() {
	serve();
	this->~CustomerEvent(); // serve the customer and dispose of the object
}
