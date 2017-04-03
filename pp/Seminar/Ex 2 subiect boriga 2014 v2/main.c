#include <stdio.h>
#include <stdlib.h>

int **f(int n)
{
    int **a = (int **)malloc(n * sizeof(int)), i, j;
    a[0] = (int *)malloc(n * n * sizeof(int));
    for(i=0; i<n; i++)
        a[i] = a[0] + i * n;
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
        a[i][j] = i > j ? (i - j) : (j - i);
    return a;
}

int main()
{
    int **a, i, j; //a-ul din functie deja e in heap! Acum mai trebuie doar un pointer de tip int **
    a = f(4);
    for(i=0; i<4; i++)
        {for(j=0; j<4; j++)
            printf("%d ", a[i][j]);
        printf("\n");}
    return 0;
}
