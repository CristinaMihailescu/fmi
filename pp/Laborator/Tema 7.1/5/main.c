#include <stdio.h>
#include <stdlib.h>
//ex 5
int main()
{
    char s[20];
    fgets(s, 20, stdin);
    s[strlen(s)-1] = '\0';
    int i;
    char p[20];
    for(i=0; i<strlen(s); i++)
    {
        strcpy(p, s);
        strcpy(p+i, p+i+1);
        printf("%s\n", p);
    }
    return 0;
}
