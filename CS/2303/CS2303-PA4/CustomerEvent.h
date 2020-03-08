/*
 * CustomerEvent.h
 *
 *  Created on: Feb 9, 2018
 *      Author: kjsmith
 */

#ifndef CUSTOMEREVENT_H_
#define CUSTOMEREVENT_H_

#include "Event.h"

class CustomerEvent: public Event {
public:
	CustomerEvent(double arrivalTime);
	virtual ~CustomerEvent();
	void serve();
	bool hasBeenServed();
	void action();
private:
	bool isServed;
};

#endif /* CUSTOMEREVENT_H_ */
