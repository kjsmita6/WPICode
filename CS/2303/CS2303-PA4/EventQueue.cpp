#include "Event.h"
#include "EventQueue.h"
#include <cstdlib>
#include <iostream>

/**
 * @author Kyle Smith
 * EventQueue constructor
 */
EventQueue::EventQueue() {
	head = NULL;
}

/**
 * @author Kyle Smith
 * EventQueue destructor
 */
EventQueue::~EventQueue() {
	node *p = head;
	while(!p) {
		node *q = p->next;
		delete p; // delete all the root objects (p) and move to the next one (q)
		p = q;
	}
}

/**
 * @author Kyle Smith
 * Inserts an Event into the linked list
 * @param item The Event to insert
 */
void EventQueue::insertItem(Event item) {
	node *p = new node(item);
	if(!head) { // if the list is empty, set head to a new node
		head = p;
	}
	else if(item.getTime() < head->item.getTime()) { //
		p->next = head; // shift the list down 1 to insert the item in alphabetical order
		head = p;
	}
	else {
		node *q = head;
		while((q->next) && q->next->item.getTime() < item.getTime()) {
			q = q->next; // move to the next item until one is reached that has a greater time than item
		}
		p->next = q->next; // when one is found, insert item
		q->next = p;
	}
	length++;
}

/**
 * @author Akshaj Balasubramanian
 * Gets the head of the queue
 */
Event EventQueue::getHead() {
	return head->item;
}

/**
 * @author Kyle Smith
 * Removes an item from the queue
 * @param item The Event to remove
 */
/*
void EventQueue::removeItem(Event item) {
	node *prev = head;
	node *curr = head->next;
	while(curr) {
		if(&prev->item != &item) { // haven't gotten to the part of the list with the item yet
			prev = curr;
			curr = curr->next; // go to the next node
		}
	}
	if(!curr) {
		return; // item not found
	}
	prev = curr;
	delete curr;
}
*/
void EventQueue::removeItem(Event item) {
	node *prev = head;
	while(prev && &prev->item != &item) {
		prev = prev->next; // move to the next item until the one that we want is found
	}
	if(prev != NULL) {
		if(prev->next != NULL) {
			node *tmp = prev->next; // delete the item and shift the list
			prev->next = prev->next->next;
			delete tmp;
		}
	}
	else {
		delete prev;
	}
}

/**
 * @author Kyle Smith
 * Prints the queue to the console
 */
void EventQueue::printQueue() {
	printItem(head);
}

/**
 * @author Kyle Smith
 * Recursively prints the queue, needed because type node is private
 * @param first First element in the linked list (queue)
 */
void EventQueue::printItem(node *first) {
	std::cout << first->item.getTime() << std::endl;
	if(first->next){
		printItem(first->next); // recursively print the times of every item in the queue
	}
}
/**
 * @author Akshaj Balasubramanian
 * Gets the length of the line
 * @return Length of the line
 */
int EventQueue::getLength() {
	return length;
}
