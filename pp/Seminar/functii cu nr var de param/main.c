#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
char* add(int n, ...)
{
    va_list lp;
    va_start(lp, n);
    char *s = (char *)malloc(100 * sizeof(char));
    strcpy(s, "");
    while(n != 0)
    {
        n--;
        strcat(s, va_arg(lp, char *));
    }
    va_end(lp);
    return s;
}

int main()
{
    printf("%s", add(5, "Pst,", " ce", " mai", " faci", " ?"));
    return 0;
}
