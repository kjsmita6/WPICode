// PA1.c -- Kyle Smith (kjsmith@wpi.edu)
// Unless otherwise specified, when referring to days, Sunday = 0, Monday = 1 ... Saturday = 6
// Unless otherwise specified, when referring to months, Jan = 0, Feb = 1 ... Dec = 11
#include <stdio.h>

/**
 * isLeapYear - Determines if a year is a leap year
 * @param year - The year to determine
 * @return 0 if it is a leap year, 1 otherwise
 */
int isLeapYear(int year) {
	if(year % 400 == 0) { // Determine if the year is divisible by 400
		return 1; // If it is, the year is a leap year
	}
	else if(year % 100 == 0) { // Determine if the year is divisible by 100
		return 0; // If it is, the year is not a leap year
	}
	else if(year % 4 == 0) { // Determine if the year is divisible by 4
		return 1; // If it is, the year is a leap year
	}
	else {
		return 0; // If year is not divisible by 400 or 4, is not a leap year
	}
}

/**
 * printMonthName - Prints the line that identifies the month
 * @param year - The year to print
 * @param month - The month to print
 * @return Number of days in the month
 */
int printMonthName(int year, int month) {
    switch(month) {
		case 0:
			printf("January %d", year);
			return 31;
		case 1:
			printf("February %d", year);
			return isLeapYear(year) ? 29 : 28; // Determine if the year is a leap year, if it is then Feb has 29 days, 28 otherwise
		case 2:
			printf("March %d", year);
			return 31;
		case 3:
            printf("April %d", year);
            return 30;
        case 4:
            printf("May %d", year);
            return 31;
        case 5:
            printf("June %d", year);
            return 30;
		case 6:
            printf("July %d", year);
            return 31;
        case 7:
            printf("August %d", year);
            return 31;
        case 8:
            printf("September %d", year);
            return 30;
        case 9:
            printf("October %d", year);
            return 31;
		case 10:
			printf("November %d", year);
			return 30;
		case 11:
			printf("December %d", year);
			return 31;
		default:
			return 0;
	}
}

/**
 * printMonth - Prints out the days of the specified month in calendar format
 * @param year - The year to print
 * @param month - The month to print
 * @param startDay - The starting day of the month
 * @return The starting day of the next month
 */
int printMonth(int year, int month, int startDay) {
    int days = printMonthName(year, month); // Determine amount of days in the month
    printf("\n\nSun  Mon  Tue  Wed  Thu  Fri  Sat\n");
	for(int i = 0; i < startDay; i++) {
		// Loop Invariant -- 0 <= startDay <= 6, prints 5 spaces (see below)
		printf("     "); // Print 5 (five) spaces for each blank day i.e. if month starts on Friday print blanks until friday
	}
	for(int i = 1; i < days + 1; i++) {
		// Loop Invariant -- days 28 <= days <= 31
		printf("%3d", i); // Print day of the week with 3 spaces
		startDay++; // Increase day count
		startDay %= 7; // Increase startDay by one and use modulus with 7 to determine if at the end of the week
		printf("  "); // 2 spaces between days
		// Loop invariant -- 0 <= startDay <= 7
		if(startDay == 0) { // If it is end of the week, skip to next week
			printf("\n");
		}
	}
	return startDay;
}

/**
 * printCalendar - Loops through printMonth and prints the calendar with every month
 * @param year - The year number
 * @param startDay - Starting day of the year
 */
void printCalendar(int year, int startDay) {
    for(int i = 0; i < 12; i++) {
		// Loop Invariant -- startDay is equal to the starting day of the next month, which is always 1 higher than the ending
		// 					day of the previous month
       	startDay = printMonth(year, i, startDay); // Loops through every month in the year and prints that month
    	printf("\n\n");
	}
}

/**
 * startingDay - Determines which day the year starts on
 * @param year - The specified year
 * @return The day which the year starts
 */
int startingDay(int year) {
	// Algorithm source: http://mathforum.org/library/drmath/view/55837.html
	int m = 13; // Month, the algorithm requires any date calculated on 1/1/year be calculated as 13/1/(year - 1)
				// i.e. If the date you want calculated is 1/1/2018 you actually calculate it for 13/1/2017
	int d = 1; // Starting day
	int y = year - 1; // Year, see comment under "m";
	int n = d + (2 * m) + ((3 * (m + 1))/5) + y + (y / 4) - (y / 100) + (y / 400) + 2; // Value "N" in the algorithm
	int rem = n % 7; // Find the remainder of N divided by 7
	if(rem == 0) {
		return 6; // If the value of rem is 0, the day is Saturday, not Sunday
	}
	else {
		return rem - 1; // Rem returns the day if the week starts with Sunday = 1, Monday = 2, etc...,
						// but I have Sunday = 0, Monday = 1, etc so subtract 1
	}
}

/**
 * main - program entry point
 * @return 0 if method ran successfully, any other number otherwise
 */
int main(void) {
    printf("Please enter year for this calendar: ");
    int year = 0; // The year the user wants to calculate
    scanf("%d", &year);
	if(year <= 0) {
		printf("The year must be greater than or equal to 0 (zero)\n");
		return 1;
	}
    int day = startingDay(year); // The starting day of the year
    printCalendar(year, day);
	return 0;
}
