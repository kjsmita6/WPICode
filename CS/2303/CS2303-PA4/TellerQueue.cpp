#include "TellerQueue.h"
#include "Event.h"
#include <cstdlib>

/**
 * @author Kyle Smith
 * TellerQueue constructor
 */
TellerQueue::TellerQueue() {
	head = NULL;
}

/**
 * @author Kyle Smith
 * TellerQueue destructor
 */
TellerQueue::~TellerQueue() {
	node *p = head;
	while(!p) {
		node *q = p->next;
		delete p; // delete every object in the TellerQueue
		p = q;
	}
	length = 0;
}

/**
 * @author Kyle Smith
 * Gets the length of the line
 * @return Length of the line
 */
int TellerQueue::getLength() {
	return length;
}

/**
 * @author Kyle Smith
 * Inserts an Event into the linked list
 * This function is implemented the exact same way as in EventQueue
 * @param item The Event to insert
 */
void TellerQueue::insertItem(Event item) {
	node *p = new node(item);
	if(!head) {
		head = p;
	}
	else if(item.getTime() < head->item.getTime()) {
		p->next = head;
		head = p;
	}
	else {
		node *q = head;
		while((q->next) && q->next->item.getTime() < item.getTime()) {
			q = q->next;
		}
		p->next = q->next;
		q->next = p;
	}
	length++;
}

/**
 * @author Kyle Smith
 * Removes an item from the queue
 * This method is implemented the same way as in EventQueue
 * @param item The Event to remove
 */
void TellerQueue::removeItem(Event item) {
	node *prev = head;
	node *curr = head->next;
	while(!curr) {
		if(&curr->item != &item) { // haven't gotten to the part of the list with the item yet
			prev = curr;
			curr = curr->next; // go to the next node
		}
	}
	if(!curr) {
		return; // item not found
	}
	prev->next = curr->next; // shift the list down 1
	delete curr; // and delete the copy of the list with the item
}

/**
 * @author Akshaj Balasubramanian
 * Gets the head of the queue
 */
Event TellerQueue::getHead() {
	return head->item;
}
