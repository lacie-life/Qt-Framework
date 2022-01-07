#include <stdio.h>
#include <stdlib.h>
#include <iostream>

// Here the parameter is a pointer to a pointer
void assign(int **arr, int m, int n)
{
    // assign values to allocated memory
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            std::cin >> *(*(arr + i) + j);
        }
    }
}

// Program to pass 2D array to a function in C
int main(void)
{
    int m = 5;
    int n = 5;

    // dynamically create array of pointers of size m
    int **arr = (int **)malloc(m * sizeof(int *));

    // dynamically allocate memory of size m*n and let *arr point to it
    *arr = (int *)malloc(sizeof(int) * m * n);

    // position allocated memory across m pointers
    for (int i = 0; i < m; i++)
        arr[i] = (*arr + n*i);

    assign(arr, m, n);

    // print the 2D array
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
            printf("%d ", *(*(arr + i) + j));

        printf("\n");
    }

    // deallocate memory
    free(*arr);
    free(arr);

    return 0;
}
