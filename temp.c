#include <stdio.h>
#include <unistd.h>

#define REPS 100
  unsigned long long int vals[REPS];
  unsigned long long int lastval = 0, thisval;

#define DIM 32

/* globals aren't great but we don't want big arrays on the stack */
double A[DIM][DIM] = {
	{ 1.0, 0.0, 3.14, 2.72 },
	{ 2.72, 1.0, 0.0, 3.14 },
	{ 1.0,  1.0, 1.0, 1.0 },
	{ 1.0, 2.0, 3.0, 4.0 }};
double B[DIM][DIM] = {
	{ 1.0, 1.0, 0.0, 3.14 },
	{ 0.0, 1.0, 3.14, 2.72 },
	{ 0.0,  1.0, 1.0, 0.0 },
	{ 4.0, 3.0, 2.0, 1.0 }};
double C[DIM][DIM] = {
	{ 0.0, 0.0, 0.0, 0.0 },
	{ 0.0, 0.0, 0.0, 0.0 },
	{ 0.0, 0.0, 0.0, 0.0 },
	{ 0.0, 0.0, 0.0, 0.0 }};


int main(int argc, char *argv[])
{

	int i, j, k;
	int loop;
	FILE *fp;
	char fn[256];
/* initialize the arrays to anything you want */

	// loop is how many data samples we want
	for ( loop = 0 ; loop < REPS ; loop++ ) {
		// triply nested loop for matrix multiplication
		for ( i = 0 ; i < DIM ; i++ )
			for ( j = 0 ; j < DIM ; j++ )
				for ( k = 0 ; k < DIM ; k++ )
					C[i][j] += A[i][k]*B[k][j];
	}
	// delta is the difference between timestamps
}
	
