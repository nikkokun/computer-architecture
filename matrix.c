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
	float a[4][4] = {{1,1,1,1}, {1,1,1,1}, {1,1,1,1}, {1,1,1,1}};
	float b[4][4]= {{1,1,1,1}, {1,1,1,1}, {1,1,1,1}, {1,1,1,1}};

	int total = sizeof(a)/sizeof(float);
	int column = sizeof(a[0])/sizeof(float);
	int row = total / column;

	float result[column][row];

	matrix_multiply(column, row, a, b, result);

	printf("total: %d\n", total);
	printf("column: %d\n", column);
	printf("row: %d\n", row);

	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			printf("%f, ", result[i][j]);
		}
		printf("\n");
	}

	return 0;
}
