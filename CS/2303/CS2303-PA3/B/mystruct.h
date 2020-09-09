/** mystruct.h
 * @author Mike Ciaraldi
 * Sample structs
*/

// Struct definition:

// Maximum number of characters in an employee name
#define MAX_NAME (99)

struct Employee {
	int birth_year; // Year the employee was born
	int start_year; // When employee started with the company.
	char name[MAX_NAME + 1];
};

// Function prototype(s):
struct Employee *makeEmployee(int birth, int start, const char* name);
void printEmployee(struct Employee *e);
char randomLetter();
char *randomStr(int length);
int randomNum(int min, int max);
struct Employee *makeRandomEmployee();
struct Employee *makeNRandomEmployees(int n);
void printNEmployees(struct Employee *arr, int n);
struct Employee **shallowCpy(struct Employee **arr, int n);
void freeEmployees(struct Employee **arr, int n);
struct Employee **deepCpy(struct Employee **arr, int n);
