#include <stdio.h>
#include <stdlib.h>

int suma (int n, int (*expr)(int))
{
    int i, sum = 0;
    for(i=1; i<=n; i++)
        sum += (expr)(i);
    return sum;
}

int expr1(int i){return i;}
int expr2(int i){return i*i;}
int expr3(int i){return i*i*i;}

int main()
{
    printf("%d %d %d", suma(6, expr1), suma(6, expr2), suma(6, expr3));
    return 0;
}
