CFLAGS = -Wall -g -std=c++11

all: PA5

PA5: main.o Organism.o Ant.o Doodlebug.o Board.o
	g++ $(CFLAGS) main.o Organism.o Ant.o Doodlebug.o Board.o -o PA5

main.o: main.cpp
	g++ $(CFLAGS) -c main.cpp

Organism.o: Organism.cpp Organism.h
	g++ $(CFLAGS) -c Organism.cpp

Ant.o: Ant.cpp Ant.h
	g++ $(CFLAGS) -c Ant.cpp

Doodlebug.o: Doodlebug.cpp Doodlebug.h
	g++ $(CFLAGS) -c Doodlebug.cpp

Board.o: Board.cpp Board.h
	g++ $(CFLAGS) -c Board.cpp
	
clean:
	rm -f *.o life
	rm -f -r html latex

docs:
	doxygen
