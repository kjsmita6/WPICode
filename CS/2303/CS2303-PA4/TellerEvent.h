/*
 * TellerEvent.h
 *
 *  Created on: Feb 9, 2018
 *      Author: kjsmith
 */

#ifndef TELLEREVENT_H_
#define TELLEREVENT_H_

#include "Event.h"

class TellerEvent: public Event {
private:
	double idleTime;
public:
	TellerEvent(double idleTime);
	virtual ~TellerEvent();
	void action();
};

#endif /* TELLEREVENT_H_ */
