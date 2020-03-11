#


Project 4 (100 points)
 Assigned: Monday, February 4, 2018
Due: Monday, February 12, 2018, 8:00 PM

Programming Assignment #4 — Event Driven Simulation


Programming Assignment #4 — Event Driven Simulation

### Abstract

Write a _C++_ program that simulates the activity of customers in queues at a bank.

### Outcomes

After successfully completing this assignment, you should be able to:–

- Develop a non-trivial _C++_ program
- Write a program that simulates some real-world activity
- Use linked lists in _C++_
- Use a random number generator

### Before Starting

The very first thing you need to do is set up your repository on WPI&#39;s Git server. This will allow you to back up your source code as you develop it. The document _Guide For Using FusionForge_ (which is on Canvas under Policies &amp; Instructions) explains how to do this. Note that this involves sending a request to the server administrators. Since it might take a day or more for them to respond, do this as soon as possible.

When it comes time to create your program in Eclipse, follow the instructions in the document _Creating an Eclipse Project From Scratch_, also on Canvas. Note that using Git from inside Eclipse requires version 4.2 of Eclipse, which is already installed on the course VM. The Git plugin does not work on Eclipse version 3.8, which is what installs by default with Ubuntu 16.04 LTS..

Read Chapter 6 of _Absolute C++_, which reviews **structs** from _C_ and introduce classes in _C++_. Also read §7.1, which describes _constructors_ and their use, and read §10.1 regarding **new** , **delete** , and _destructors_. Classes are, of course, at the heart of the _C++_ language, and **new** , **delete** , constructors, and destructors are the principal means of creating and destroying objects of those classes.

Also read §17.1 of _Absolute C++_, which is a good introduction to the general concept of linked list.

### Event-driven Simulations

An _event-driven simulation_ is a computer program that mimics the behavior of people or objects in a system in response to events that occur at certain times. The program must maintain a data object for each person or object (called an _actor_) and place it in a queue according to the time of its event. It then reads the queue in the order of the events and, for each event, causes the corresponding actor to do its actions scheduled for that time. The action of the actor may be to change its own state, change the state of the system, do something on behalf of another actor, or something else. Sometimes, the action will cause the actor to rejoin the event queue for a subsequent action. Sometimes, the action may add some other actor to the event queue or to another queue.

_Example:_ In a simulation of a radar system, an event might represent the transmission of a pulse at a certain time _t_. When simulated time _t_ arrives, the simulator invokes the action (i.e., method) of the pulse event. This action enumerates the targets for the pulse and, for each target, computes the round trip time __ of the pulse and adds a new event to the event queue for time _t +_ __representing the return of the reflected signal.1

In this assignment, you will simulate customers arriving at a bank and standing in line in front of one of the tellers. People arrive at random intervals. Each person waits in his/her selected line until reaching the head of that line. When a person reaches the head of his line, the teller provides service for a random amount of time. After the service is completed, the person leaves the bank. The purpose of the simulation is to measure the average amount of time people spend between arriving at the bank and leaving the bank.

Assume that when there is a separate line for each teller, a newly arrived person joins the shortest line (or selects randomly among the set of equally short lines) and stays in that line until served. That is, no person leaves a line without being served, and no person hops from one line to another.

If a teller has finished serving a customer and there are no other customers waiting in its line, the teller selects the first customer from the line of another, randomly-chosen teller and serves that customer. If there are no customers waiting at all, the teller does other duties for a (small) random amount of time before checking the lines again.

The entire purpose of this simulation is to compare the performance of a single line serving all tellers _versus_ separate lines for each teller.

### Implementing your program

Your program should be called **qSim**. It needs to do several things:–

- Get and interpret the program parameters from the command line.
-
Create a class object for each customer indicating his/her arrival time at the bank. Arrival times are determined from a uniform random number generator and the input parameters of the simulation. Also create a class object for each teller, with a random idle time in the range 1-600 seconds. _All constants in this simulation must be defined symbolically.__2_
- Create a single _event queue_ in the form of a linked list. The members of the linked list may be customer events or teller events.
- Place each object in the _event queue_ sorted according to the time of its event. That is, the event with the earliest time is at the head of the queue, and the event with the latest time is at the tail of the queue. Note: Your program instantiates all the customer-arrival objects at the beginning of the program; as it creates each one, the object is given a random arrival time (sometime during the day) and then put into the queue.
- Play out the simulation as follows: take the first event off the _event queue_, advance a simulated _clock_ to the time of that event, and invoke the action method associated with that event. Continue until the event queue is empty.
- Print out the statistics gathered by the simulation.

