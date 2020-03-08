PA4_kjsmith -- Kyle Smith, Akshaj Balasubramanian

This is a program which simulates a bank, with a user-defined amount of tellers and customers.
Steps to run:

$ make
$ ./qSim <customer amount> <teller amount> <simulation time> <average service time> [seed]

Where parameters enclosed in <> are required, and [] are optional.

The event of a customer being served is represented as a class called CustomerEvent.
This class has 1 field: the time they arrived at the bank.

The event of a teller being idle (i.e. no customers) is represented as a class called TellerEvent.
This class also has 1 field: the time that the teller is idle for (1-600 seconds).

Both CustomerEvent and TellerEvent are stored in different queues, implemented as
a linked list. The main queue is called an EventQueue, and is used when there is only 1
line with multiple tellers. The secondary queue is called a TellerQueue, and is used
when there is 1 line for each teller. When a CustomerEvent reaches the front of a queue,
it means they are going to be served by a teller. When a TellerEvent reaches the front
of the queue, it means they are going to be idle.

We did the entire class hierarchy and all the methods in each one but when we tried to put
them together it didn't end up working. This was for the simulation with a different queue
for every teller (as opposed to a single queue with multiple tellers).
