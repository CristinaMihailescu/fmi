#include <stdio.h>
#include <stdlib.h>
//ex 3
int main()
{
    FILE *f = fopen("matrice.in", "r");
    int n, i, j;
    fscanf(f, "%d", &n);
    int **a = (int **)malloc(n * sizeof(int *));
    a[0] = (int *)malloc(n * n * sizeof(int));
    for(i=1; i<n; i++)
        a[i] = a[0] + i * n;
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
            fscanf(f, "%d", &a[i][j]);
    for(i=0; i<n; i++)
    {
        for(j=0; j<n; j++)
            printf("%d ", a[i][j]);
        printf("\n");
    }
    for(i=0; i<n; i++)
        if(a[i][i]%2 != 0)
        {
            printf("\nNu toate elementele de pe diagonala principala sunt pare");
            break;
        }
    if(i==n) printf("\nToate elementele de pe diagonala principala sunt pare");
    for(i=0; i<n; i++)
        for(j=0; j<i; j++)
            if(a[i][j])
            {
                printf("\nNu toate elementele de sub diagonala principala sunt nule");
                break;
            }
    if(i==n && j==n-1)
        printf("\nToate elementele de sub diagonala principala sunt nule");
    return 0;
}
