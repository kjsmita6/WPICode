#include <stdio.h>
#include <string.h>
#include <stdlib.h>
// string.h covers the C-style string functions.
#include "mystring.h"

/** ctest.c
 * Program to demonstrate character arrays and
 * dynamically-allocated memory.
 * @author Mike Ciaraldi
 * Add your own @author line below.
 * @author Kyle Smith (kjsmith@wpi.edu)
 */

const int MAX_CHARS = 20; // Maximum number of characters in array

int main()
{
	char a1[MAX_CHARS + 1]; // Character array--initially empty
	char a2[] = "Hello"; // Character array--unsized but initialized
	char a3[MAX_CHARS + 1]; // Character array--we will underfill it
	char* p1 = "Hello"; // Pointer to constant string
	char* p2 = NULL;           // Will be a pointer to dynamically-allocated string
	char* p3 = "Hi"; // Pointer to another constant string
	int copy_limit;     // Maximum characters to copy.

	strcpy(a3, "Hello, one more time."); // Initialize underfilled character array
	/* Print the pointers.
     Note: this example prints
     the values of the pointers themselves, not the targets.
	 */
	printf("Initial state:\n");
	printf("Pointers: a1 = %p, a2 = %p, a3 = %p\n", a1, a2, a3);
	printf("          p1 = %p p2 = %p\n", p1, p2);

	strcpy(a1, p3); // Initialize character array

	printf("a1 = %s\n", a1);
	printf("a2 = %s\n", a2);
	printf("a3 = %s\n", a3);

	// Note that strlen() returns size_t, which is typedef'd to
	//   unsigned long, so we need to print it with %ld instead of just %d.
	//printf("For string /%s/, strlen() returns %ld\n", p1, strlen(p1));
	printf("For string /%s/, mystrlen1() returns %ld\n", p1, mystrlen1(p1));
	printf("For string /%s/, mystrlen2() returns %ld\n", p1, mystrlen2(p1));

	// Duplicate a string, using strdup(), then print
	printf("\nBefore calling strdup(), pointer a2 = %p, contents = %s\n", a2, a2);
	p2 = strdup(a2);
	printf("Duplicated string: \n");
	printf("Pointer p2 = %p, contents = %s\n", p2, p2);

	// Duplicate a string, using my function, then print
	printf("\nBefore calling mystrdup1(), pointer a2 = %p, contents = %s\n", a2, a2);
	p2 = mystrdup1(a2);
	printf("Duplicated string: \n");
	printf("Pointer p2 = %p, contents = %s\n", p2, p2);


	char str1[] = "Kyle";
	printf("\nBefore calling mystrdup2(), pointer str1 = %p, contents = %s\n", str1, str1);
	char *str1a = mystrdup2(str1);
	printf("After duplication: \n");
	printf("Pointer str1a = %p, contents = %s\n", str1a, str1a);

	// Be sure there is a terminator character in the last element of the array
	a1[MAX_CHARS] = '\0';

	// Concatenate two character arrays, then print.
	strcpy(a1, p3); // Reset character array
	strcat(a1, a2);
	printf("\nUsing strcat() to concatenate a2 to the end of a1\n");
	printf("a1 = %s\n", a1);

	// Concatenate two character arrays safely, then print.
	strcpy(a1, p3); // Reset character array
	a1[MAX_CHARS] = 'A'; // Remove terminator, to prove strncat() puts it back in.
	copy_limit = MAX_CHARS - strlen(a1); // How much space is left?
	printf("Using strncat() to concatenate to the end of a1, with copy_limit = %d\n",
			copy_limit);
	if (copy_limit > 0) strncat(a1, a3, copy_limit);
	printf("a1 = %s\n", a1);

	// Copy two strings using mystrcpy
	// This includes the null terminator character
	char str2[] = "Kyle";
	char *cpy = malloc(mystrlen1(str2) + 1); // +1 to include null terminator
	printf("\nBefore calling mystrcpy, str2 = %p, value = %s\n", str2, str2);
	char *origin = mystrcpy(cpy, str2);
	printf("After mystrcpy, cpy = %p, value = %s; original dest=%p, str=%s\n", cpy, cpy, origin, origin);

	char result[50] = ""; // result for storing the strings, need enough space
	char *s1 = "Hello";
	char *s2 = " World";
	printf("\nBefore concatenation with mystrcat, s1=%p, str=%s; s2=%p, str=%s; result=%p, value=%s\n"
			, s1, s1, s2, s2, result, result);
	mystrcat(result, s1);
	mystrcat(result, s2);
	printf("After concatenation, result=%p, value=%s\n", result, result);

	char result1[50] = "";
	printf("\nBefore concatenation with mystrncat, s1=%p, str=%s; s2=%p, str=%s; result1=%p, str=%s; 3 bytes of s2 are concatenated\n",
			s1, s1, s2, s2, result1, result1);
	mystrncat(result1, s1, 5);
	mystrncat(result1, s2, 3);
	printf("After concatenation, result=%p, str=%s\n", result1, result1);

	char result2[50] = "";
	printf("\nBefore copying with mystrncopy, s1=%p, str=%s; result2=%p, str=%p, copy limit is 3\n",
			s1, s1, result2, result2);
	mystrncpy(result2, s1, 3);
	printf("After copying, result2=%p, str=%s\n", result2, result2);

	printf("\nBefore duplicating with mystrndup, s1=%p, str=%s; limit is 3\n", s1, s1);
	char *result3 = mystrndup(s1, 3);
	printf("After duplicating with mystrndup, result3=%p, str=%s\n", result3, result3);
	return 0;
}
