#include <stdio.h>
#include <unistd.h>

#if defined(__i386__)

static __inline__ unsigned long long rdtsc(void)
{
  unsigned long long int x;
     __asm__ volatile (".byte 0x0f, 0x31" : "=A" (x));
     return x;
}
#elif defined(__x86_64__)


static __inline__ unsigned long long rdtsc(void)
{
  unsigned hi, lo;
  __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
  return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}

#elif defined(__powerpc__)


static __inline__ unsigned long long rdtsc(void)
{
  unsigned long long int result=0;
  unsigned long int upper, lower,tmp;
  __asm__ volatile(
                "0:                  \n"
                "\tmftbu   %0           \n"
                "\tmftb    %1           \n"
                "\tmftbu   %2           \n"
                "\tcmpw    %2,%0        \n"
                "\tbne     0b         \n"
                : "=r"(upper),"=r"(lower),"=r"(tmp)
                );
  result = upper;
  result = result<<32;
  result = result|lower;

  return(result);
}

#endif

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
	for (int i = 0; i < DIM; ++i) {
		for (int j = 0; j < DIM; ++j)
		{
			A[i][j] = 1.0*i*j;
			B[i][j] = 2.0*i*j;
			C[i][j] = 0.0;
		}
	}

	vals[0] = rdtsc();
	// loop is how many data samples we want
	for ( loop = 0 ; loop < REPS ; loop++ ) {
		// triply nested loop for matrix multiplication
		for ( i = 0 ; i < DIM ; i++ )
			for ( j = 0 ; j < DIM ; j++ )
				for ( k = 0 ; k < DIM ; k++ )
					C[i][j] += A[i][k]*B[k][j];
		vals[loop] = rdtsc();
	}
	// delta is the difference between timestamps
	for ( i = 0 ; i < REPS ; i++ )
		printf("value: %llu delta: %llu\n",vals[i],
		       i ? vals[i]-vals[i-1] : 0);
	sprintf(fn,"arraymultperf_%d_%d",DIM,getpid());
	printf("Writing data to %s\n",fn);
	fp = fopen(fn,"w");
	for ( i = 1 ; i < REPS ; i++ )
		fprintf(fp,"%llu\n",
		       i ? vals[i]-vals[i-1] : 0);
	
	
/*
	for ( i = 0 ; i < DIM ; i++ )
		for ( j = 0 ; j < DIM ; j++ )
			printf("C[%d][%d] = %f\n",
			       i, j, C[i][j]);
*/
}
	
