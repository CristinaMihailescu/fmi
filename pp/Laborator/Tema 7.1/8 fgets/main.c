#include <stdio.h>
#include <stdlib.h>
//ex 8
char *invers(char *string)
{
    char *p = string, *s = string, temp;
    p = p + strlen(string) - 1;
    while(s != string + strlen(string)/2)
    {
        temp = *s;
        *s = *p;
        *p = temp;
        s++, p--;
    }
    return string;
}

int cifre(char *s)
{
    while(*s)
    {
        if(*s < '0' || '9' < *s) return 0;
        s++;
    }
    return 1;
}

int main()
{
    char s[100];
    FILE *f = fopen("siruri.in", "r");
    while(fgets(s, 100, f) != NULL)
    {
        s[strlen(s) - 1] = '\0';
        if(!cifre(s)) invers(s);
        printf("%s\n", s);
    }
    return 0;
}
