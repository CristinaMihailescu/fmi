#include <stdio.h>
#include <stdlib.h>

int cmpFunc(const void *a, const void *b)
{
    return *(int *)a - *(int *)b;
}

void *cautare(const void *x, const void *t, int n, int d, int (*cmpValori)(const void *, const void *))
{
    char *p = (char *) t;
    int i;
    for(i=0; i<n; i++)
    {
        if(cmpValori(x, p + i * d) == 1)
            return p + i * d;
    }
    return NULL;
}

int main()
{
    int v[100], n, i, *p, ok = 1;
    scanf("%d", &n);
    for(i=0; i<n; i++)
        scanf("%d", &v[i]);
    for(i=n; i>=0; i--)
    {
        p = (int *)cautare(&v[i], v, i, sizeof(int), cmpFunc);
        if(p != NULL && *p < v[i]) ok = 0;
    }
    if(ok) printf("Da");
    else printf("Nu");
    return 0;
}
