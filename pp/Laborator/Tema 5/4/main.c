#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, i ,j;
    scanf("%d", &n);
    int **m[n][n];
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
        scanf("%d", &(*(*(m+i)+j)));
    printf("\n%d\n", *(*(m+n/2)+n/2));
    for(i=0, j=0; i<n, j<n; i++, j++)
        printf("%d ", *(*(m+i)+j));
    printf("\n");
    for(i=0, j=n-1; i<n, j>=0; i++, j--)
        printf("%d ", *(*(m+i)+j));
    return 0;
}
