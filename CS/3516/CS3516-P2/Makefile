CC=gcc
CFLAGS=-Wall
DEPS=student2_helpers.h project2.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

project2: project2.o student2_helpers.o student2a.o student2b.o
	$(CC) -o p2 project2.o student2_helpers.o student2a.o student2b.o
	rm -f *.o

clean:
	rm -fr *.o p2 p2.dSYM
