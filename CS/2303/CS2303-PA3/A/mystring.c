/** mystring.c
 * @author Kyle Smith (kjsmith@wpi.edu)
 * My own versions of some of the C-style string functions
 */

#include <string.h>
#include <stdlib.h>
// Have to #include stdlib.h because it is needed to use malloc()
#include "mystring.h"

/** Duplicates a C-style string.
 @param src Pointer to string to be copied
 @return Pointer to freshly-allocated string containing a duplicate of src
         or null if no memory is available
 */
char* mystrdup1(const char* src) {
	int length; // Length of the source string
	char* newstr; // Pointer to memory which will hold new string

	length = mystrlen1(src) + 1;  // Leave space for the terminator
	newstr = (char*) malloc(length); // Must cast!

	// If no memory was available, return null pointer immediately
	if (newstr == 0) return (char *) 0;

	// Otherwise, copy the string and return pointer to new string
	strcpy(newstr, src);
	return newstr;
}

/**
 * Duplicates a C-style string
 * @param *str A pointer to a string or array of characters
 * @return A pointer to the new allocated string, or null if the copy was unsuccessfull
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
char *mystrdup2(const char *str) {
	int length = mystrlen2(str) + 1;
	char *newStr = (char *)malloc(length); // allocate
	if(!newStr) {
		return (char *)0; // return null pointer if memory can't be allocated
	}
	strcpy(newStr, str); // copy str to the new string array
	return newStr;
}

/**
 * Calculates the length of a string by going through every char in the string
 * array and incrementing a counter by 1 for every character. Does not include
 * the null terminator character.
 * @param *str A pointer to the string object or an array of chars
 * @return Length of the string minus the null terminator character
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
size_t mystrlen1(const char *str) {
	int acc = 0;
	while(str[acc] != '\0') {
		acc++; // increment the accumulator for every char of str that isn't the null terminator
	}
	return acc;
}

/**
 * Calculates the length of a string by incrementing the pointer to access
 * the next value of the str array.
 * @param *str A pointer to the string object or an array of chars
 * @return Length of the string minus the null terminator character
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
size_t mystrlen2(const char *str) {
	int acc = 0;
	while(*str != '\0') {
		str++; // increment the string pointer to the next memory address
		acc++;
	}
	return acc;
}

/**
 * Copies the string from src into dest
 * @param dest Destination pointer
 * @param src Source pointer
 * @return Pointer to the original dest string
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
char *mystrcpy(char *dest, const char *src) {
	char *origin = mystrdup2(dest);
	strcpy(origin, dest);
	while(*src != '\0') {
		*dest++ = *src++; // set the values equal to eachother, then increment
	}
	*dest = '\0'; // add null terminator
	return origin;
}

/**
 * Concatenates the src string onto the dest str, including the null terminator
 * @param src The string to concat
 * @param dest The resulting string
 * @return Pointer to the concatenated string
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
char *mystrcat(char *dest, const char *src) {
	while(*dest != '\0') {
		dest++; // set dest to the end of the string to concatenate, minus null terminator
	}
	while((*dest++ = *src++)); // sets the value of dest to the value of src, need () to remove warnings
	*dest = '\0';
	return dest;
}

/**
 * Concatenates n bytes from src onto dest
 * If strlen(src) < n,
 * 	Only the first n bytes of n are added
 * If strlen(src) > n or strlen(src) == n
 * 	The whole string is added
 * @param dest The resulting string
 * @param src String to concat
 * @param n The limit of bytes to take from src
 * @return Pointer to the concatenated string
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
char *mystrncat(char *dest, const char *src, size_t n) {
	while(*dest != '\0') {
		dest++; // set dest to the end of the string minus the null terminator
	}
	for(int i = 0; i < n; i++) {
		if(*src != '\0') { // don't add the null terminator from src
			*dest++ = *src++; // will overwrite null terminator of dest if there is one
		}
	}
	*dest = '\0'; // add null terminator to end
	return dest;
}

/**
 * Copies n bytes of src to dest
 * If strlen(src) < n
 * 	The first n bytes of src are copied
 * If strlen(src) > n
 * 	The entire string is copied plus (n - strlen(src)) null terminator characters
 * If strlen(src) == n
 * 	The entire string is copied
 * @param dest The resulting string
 * @param src The string to copy
 * @param n The limit of bytes to copy from src
 * @return Pointer to the new string
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
char *mystrncpy(char *dest, const char *src, size_t n) {
	for(int i = 0; i < n; i++) { // only copy while i < n
		if(*src != '\0') {
			*dest++ = *src++; // set dest equal to src
		}
	}
	*dest = '\0'; // add null terminator at end
	return dest;
}

/**
 * Creates a duplicate string with the first n bytes of src
 * @param src String to duplicate
 * @param n Duplication limit
 * @return Pointer to the duplicated string
 * @author Kyle Smith (kjsmith@wpi.edu)
 */
char *mystrndup(const char *src, size_t n) {
	char *newStr = (char *)malloc(n + 1); // add 1 to compensate for null terminator
	if(!newStr) { // if memory wasn't allocated correctly
		return (char *)0;
	}
	mystrncpy(newStr, src, n);
	return newStr;
}
