CC=gcc
CFLAGS=-Wall
DEPS=project3.h node.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

project3: node.o project3.o node0.o node1.o node2.o node3.o
	$(CC) -o p3 node.o project3.o node0.o node1.o node2.o node3.o
	rm -f *.o

clean:
	rm -fr *.o p3
