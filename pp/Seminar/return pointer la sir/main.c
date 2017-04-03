#include <stdio.h>
#include <stdlib.h>

char* literemici(char *s)
{
    //static char aux[100]; corect
    char *aux = (char *)malloc(strlen(s) + 1);
    int i, k = 0;
    for(i=0; i<strlen(s); i++)
        if(s[i]>='a' && s[i]<='z') aux[k++] = s[i];
    aux[k] = '\0';
    return aux;
}

int main()
{
    char s[]="Ana are 2 mere.";
    char *t = literemici(s);
    //strcpy(t, literemici(s));
    printf("%s", t);
    return 0;
}
