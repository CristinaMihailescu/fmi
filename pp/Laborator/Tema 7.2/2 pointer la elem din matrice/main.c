#include <stdio.h>
#include <stdlib.h>
//ex 2
int main()
{
    int n, m, i, j, sum, MAX;
    scanf("%d%d", &n, &m);
    int **a = (int **)malloc(n * sizeof(int *));
    a[0] = (int *)malloc(n * m * sizeof(int *));
    for(i=1; i<n; i++)
        a[i] = a[0] + i * m;
    for(i=0; i<n; i++)
        for(j=0; j<m; j++)
        scanf("%d", &a[i][j]);
    for(i=0; i<m; i++)
    {
        int *p = (int)calloc(1, sizeof(int));
        sum = 0;
        for(j=0; j<n; j++)
        {
            if(a[j][i] > *p) p = &a[j][i];
            sum += a[j][i];
        }
        *p = sum;
        free(p);
    }
    printf("\n");
    for(i=0; i<n; i++)
    {
        for(j=0; j<m; j++)
            printf("%d ", a[i][j]);
        printf("\n");
    }
    free(a[0]);
    free(a);
    return 0;
}
