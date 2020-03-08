#include "Event.h"
#include <cstdlib>

#ifndef EVENTQUEUE_H_
#define EVENTQUEUE_H_

class EventQueue {
public:
	EventQueue();
	virtual ~EventQueue();
	void insertItem(Event item);
	void removeItem(Event item);
	Event getHead();
	void printQueue();
	int getLength();
private:
	class node;
	node *head;
	void printItem(node *head);
	int length;

	class node { // linked list inside of EventQueue
	public:
		Event item;
		node *next;

		inline node(Event e) : item(e), next(NULL) {};
	};
};

#endif /* EVENTQUEUE_H_ */
