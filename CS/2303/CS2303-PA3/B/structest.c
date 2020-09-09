// structest.c -- Kyle Smith

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "mystruct.h"

int main(int atgc, char *argv[]) {
	srand(time(0)); // sets random seed to be based on the time instead of a set number
	struct Employee *e;
	struct Employee *k;

	printf("Not random employees:\n");
	k = makeEmployee(1998, 2015, "Kyle Smith");
	e = makeEmployee(1952, 1999, "Mike Ciaraldi");
	printEmployee(k);
	printEmployee(e);

	printf("\nRandom employees:\n");
	struct Employee *r1 = makeRandomEmployee();
	struct Employee *r2 = makeRandomEmployee();
	struct Employee *r3 = makeRandomEmployee();
	printEmployee(r1);
	printEmployee(r2);
	printEmployee(r3);

	printf("\nCreate 2 random employees with makeNRandomEmployees:\n");
	struct Employee *arr = makeNRandomEmployees(2);
	printf("Print 2 random employees with printNEmployees:\n");
	printNEmployees(arr, 2);

	struct Employee **arr1 = (struct Employee **)calloc(2, sizeof(struct Employee *));
	arr1[0] = k;
	arr1[1] = e;
	printf("\nDuplicate pointers of first 2 employees:\nBefore: 1=%p, 2=%p\n",
			arr1[0], arr1[1]);
 	struct Employee **after = shallowCpy(arr1, 3);
	printf("After : 1=%p, 2=%p\n", after[0], after[1]);


	printf("\nFreeing memory occupied by all employees:\n");
	struct Employee **toFree = malloc(2 * sizeof(struct Employee));
	toFree[0] = k;
	toFree[1] = e;
	freeEmployees(toFree, 3);

	k = makeEmployee(1998, 2015, "Kyle Smith");
	e = makeEmployee(1952, 1999, "Mike Ciaraldi");
	printf("\n\nDeep copy (copy structs and assigns new pointers): Before:\n");
	struct Employee **arr2 = (struct Employee **)malloc(2 * sizeof(struct Employee *));
	arr2[0] = k;
	arr2[1] = e;
	printf("First employee: %p\n", arr2[0]);
	printEmployee(arr2[0]);
	printf("Second employee: %p\n", arr2[1]);
	printEmployee(arr2[1]);
	struct Employee **arr3 = deepCpy(arr2, 2);
	printf("\nAfter:\n");
	printf("First employee: %p\n", arr3[0]);
	printEmployee(arr3[0]);
	printf("Second employee: %p\n", arr3[1]);
	printEmployee(arr3[1]);
	return 0;
}
