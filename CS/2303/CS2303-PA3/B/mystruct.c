/** mystruct.c
 * @author Kyle Smith (kjsmith@wpi.edu)
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "mystruct.h"

/** Allocates an Employee struct and fills in its fields
 * @param birth Year the emploee was born.
 * @param start Year the employee started with the company.
 * @param name String containing employee's name
 * @return Pointer to Employee struct, newly allocated from the heap.
 */
struct Employee* makeEmployee(int birth, int start, const char *name) {
	struct Employee *e = malloc(sizeof(struct Employee));
	e->birth_year = birth;
	e->start_year = start;
	strcpy(e->name, name);
	return e;
}

/**
 * Creates an Employee using a random name and random dates
 * @return Pointer to a newly created random Employee
 * @author Kyle Smith
 */
struct Employee *makeRandomEmployee() {
	return makeEmployee(randomNum(1, 2019), randomNum(1, 2019), randomStr(randomNum(1, MAX_NAME)));
}

/**
 * Prints an Employee to the console
 * @param e The employee to print
 * @author Kyle Smith
 */
void printEmployee(struct Employee *e) {
	printf("The employee %s was born in %d and started working in %d.\n",
			e->name,
			e->birth_year,
			e->start_year);
}

/**
 * Generates a random letter between A-Z and a-z
 * @return Random letter
 * @author Kyle Smith
 */
char randomLetter() {
	int choice = randomNum(0, 2);
	if(choice) { // if choice is 1, generate a capital letter
		return randomNum(65, 91); // 65 = A, 90 = Z
	}
	else { // generate a lowercase letter
		return randomNum(97, 123); // 97 = a, 122 = z
	}
}

/**
 * Generates a random string with a specified length
 * @param length Length of the string to create
 * @return Random string
 * @author Kyle Smith
 */
char *randomStr(int length) {
	char *str = calloc(length, sizeof(char));
	for(int i = 0; i < length; i++) {
		str[i] = randomLetter(); // set the ith character of the string to a random letter
	}
	return str;
}

/**
 * Generates a random number between min and max exclusive [min, max)
 * @param min The minimum number to generate
 * @param max The maximum number to generate
 * @return Random number between min and max
 * @author Kyle Smith
 */
int randomNum(int min, int max) {
	return rand() % (max - min) + min; // algorithm to create a random integer between min and max exclusive
}

/**
 * Creates an array with n random employees
 * @param n Number of employees to make
 * @return Array of employees
 * @author Kyle Smith
 */
struct Employee *makeNRandomEmployees(int n) {
	struct Employee *arr = calloc(n, sizeof(struct Employee));
	for(int i = 0; i < n; i++) {
		arr[i] = *makeRandomEmployee();
	}
	return arr;
}

/**
 * Prints all employees in the array
 * @param arr Array of employees
 * @param n Length of the array
 * @author Kyle Smith
 */
void printNEmployees(struct Employee *arr, int n) {
	for(int i = 0; i < n; i++) {
		printEmployee(&arr[i]);
	}
}

/**
 * Copies all the pointers in arr and returns an array with those pointers
 * @param arr Array of employee pointers
 * @param n Length of the array
 * @return An array of pointers to each employee struct
 * @author Kyle Smith
 */
struct Employee **shallowCpy(struct Employee **arr, int n) {
	struct Employee **newArr = (struct Employee **)malloc(n * sizeof(struct Employee));
	for(int i = 0; i < n; i++) {
		newArr[i] = arr[i]; // set the ith value of the new array to the pointer of the ith value of the old array
	}
	return newArr;
}

/**
 * Frees memory occupied by every member of arr
 * @param arr Array of pointers to employee structs
 * @param n Number of employees
 * @author Kyle Smith
 */
void freeEmployees(struct Employee **arr, int n) {
	for(int i = 0; i < n; i++) {
		free(arr[i]); // frees every pointer in arr
	}
}

/**
 * Copies all the structs into a new array. Note: This does not copy the pointers,
 * but the structs themselves.
 * @param arr Array of employee pointers
 * @param n Length of the array
 * @return An array of pointers to employee structs
 * @author Kyle Smith
 */
struct Employee **deepCpy(struct Employee **arr, int n) {
	struct Employee **newArr = malloc(n * sizeof(struct Employee));
	for(int i = 0; i < n; i++) {
		struct Employee *e = malloc(sizeof(struct Employee)); // creates a new employee
		strcpy(e->name, arr[i]->name); // and initializes its fields
		e->birth_year = arr[i]->birth_year;
		e->start_year = arr[i]->start_year;
		newArr[i] = e;
	}
	return newArr;
}
