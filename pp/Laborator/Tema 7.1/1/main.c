#include <stdio.h>
#include <stdlib.h>
//ex 1
int main()
{
    int n, k, i, ok = 1;
    scanf("%d%d", &n, &k);
    int *v = (int *)malloc(n * sizeof(int));
    for(i=0; i<n; i++)
    {
        scanf("%d", &v[i]);
        if((i<=k && i>0 && v[i]<v[i-1]) || (i>=k+2 && v[i]>v[i-1])) ok = 0;
    }
    ok = 1 ? printf("DA") : printf("NU");
    return 0;
}
