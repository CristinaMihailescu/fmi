#include <stdio.h>
#include <stdlib.h>
//ex4
int cmmdc(int n,int m)
{
    while(n!=m)
        if(m>n) m-=n;
        else n-=m;
    return n;
}

int cmmmc(int n,int m)
{
    int a=n,b=m;
    while(n!=m)
        if(m>n) m-=n;
        else n-=m;
    return a*b/n;
}

int main()
{
    int n,m;
    scanf("%d%d",&n,&m);
    printf("Cmmdc = %d cmmmc = %d",cmmdc(n,m),cmmmc(n,m));

    return 0;
}
