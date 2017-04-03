#include <stdio.h>
#include <stdlib.h>
//ex 2
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

int main()
{
    char string[100];
    scanf("%s", &string);
    printf("%s", invers(string));
    return 0;
}
