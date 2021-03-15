#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int linear(int n) {
	long int sum = 0;
	for(int i = 0; i < n; i++) {
		sum++;
	}
	return EXIT_SUCCESS;
}

int quad(int n) {
	long int sum = 0;
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) {
			sum++;
		}
	}
	return EXIT_SUCCESS;
}

int cube(int n) {
	long int sum = 0;
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) {
			for(int k = 0; k < n; k++) {
				sum++;
			}
		}
	}
	return EXIT_SUCCESS;
}

int main(int argc, const char *argv[]) {
	int (*func)(int) = NULL;
	switch(atoi(argv[1])) {
		case 1:
			func = linear;
			break;
		case 2:
			func = quad;
			break;
		case 3:
			func = cube;
			break;
	}
	clock_t start = clock();
	func(100000);
	clock_t end = clock();

	double time = (double)(end - start) / CLOCKS_PER_SEC;

	printf("Total time spent: %lf seconds\n", time);
	return EXIT_SUCCESS;
}
