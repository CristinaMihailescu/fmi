#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//ex 7
int vals(int *s, int ds, int *d, int *dd)
{
    while(*s)
    {
        if(pow(10, ds - 1) <= *s && *s < pow(10, ds)) //nr e de dim ds
            {*d = *s; d++; (*dd)++;}
        s++;
    }
    return *dd;
}

int main()
{
    int s[100], ds, d[100], i, n, dd = 0;
    scanf("%d%d", &n, &ds);
    for(i=0; i<n; i++) scanf("%d", &s[i]);
    s[n] = NULL;
    printf("%d", vals(s, ds, d, &dd));
    return 0;
}
