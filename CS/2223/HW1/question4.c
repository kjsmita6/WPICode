#include <stdio.h>
#include <stdlib.h>

#ifndef true
  #define true 1
#endif

#ifndef false
  #define false 0
#endif

int search( int *arr, int length, int what, int *numComparisons, int *pos ) {
	int first = 0;
	int last = length - 1;
	int comp = 0;
	int middle = ( first + ( last - first ) / 3 );

	while( first <= last ) {
		if( arr[middle] < what ) {
			comp++;
			first = middle + 1;
		}
		else if( arr[middle] == what ) {
			comp++;
			*numComparisons = comp;
			*pos = middle;
			return true;
		}
		else {
			last = middle - 1;
		}

		middle = ( first + ( last - first ) / 3 );
	}
	*numComparisons = comp;
	*pos = -1;
	return false;
}

int main( int argc, const char *argv[] ) {
	int *numbers = ( int * )calloc( 200, sizeof( int ) );
	int index = 0;
	for( int i = 1; i <= 400; i++ ) {
		if( i % 2 == 0 ) {
			numbers[index] = i;
			index++;
		}
	}

	int numComparisons = 0;
	int position = 0;
	if( search( numbers, 200, atoi( argv[1] ), &numComparisons, &position ) ) {
		printf( "Item %d found at position %d (number of comparisons: %d)\n", atoi( argv[1] ), position + 1, numComparisons );
	}
	else {
		printf( "Item %d NOT found (number of comparisons attempted: %d)\n", atoi( argv[1] ), numComparisons );
	}
	return EXIT_SUCCESS;
}
