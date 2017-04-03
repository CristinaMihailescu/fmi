#include <stdio.h>
#include <stdlib.h>
//ex2
int f(int n)
{
    int i,s;
    for(i=1,s=0;i<=n/2;i++)
        if(n%i==0) s+=i;
    if(s==n) printf("%d este numar perfect.",n);
    else printf("%d nu este numar perfect.",n);
}

int main()
{
    int n;
    scanf("%d",&n);
    f(n);
    return 0;
}
