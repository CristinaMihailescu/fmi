#include <stdio.h>
#include <stdlib.h>

void interschimbare(int *c, int *d)
{
    int t=*c;
    *c=*d;
    *d=t;
}

int main()
{
    int a, b;
    scanf("%d%d", &a, &b);
    interschimbare(&a, &b);
    printf("%d %d", a, b);
    return 0;
}