For this assignment, you will need to play the simulation twice — once for a bank with a single queue and multiple tellers and once for a bank with a separate queue for each teller. Draw some comparison about the average time required for a person to be served at the bank under each queue regime.

Here are some of the actions that can occur when an _event_ reaches the head of the _event queue_:

- If the event represents a newly arrived customer at the bank, add that person onto the end of a teller line — either the common line (in the case of a bank with a single line for all tellers) or to the shortest teller line. If there are several equally short teller lines, choose one at random.
- If the event represents a customer whose service at the bank has been completed, collect statistics about the customer: in particular, how long has the customer been in the bank, from arrival time to completion of teller service. After collecting the statistics, the customer leaves the bank and its **Event** object is deleted.
- If the event represents a teller who has either completed serving a customer or has completed an idle time task, gather statistics about that teller. If there is no customer waiting in any line, put a teller event back into the _event queue_ with a random idle time of 1-150 seconds.

If there is a customer waiting in line, remove the first customer from its line, generate a random service time according to the input parameters of the program, and add _two_ events to the event queue, sorted by time. One is a customer event and represents the completion of that service. The other event is a teller event representing completion of a service and to look for the next customer (or to idle).

#### Class Hierarchy

You must define one or more classes that allow you to represent _Events_, _Customers_, and _Tellers_. It is suggested that the most important class of your simulation should be **Event**. How you distinguish between events associated with customers and events associated with tellers is your choice.

#
Since C++ is an object-oriented language, the preferred approach would be to make **Event** a class and to derive **CustomerEvent** and **TellerEvent** from it. That is, **Event** would be the _base class_ (a.k.a. _parent class_), and the other two would be _derived classes_ (a.k.a. _subclasses_ or _child classes_).

Two methods of an **Event** are to add it to the **event**** queue **and to remove it from the** event ****queue**. In addition, each **Event** has an **action** method that is to be invoked when an **Event** is removed from the **event**** queue **. The** action** method should somehow distinguish between _customers_ and _tellers_ and invoke the appropriate _action_ function for that kind of event (if you define this in the parent class and override it in each subclass, this happens automatically). These should perform the appropriate action for a customer or teller, depending upon the type of the object that this action represents.

Each line in front of a teller should be implemented by an instance of a class called **tellerQueue**. For this assignment, do _not_ attempt to use the **queue** container class from the Standard Library. Implement this class using a linked list, similarly to what you would have done in _C_. You will need to write methods to add customers to the end of the linked list and to remove them from the head of the list. In addition, include a _static variable_ in the **tellerQueue** class that indicates which line (i.e., instance of the **tellerQueue** class) is the shortest. If more than one line is equally short, select one at random.

The **eventQueue** itself should also be implemented by a linked list. You will need to write a method to add an **Event** to the **eventQueue** in time order. This method should iterate through the list until it finds an **Event** with a time greater than the **Event** being inserted, and then it should insert the new **Event** just before that **Event**. (Note: This implies that if two events happen to have the same time, the one added to the queue second goes after the event added first. Also, remember that it is possible that the event being added will become the new head of the queue.) You will also need a method to remove an **Event** from the **event**** queue **and invoke the** action**method of the event. For extra credit (see below), you may implement a**priority\_queue** class from the _Standard Template Library_.

#### Input

The command line of your program should be of the following form:

./qSim #customers #tellers simulationTime averageServiceTime <seed>

The numbers of customers and tellers should be integers, and the simulation and average service times should be floating point numbers in units of minutes. The seed is optional and indicates a fixed seed for starting the random number generator (see below) For example,

./qSim 100 4 60 2.3

should be interpreted to mean that 100 customers and four tellers should be simulated over a period of 60 simulated minutes. The service time for each teller is an _average_ of 2.3 minutes. No random number seed is specified.

#### Random Number Generation

To generate random numbers, use the function **rand()**, which is described in Figures 3.2 and 3.4 and the end of §3.1 of _Absolute C++._ These are also described on pages 46 and 252 of Kernighan &amp; Ritchie. The function **rand()** is a _pseudo random number generator_. It generates a different number each time it is called, and those numbers look like they are random in the range **0 … RAND\_MAX**. In reality, however, it can generate the exact same sequence of &quot;random&quot; numbers repeatedly, to make it possible for you to debug your program. To use **rand()**, you need to include **<cstdlib>** and specify the appropriate **using** directive.

