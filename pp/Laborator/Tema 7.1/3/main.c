#include <stdio.h>
#include <stdlib.h>
//ex 3
char *copy(char *s, const char *t, int n)
{
    char *p = s;
    p = p + strlen(s) - n;
    while(n--)
        {*p = *t; p++, t++;}
    return s;
}

int main()
{
    char s[100], t[100];
    int n;
    scanf("%s%s%d", &s, &t, &n);
    printf("%s", copy(s, t, n));
    return 0;
}
