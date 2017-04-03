#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
int suma(int n, ...)
{
    va_list lp;
    int i, s = 0, r;
    va_start(lp, n); //incarc lista
    for(i=0; i<n; i++)
        s += va_arg(lp, int);
    va_end(lp); //sterg lista
    return s;
}
int main()
{
    printf("%d", suma(4, 1, 1, 2, 1));
    return 0;
}