Random number generators work by maintaining one or more internal counters and performing a contorted transformation on the most recent number generated to get a new one that appears to be unrelated to the previous one. The random sequence can be initialized by calling **srand(seed)**at the beginning of your program,3 where **seed** is an unsigned integer value. If you did not specify a **seed** in the command line, use some number that is likely to be truly random, such as the time returned from **time(NULL)**, which is also part of **<cstdlib>**. This seeds the random number generator to the current time.

To generate random arrival times with a uniform distribution, the following is suggested:–

float arrTime = simulationTime \* rand()/float(RAND\_MAX);4

It is useful to generate all customer arrivals at the beginning of the program and put them into the **event**** queue** in order of arrival time.

To generate random service times, the following is suggested:–

float serviceTime = 2\*averageServiceTime\*rand()/float(RAND\_MAX);5

### Output

After your simulation has completed for both types of queuing regimes, you should print out a summary with the following information:–

- Total number of customers served and total time required to serve all customers
- Number of tellers and type of queuing (one per teller or common)
- Average (i.e., mean) amount of time a customer spent in the bank and the standard deviation
- Maximum wait time from the time a customer arrives to the time he/she is seen by a teller.
- Total amount of teller service time and total amount of teller idle time.

The information that you need to print should determine the statistics that you gather during the simulations.

Note that the need to gather statistics will affect what information you store in the **Event** objects, and how long you keep them. For example, to calculate the average amount of time a customer spent in the bank, you could either (a) keep all the **CustomerEvent** objects and then calculate the average at the end, or (b) you could keep a running total of the times, and the number of customers, and then divide at the end.

### Teams

You may optionally work in two-person teams. To form a team, you need to &quot;register&quot; your team in _Canvas_ by sending an e-mail to [cs2303-staff@cs.wpi.edu](mailto:cs2303-staff@cs.wpi.edu). We assume that both teammates share the workload approximately equally, and both teammates will receive the same grade.

### Deliverables

This project _must_ be carried out on the course virtual machine using your favorite development environment. It must be named **PA4\_username** , where **username** is replaced by your WPI login username (or team name).You must provide the following:

- The exported project files of your project, including **.h** files and **.cpp** files to implement your simulation, and the **makefile**. The target of the makefile should be called **qSim**.
- At least three different test cases that show the behavior of the bank under both queuing regimes. Show the command line and the output. The **script** command might come in handy here.
- A document called **README.txt** , **README.pdf** , **README.doc** , or **README.docx** summarizing your program, how to run it, and detailing any problems that you had. It must explain how you represent _events_, _customers_, and _tellers._ Also, if you borrowed all or part of the algorithm for this assignment, be sure to cite your sources _and_ explain in detail how it works.
- An analysis of your results — i.e., under what circumstances a single queue is better or worse than a queue per teller. You may include this analysis in your **README** document.

Before submitting your assignment, _clean_ your projectto get rid of extraneous files. Export your files as a single zip file from _Eclipse_, as explained at the end of _Lab 2_.

Submit to _Canvas_. This assignment is named _Programming Assignment # __4__._

### Some Other Tips

During development, be sure to regularly compile your program, even though it does not yet have full functionality. This helps you catch errors early.

During development, be sure to backup (i.e., commit and push) your source code regularly using Git. This will help you recover from programming mistakes, accidental deletion of files, and corruption of your virtual machine.

During development, you may want to create some functions which will not be invoked in the final version, such as ones for printing the current contents of the event queue. You can leave these in your source code.

### Grading

This assignment is worth 100 points. _Your program_ must _compile on the course virtual machine without errors in order to receive_ any _credit._ If you develop on a platform other the course virtual machine, please export it to the course virtual machine for testing, in order to avoid surprises.

### Extra Credit

For 15 points of extra credit, define and implement the **eventQueue** class using the **priority\_queue** class from the _Standard Template Library_. The priorities are the event times of the **Event** objects representing the customers and the tellers.

Note:  A penalty of ten points will be assessed if your project is not _clean_ before creating the zip file or for submitting your programs in some format other than a _zip_ file.

Note 2: If your program does not compile correctly on the course virtual machine using the **makefile** , the graders will attempt to contact you via e-mail. You will have 24 hours from the time of the graders&#39; email to resubmit a corrected version, and a penalty of 25% will be assessed (in addition to other penalties). This is called the Intervention Penalty.