#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, i, r;
    scanf("%d", &n);
    int *v = (int *)malloc(n * sizeof(int));
    for(i=0; i<n; i++)
        scanf("%d", &v[i]);
    srand(time(NULL));
    for(i=n-1; i>=1; i--)
    {
        r = rand() % (i+1);
        v[r] = v[i] + v[r] - (v[i] = v[r]);
    }
    for(i=0; i<n; i++)
        printf("%d ", v[i]);
    return 0;
}
