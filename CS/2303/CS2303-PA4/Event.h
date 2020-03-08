/*
 * Event.h
 *
 *  Created on: Feb 9, 2018
 *      Author: kjsmith
 */


#ifndef EVENT_H_
#define EVENT_H_

class Event {
private:
	double time;
public:
	Event();
	virtual ~Event();
	double getTime();
	void setTime(double t);
	void action();
};

#endif /* EVENT_H_ */
