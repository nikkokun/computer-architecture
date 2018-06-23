#include <stdlib.h>
#include <stdio.h>

void matrix_multiply(int column, int row, float a[column][row], float b[column][row], float result[column][row])
{

	for (int i = 0; i < column; ++i) {
		for(int j = 0; j < row; ++j) {
			for(int k = 0; k < row; ++k) {
				result[i][j] += a[i][k] * b[k][j];
			}
		}
	}
}

int main()
{
	float a[4][4] = {{1,0,3.14,2.72}, {2.72,1,0,3.14}, {1,1,1,1}, {1,2,3,4}};
	float b[4][4]= {{1,1,0,3.14}, {0,1,3.14,2.72}, {0,1,1,0}, {4,3,2,1}};
	float result[4][4] = {{0,0,0,0}, {0,0,0,0}, {0,0,0,0}, {0,0,0,0}};

	int total = sizeof(a)/sizeof(float);
	int column = sizeof(a[0])/sizeof(float);
	int row = total / column;

	printf("matrix a:\n");
	for (int i = 0; i < column; ++i) {
		for (int j = 0; j < row; ++j) {
			printf("%f, ", a[i][j]);
		}
		printf("\n");
	}

	printf("matrix b:\n");
	for (int i = 0; i < column; ++i) {
		for (int j = 0; j < row; ++j) {
			printf("%f, ", b[i][j]);
		}
		printf("\n");
	}

	matrix_multiply(column, row, a, b, result);

	printf("result\n");
	for (int i = 0; i < column; ++i) {
		for (int j = 0; j < row; ++j) {
			printf("%f, ", result[i][j]);
		}
		printf("\n");
	}

	return 0;
}
