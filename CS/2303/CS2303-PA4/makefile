all: qSim

CFLAGS = -g -Wall
 
qSim: TellerQueue.o CustomerEvent.o Event.o TellerEvent.o EventQueue.o main.o
	g++ $(CFLAGS) main.o TellerQueue.o CustomerEvent.o Event.o TellerEvent.o EventQueue.o -o qSim
	
main.o: main.cpp
	g++ $(CFLAGS) -c main.cpp

TellerQueue.o: TellerQueue.cpp TellerQueue.h
	g++ $(CFLAGS) -c TellerQueue.cpp
	
EventQueue.o: EventQueue.cpp EventQueue.h
	g++ $(CFLAGS) -c EventQueue.cpp
	
CustomerEvent.o: CustomerEvent.cpp CustomerEvent.h
	g++ $(CFLAGS) -c CustomerEvent.cpp
	
Event.o: Event.cpp Event.h
	g++ $(CFLAGS) -c Event.cpp
	
TellerEvent.o: TellerEvent.cpp TellerEvent.h
	g++ $(CFLAGS) -c TellerEvent.cpp
	
clean:
	rm -f *.o qSim
	rm -fr html latex
	
docs:
	doxygen
