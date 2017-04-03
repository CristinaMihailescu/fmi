#include <stdio.h>
#include <stdlib.h>

void f()
{
    static int x = 0;
    x++;
}

int main()
{
    f();
    f();
    //printf("%d", x); incorect
    return 0;
}
