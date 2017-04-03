#include <stdio.h>
#include <stdlib.h>
//ex 4
int main()
{
    int n, i, j, MIN=9999999;
    printf("n = ");
    scanf("%d", &n);
    int **v = (int **)malloc(n * sizeof(int *));
    v[0] = (int *)malloc(n * n * sizeof(int *));
    for(i=1; i<n; i++)
        v[i] = v[0] + n * i;
    printf("\nElementele matricii sunt:\n");
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
        {
            scanf("%d", &v[i][j]);
            if(v[i][j]<MIN) MIN = v[i][j];
        }
    printf("Noua matrice este:\n");
    for(i=0; i<n; i++)
        {for(j=0; j<n; j++)
        {
            v[i][j] *= MIN;
            printf("%d ", v[i][j]);
        }
        printf("\n");}
    free(v[0]);
    free(v);
    return 0;
}
