#include <stdio.h>
#include <stdlib.h>

int main()
{
    int *v = NULL, n = 0, x, i;
    do
    {
        scanf("%d", &x);
        n++;
        v = (int *)realloc(v, n * sizeof(int));
        v[n-1] = x;
    } while(x);
    for(i=0; i<n; i++)
        printf("%d ", v[i]);
    free(v);
    return 0;
}
