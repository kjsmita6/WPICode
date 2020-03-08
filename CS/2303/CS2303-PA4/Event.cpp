/*
 * Event.cpp
 *
 *  Created on: Feb 9, 2018
 *      Author: kjsmith
 */

#include "Event.h"

Event::Event() {

}

Event::~Event() {
	// TODO Auto-generated destructor stub
}

/**
 * @author Kyle Smith
 * Gets the time that an Event happens
 * @return Time
 */
double Event::getTime() {
	return time;
}

/**
 * @author Kyle Smith
 * Sets the time of the Event
 * @param t New time
 */
void Event::setTime(double t) {
	time = t;
}

/**
 * @author Kyle Smith
 * Method that is invoked when the Event is removed from the queue
 */
void Event::action() {
	return;
}
