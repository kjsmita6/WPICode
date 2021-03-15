#include <stdio.h>
#include <stdlib.h>

FILE *output;

void swap(int *a, int *b) {
	int temp = *a;
	*a = *b;
	*b = temp;
}

int partition(int *arr, int low, int high) {
	int pivot = arr[high];
	int index = (low - 1);
	for(int i = low; i <= high - 1; i++) {
		if(arr[i] <= pivot) {
			index++;
			swap(&arr[index], &arr[i]);
		}
	}
	swap(&arr[index + 1], &arr[high]);
	for(int i = 0; i < 100; i++) {
		fprintf(output, "%d", arr[i]);
		if(i < 99) {
			fprintf(output, ",");
		}
	}
	fprintf(output, "\n");
	return index + 1;
}

void quicksort(int *arr, int low, int high) {
	if(low < high) {
		int part = partition(arr, low, high);
		quicksort(arr, low, part - 1);
		quicksort(arr, part + 1, high);
	}
}

int main(int argc, const char *argv[]) {
	output = fopen("output_question1.txt", "w+");
	int *arr = (int *)calloc(100, sizeof(int));
	for(int i = 0; i < 100; i++) {
		arr[i] = 1 + (rand() % 1000);
	}
	quicksort(arr, 0, 100);
	return EXIT_SUCCESS;
}
