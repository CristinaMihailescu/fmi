#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, m, i, j, ok=1, k;
    scanf("%d%d", &n, &m);
    int *v[n], *w[m];
    for(i=0; i<n; i++)
        scanf("%d", &v[i]);
    for(j=0; j<m; j++)
        scanf("%d", &w[j]);
    scanf("%d", &k);
    i=0, j=0;
    while(ok)
    {
        ok=0;
        while(i<n && v[i]<=k) i++;
        while(j<m && w[j]>k) j++;
        if(i<n && j<m)
        {
            ok=1;
            int t=v[i];
            v[i]=w[j];
            w[j]=t;
            i++; j++;
        }}
    for(i=0; i<n; i++)
        printf("%d ", v[i]);
    printf("\n");
    for(j=0; j<m; j++)
        printf("%d ", w[j]);
        return 0;
    }
