#include "Event.h"
#include <cstdlib>

#ifndef TELLERQUEUE_H_
#define TELLERQUEUE_H_

class TellerQueue {
public:
	TellerQueue();
	virtual ~TellerQueue();
	static int shortestLine;
	int getLength();
	void insertItem(Event item);
	void removeItem(Event item);
	Event getHead();
private:
	int length;
	class node;
	node *head;

	class node {
	public:
		Event item;
		node *next;

		inline node(Event e) : item(e), next(NULL) {};
	};
};

#endif /* TELLERQUEUE_H_ */
