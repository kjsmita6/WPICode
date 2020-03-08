/*
 * TellerEvent.cpp
 *
 *  Created on: Feb 9, 2018
 *      Author: kjsmith
 */

#include "TellerEvent.h"

TellerEvent::TellerEvent(double t) {
	setTime(t);
	idleTime = t;
}

TellerEvent::~TellerEvent() {
	delete this;
}

/**
 * @author Kyle Smith
 * Method that is invoked when a teller is removed from the queue
 */
void TellerEvent::action() {

}
