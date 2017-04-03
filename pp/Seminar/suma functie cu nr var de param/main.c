#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

int suma(int x, ...)
{
    va_list lp;
    int s = x;
    va_start(lp, x);
    while(x != 0)
    {
        s += x;
        x = va_arg(lp, int);
    }
    va_end(lp);
    return s;
}

int main()
{
    printf("%d", suma(8, 9, 20, 0));
    return 0;
}
