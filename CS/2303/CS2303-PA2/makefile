# Set CFLAGS to activate all warnings and enable debugger
CFLAGS = -Wall -g

# Default rule is to build the executable called life
all: life

# Rule for building the executable.
life: life.o twoD.o grid.o
	gcc $(CFLAGS) life.o twoD.o grid.o -o life -lm

# Rules for building each object file.
life.o: life.c twoD.h
	gcc $(CFLAGS) -c life.c

twoD.o: twoD.c twoD.h
	gcc $(CFLAGS) -c twoD.c

grid.o: grid.c grid.h
	gcc $(CFLAGS) -c grid.c

# Give command "make clean" to remove object files,
#  executable, and documentation.
clean:
	rm -f *.o life
	rm -f -r html latex

# Give command "make docs" to create documentation.	
docs:
	doxygen
