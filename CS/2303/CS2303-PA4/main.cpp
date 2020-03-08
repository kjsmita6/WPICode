#include "Event.h"
#include "CustomerEvent.h"
#include "TellerEvent.h"
#include "EventQueue.h"
#include "TellerQueue.h"
#include <iostream>
#include <cstdlib>
#include <typeinfo>
#include <cstring>
#include <cmath>

/**
 * @author Akshaj Balasubramanian
 * Function to generate the service time for a teller
 * @param averageServiceTime is the user-input value for the average time taken by each teller to service it
 * @return the service time
 */
double tellerServiceTime(double averageServiceTime){
	double serviceTime = 2*averageServiceTime*(rand()/double(RAND_MAX));//calculation for serviceTime
	return serviceTime;
}

/**
 * @author Akshaj Balasubramanian
 * Function to find the shortest teller queue in an array of teller queues
 * @param tqArr is an array of teller queues
 * @param numTell is the number of tellers
 * @return the shortest teller queue in an array of teller queues
 */
TellerQueue shortestLine(TellerQueue *tqArr, int numTell){
	int shortest = tqArr[0].getLength();//sets the shortest length to the length of the first tellerqueue in the array
	TellerQueue shortestTQ = tqArr[0];//sets the first teller queue in the array as the shortest queue
	for(int i = 1; i < numTell; i++){
		//loop invariant: determines the shortest teller queue in an array of teller queues
		if(tqArr[i].getLength() < shortest){//check for shortest
			shortest = tqArr[i].getLength();//sets shortest
			shortestTQ = tqArr[i];//sets shortest
		}
	}
	return shortestTQ;//returns shortest teller queue
}

/**
 * @author Kyle Smith
 * Program entry function
 */
int main(int argc, char *argv[]) {
	int numCust;//number of customers
	int numTell;//number of tellers
	int simTime;//total simulation time
	double servTime;//average service time
	int seed;//a number that determined the pattern of the random function

	EventQueue *queue = new EventQueue();//creates a new event queue to put customer events and teller events into

	if(argc < 5 || argc > 6) { // not enough args or too many
		std::cerr << "Usage: ./qSim <customers> <tellers> <simulationTime> <serviceTime> [seed]" << std::endl;//error message
		return 1;
	}
	if(argc == 6) {//checks if the number of arguments in 6 (i.e. whether the user is assigning a seed)
		seed = atoi(argv[5]);
		srand(seed);
	}
	else if(argc == 5) {//assignments
		numCust = atoi(argv[1]);
		numTell = atoi(argv[2]);
		simTime = atoi(argv[3]);
		servTime = atof(argv[4]);
		seed = 0;
		srand(time(NULL));
	}

	//TellerQueue *lines = new TellerQueue[numTell];

	double totalCustTime = 0;//total customer time
	double avgCustTime = 0;//average customer time
	double sumOfSquares = 0;//sum of the squares of customer times, used in calculation of the standard deviation
	double stdev = 0;//standard deviation
	double maxWaitTime = 0;//stores the maximum waiting time
	for(int i = 0; i < numCust; i++) {
		//Loop Invariant: adds CustomerEvents to the EventQueue and runs calculations
		double arrTime = simTime * (rand()/double(RAND_MAX));//calculates the arrival time for the customer
		CustomerEvent *custEvent = new CustomerEvent(arrTime);//creates a new customer event with the arrival time
		queue->insertItem(*custEvent);//inserts the item into a queue
		double serviceTime = tellerServiceTime(servTime);//service time for each customer
		sumOfSquares = sumOfSquares + serviceTime*serviceTime;//keeping total of the sum of squares
		if(serviceTime > maxWaitTime){//checks for the maximum waiting time
			maxWaitTime = serviceTime;
		}
		totalCustTime = totalCustTime + serviceTime;//keeping total of total customer time
		if(totalCustTime > simTime){//checks whether the total customer time is greater than the simulation time
			numCust = i;//re-assigns a value to numCust to represent the number of customers actually served
			break;//breaks out of the loop
		}
	}
	avgCustTime = totalCustTime/numCust;//calculates average customer time
	stdev = pow(((sumOfSquares/numCust) - (avgCustTime*avgCustTime)), 0.5);//calculates standard deviation

	double totalIdleTime = 0;//keeps total of the total idle time
	for(int i = 0; i < numTell; i++){
		//Loop Invariant: adds TellerEvents to the EventQueue
		double idleTime = (rand()%601)/60.0;//guaranteed to generate a number between 0 and 600 seconds inclusive
		TellerEvent *tellEvent = new TellerEvent(idleTime);//creates a new teller event with the idle time
		queue->insertItem(*tellEvent);//inserts teller event into the queue
		totalIdleTime = totalIdleTime + idleTime;//calculates the totalIdleTime
	}
	//outputs the results
	std::cout << "The following data is for the common line case " << stdev << std::endl;
	std::cout << "The standard deviation is " << stdev << std::endl;
	std::cout << "The total customers served is " << numCust << std::endl;
	std::cout << "The average service time is " << avgCustTime << std::endl;
	std::cout << "The maximum service time is " << maxWaitTime << std::endl;
	std::cout << "The total time to serve customers (and total teller service time) was " << totalCustTime << std::endl;
	std::cout << "The number of tellers was " << numTell << std::endl;
	std::cout << "The total idle time of all tellers was " << totalIdleTime << std::endl;

	// We tried this for the multiple tellers case but it didn't work
	/*while(currentTime <= simTime){
		//loop invariant: checks that the current time has not been passed
		for(int i = 0; i < numCust+numTell; i++){
			//loop invariant: checks whether the tellers have something to attend to
			if(lines[i].getLength() == 0){//this statement checks if the teller queues is empty, and adds the head of the event queue to the respective teller queue
				lines[i].insertItem(queue->getHead());
				if(strcmp(queue->getHead().getType(), "Customer")){
					if(queue->getHead().getTime() > maxWaitTime){
						maxWaitTime = queue->getHead().getTime();
					}
					currentTime = queue->getHead().getTime();
				}
				queue->removeItem(queue->getHead());

			}
			else if(lines[i].getLength() != 0) {
				lines[i].removeItem(lines[i].getHead());
			}

		}
		if(queue->getLength() == 0){
			currentTime = currentTime + simTime;
		}
	}*/
	return 0;//return
}
