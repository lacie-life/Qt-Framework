#include <stdio.h>
#include <iostream>

int matrix(int **matrix, int n, int m){
    for (int i = 0; i < n; i++){
        for (int j = 0; j < m ; j++){
            std::cin >> matrix[i][j];
        }
    }
}

int main()
{
    printf("Hello World!\n");
    return 0;
}
