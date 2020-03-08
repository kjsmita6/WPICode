// kjsmith-abalasubramanian
// Kyle Smith, Akshaj Balasubramanian
/*
* trans.c - Matrix transpose B = A^T
*
* Each transpose function must have a prototype of the form:
* void trans(int M, int N, int A[N][M], int B[M][N]);
*
* A transpose function is evaluated by counting the number of misses
* on a 1KB direct mapped cache with a block size of 32 bytes.
*/
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/*
* transpose_submit - This is the solution transpose function that you
*     will be graded on for Part B of the assignment. Do not change
*     the description string "Transpose submission", as the driver
*     searches for that string to identify the transpose function to
*     be graded.
*/
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
	int blocks;
	int colCount,rowCount, subColCount, subRowCount, storeValOne, storeValTwo, storeValThree, storeValFour, storeValFive, storeValSix, storeValSeven;
	if(M==32 && N==32){
		blocks = 8;
		for(colCount = 0; colCount < M; colCount = colCount + blocks){//4 iterations
			for(rowCount = 0; rowCount < N; rowCount = rowCount + blocks){//4 iterations
				for(subRowCount = rowCount; subRowCount < rowCount + blocks; subRowCount++){//8 iterations
					for(subColCount = colCount; subColCount < colCount + blocks; subColCount++){//8 iterations
						if(subRowCount != subColCount){
							B[subColCount][subRowCount] = A[subRowCount][subColCount];
						}
						else{
							storeValOne = subRowCount;//or subColCount
							storeValTwo = A[subRowCount][subColCount];//these are the same, but done for clarity
						}
					}
					if(colCount == rowCount){
						B[storeValOne][storeValOne] = storeValTwo;
					}
				}
			}
		}
	}
	else if(M == 64 && N == 64){
		for(colCount=0; colCount<64; colCount+=8 ){
			for(rowCount=0; rowCount<64; rowCount+=8 ){
				for(blocks=0; blocks<4; blocks++){
					storeValOne = A[colCount+blocks][rowCount+0];
					storeValTwo = A[colCount+blocks][rowCount+1];
					storeValThree = A[colCount+blocks][rowCount+2];
					storeValFour = A[colCount+blocks][rowCount+3];
					storeValFive = A[colCount+blocks][rowCount+4];
					storeValSix = A[colCount+blocks][rowCount+5];
					storeValSeven = A[colCount+blocks][rowCount+6];
					subColCount = A[colCount+blocks][rowCount+7];//ran out of storeVal variables so have to use a variable name that does not neccesarily make sense

					//the +0 is kept in the following statements for the sake of understanding
					B[rowCount+0][colCount+blocks+0] = storeValOne;
					B[rowCount+1][colCount+blocks+0] = storeValTwo;
					B[rowCount+2][colCount+blocks+0] = storeValThree;
					B[rowCount+3][colCount+blocks+0] = storeValFour;

					//The following assignments are for temporary storage of variables in the matrix, such that the variables can
					B[rowCount+0][colCount+blocks+4] = storeValSix;
					B[rowCount+1][colCount+blocks+4] = storeValSeven;
					B[rowCount+2][colCount+blocks+4] = subColCount;
					B[rowCount+3][colCount+blocks+4] = storeValFive;
				}

				storeValOne = A[colCount+4][rowCount+4];
				storeValTwo = A[colCount+5][rowCount+4];
				storeValThree = A[colCount+6][rowCount+4];
				storeValFour = A[colCount+7][rowCount+4];

				storeValFive = A[colCount+4][rowCount+3];
				storeValSix = A[colCount+5][rowCount+3];
				storeValSeven = A[colCount+6][rowCount+3];
				subColCount = A[colCount+7][rowCount+3];

				//using the B array
				B[rowCount+4][colCount+0] = B[rowCount+3][colCount+4];
				B[rowCount+4][colCount+1] = B[rowCount+3][colCount+5];
				B[rowCount+4][colCount+2] = B[rowCount+3][colCount+6];
				B[rowCount+4][colCount+3] = B[rowCount+3][colCount+7];

				B[rowCount+4][colCount+4] = storeValOne;
				B[rowCount+4][colCount+5] = storeValTwo;
				B[rowCount+4][colCount+6] = storeValThree;
				B[rowCount+4][colCount+7] = storeValFour;

				B[rowCount+3][colCount+4] = storeValFive;
				B[rowCount+3][colCount+5] = storeValSix;
				B[rowCount+3][colCount+6] = storeValSeven;
				B[rowCount+3][colCount+7] = subColCount;

				for(blocks=0;blocks<3;blocks++){

					//these following take care of the lower 3x8 sub matrix at the bottom of the filled in values
					storeValOne = A[colCount+4][rowCount+blocks+5];
					storeValTwo = A[colCount+5][rowCount+blocks+5];
					storeValThree = A[colCount+6][rowCount+blocks+5];
					storeValFour = A[colCount+7][rowCount+blocks+5];

					//these following take care of the upper 3x4 sub matrix of the larger 8x8 matrix
					storeValFive = A[colCount+4][rowCount+blocks];
					storeValSix = A[colCount+5][rowCount+blocks];
					storeValSeven = A[colCount+6][rowCount+blocks];
					subColCount = A[colCount+7][rowCount+blocks];

					B[rowCount+blocks+5][colCount+0] = B[rowCount+blocks][colCount+4];//deals with the bottom right 3x4 of the array
					B[rowCount+blocks+5][colCount+4] = storeValOne;//deals with the bottom left 3x4 of the array
					B[rowCount+blocks][colCount+4] = storeValFive;//deals with the upper right 3x4 of the array

					B[rowCount+blocks+5][colCount+1] = B[rowCount+blocks][colCount+5];//deals with the bottom right 3x4 of the array
					B[rowCount+blocks+5][colCount+5] = storeValTwo;//deals with the bottom left 3x4 of the array
					B[rowCount+blocks][colCount+5] = storeValSix;//deals with the upper right 3x4 of the array

					B[rowCount+blocks+5][colCount+2] = B[rowCount+blocks][colCount+6];//deals with the bottom right 3x4 of the array
					B[rowCount+blocks+5][colCount+6] = storeValThree;//deals with the bottom left 3x4 of the array
					B[rowCount+blocks][colCount+6] = storeValSeven;//deals with the upper right 3x4 of the array

					B[rowCount+blocks+5][colCount+3] = B[rowCount+blocks][colCount+7];//deals with the bottom right 3x4 of the array
					B[rowCount+blocks+5][colCount+7] = storeValFour;//deals with the bottom left 3x4 of the array
					B[rowCount+blocks][colCount+7] = subColCount;//deals with the upper right 3x4 of the array
				}
			}
		}
	}
	else{
		blocks = 8;//this value was chosen after experimentation with both blocks = 8 and blocks = 32 as potential sizes. 16 was optimal and is thus being used.
		for(colCount = 0; colCount < M; colCount = colCount + blocks){
		for(rowCount = 0; rowCount < N; rowCount = rowCount + blocks){
		//the same as the 32x32 structure except we have to check that subRowCount<N and subColCount<M since M and N can be any value and we want to avoid an out-of-bounds exception.
		for(subRowCount = rowCount; subRowCount<N && subRowCount < rowCount + blocks; subRowCount++){
		for(subColCount = colCount; subColCount<M && subColCount < colCount + blocks; subColCount++){
		if(subRowCount != subColCount){
		B[subColCount][subRowCount] = A[subRowCount][subColCount];
	}
	else{
	storeValOne = subRowCount;//or subColCount
	storeValTwo = A[subRowCount][subColCount];//these are the same, but done for clarity
	}
	}
	if(colCount == rowCount){
	B[storeValOne][storeValOne] = storeValTwo;
	}
	}
	}
	}
}
}
		/*storeValOne = 0;
		for(colCount=0; colCount < M/8; colCount++){
			for (rowCount = 0; rowCount < N; rowCount++) {
				for (blocks = 0; blocks < 8; blocks++) {
					B[blocks+storeValOne][rowCount]=A[rowCount][blocks+storeValOne];
				}
			}
			storeValOne = storeValOne + 8;
		}
		for (subRowCount = 0; subRowCount< N; subRowCount++) { // this for-loop handles the remainder groups.
			for (subColCount = 0; subColCount < M%8; subColCount++) {
				storeValTwo = A[subRowCount][subColCount+storeValOne];
				B[subColCount+storeValOne][subRowCount] = storeValTwo;
			}
		}
		storeValOne = storeValOne + 8;
	}*/
	/*blocks = 8;//this value was chosen after experimentation with both blocks = 8 and blocks = 32 as potential sizes. 16 was optimal and is thus being used.
	for(colCount = 0; colCount < M; colCount = colCount + blocks){
	for(rowCount = 0; rowCount < N; rowCount = rowCount + blocks){
	//the same as the 32x32 structure except we have to check that subRowCount<N and subColCount<M since M and N can be any value and we want to avoid an out-of-bounds exception.
	for(subRowCount = rowCount; subRowCount<N && subRowCount < rowCount + blocks; subRowCount++){
	for(subColCount = colCount; subColCount<M && subColCount < colCount + blocks; subColCount++){
	if(subRowCount != subColCount){
	B[subColCount][subRowCount] = A[subRowCount][subColCount];
}
else{
storeValOne = subRowCount;//or subColCount
storeValTwo = A[subRowCount][subColCount];//these are the same, but done for clarity
}
}
if(colCount == rowCount){
B[storeValOne][storeValOne] = storeValTwo;
}
}
}
}*/
//Graveyard of 64x64 transpose functions :(
/*for(rowCount = 0; rowCount < N-1; rowCount = rowCount+3){
for(colCount = 0; colCount < M-1; colCount = colCount + 3){
subColCount = A[rowCount][colCount];
subRowCount = A[rowCount+1][colCount];
diagIdx = A[rowCount+2][colCount];
diagVal = A[rowCount+2][colCount+1];
storeValOne = A[rowCount+2][colCount+2];
storeValTwo = A[rowCount+1][colCount+2];
storeValThree = A[rowCount][colCount+2];
storeValFour = A[rowCount][colCount+1];
storeValFive = A[rowCount+1][colCount+1];

B[colCount][rowCount] = subColCount;
B[colCount][rowCount+1] = subRowCount;
B[colCount][rowCount+2] = diagIdx;
B[colCount+1][rowCount+2] = diagVal;
B[colCount+2][rowCount+2] = storeValOne;
B[colCount+2][rowCount+1] = storeValTwo;
B[colCount+2][rowCount] = storeValThree;
B[colCount+1][rowCount] = storeValFour;
B[colCount+1][rowCount+1] = storeValFive;
if(colCount == 60){
B[colCount+3][rowCount] = A[rowCount][colCount+3];
B[colCount+3][rowCount+1] = A[rowCount+1][colCount+3];
B[colCount+3][rowCount+2] = A[rowCount+2][colCount+3];
}
if(rowCount == 60){
B[colCount][rowCount+3] = A[rowCount+3][colCount];
B[colCount+1][rowCount+3] = A[rowCount+3][colCount+1];
B[colCount+2][rowCount+3] = A[rowCount+3][colCount+2];
}
}

}
B[63][63] = A[63][63];
}*/
/*blocks = 4;
//in this code we have to recycle variable names that have already been instantiated, which means recycling variable names that dont necessarily make sense

for(rowCount = 0; rowCount < N; rowCount = rowCount + blocks){
for(colCount = 0; colCount < M; colCount = colCount + blocks){
storeValOne = A[rowCount][colCount];
storeValTwo = A[1+rowCount][colCount];
storeValThree = A[2+rowCount][colCount];
storeValFour = A[2+rowCount][1+colCount];
storeValFive = A[2+rowCount][2+colCount];
subColCount = A[2+rowCount][1+colCount];

subRowCount = A[rowCount][2+colCount];
diagIdx = A[1+rowCount][2+colCount];
diagVal = A[2+rowCount][2+colCount];
//trying to minimise cache misses
//the variables dont necessarily make sense but they make the program more efficient
B[3+colCount][rowCount] = A[rowCount][3+colCount];
B[3+colCount][1+rowCount] = A[1+rowCount][3+colCount];
B[3+colCount][2+rowCount] = A[2+rowCount][3+colCount];

B[2+colCount][rowCount] = A[rowCount][2+colCount];
B[2+colCount][1+rowCount] = A[1+rowCount][2+colCount];
B[2+colCount][2+rowCount] = storeValFive;
storeValFive = A[1+rowCount][1+colCount];

B[1+colCount][rowCount] = A[rowCount][1+colCount];
B[1+colCount][1+rowCount] = storeValFive;
B[1+colCount][2+rowCount] = storeValFour;

B[colCount][rowCount] = storeValOne;
B[colCount][1+rowCount] = storeValTwo;
B[colCount][2+rowCount] = storeValThree;

B[colCount][3+rowCount] = A[3+rowCount][colCount];
B[1+colCount][3+rowCount] = A[3+rowCount][1+colCount];
B[2+colCount][3+rowCount] = A[3+rowCount][2+colCount];

storeValOne = A[3+rowCount][3+colCount];

B[3+colCount][3+rowCount] = storeValOne;
}
}*/

/*
* You can define additional transpose functions below. We've defined
* a simple one below to help you get started.
*/

/*
* trans - A simple baseline transpose function, not optimized for the cache.
*/
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
	int i, j, tmp;

	for (i = 0; i < N; i++) {
		for (j = 0; j < M; j++) {
			tmp = A[i][j];
			B[j][i] = tmp;
		}
	}

}

/*
* registerFunctions - This function registers your transpose
*     functions with the driver.  At runtime, the driver will
*     evaluate each of the registered functions and summarize their
*     performance. This is a handy way to experiment with different
*     transpose strategies.
*/
void registerFunctions()
{
	/* Register your solution function */
	registerTransFunction(transpose_submit, transpose_submit_desc);

	/* Register any additional transpose functions */
	//registerTransFunction(trans, trans_desc);

}

/*
* is_transpose - This helper function checks if B is the transpose of
*     A. You can check the correctness of your transpose by calling
*     it before returning from the transpose function.
*/
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
	int i, j;

	for (i = 0; i < N; i++) {
		for (j = 0; j < M; ++j) {
			if (A[i][j] != B[j][i]) {
				return 0;
			}
		}
	}
	return 1;
}
