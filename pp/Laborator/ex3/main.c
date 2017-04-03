#include <stdio.h>
#include <stdlib.h>
//ex3
int f(int n)
{
    int i,ok;
    for(i=2,ok=1;i<=n/2 && ok==1;i++)
        if(n%i==0) ok=0;
    if(ok==1) printf("%d este numar prim.",n);
    else printf("%d nu este numar prim.",n);
}

int main()
{
    int n;
    scanf("%d",&n);
    f(n);
    return 0;
}
