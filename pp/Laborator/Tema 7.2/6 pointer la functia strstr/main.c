#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//ex 6

void cauta(char *a, char *s, int n, char (*comp)(const char*, const char*))
{
    int i;
    for(i=0; i<n; i++)
        if(((*comp)(a + i, s)) != NULL)
        {
            printf("Cuvantul se gaseste in tablou");
            break;
        }
    if(i==n) printf("Cuvantul nu se gaseste in tablou");
}

void main(void)
{
    char a[100][100], s[100];
    int n, i;
    scanf("%d", &n);
    for(i=0; i<n; i++)
    {
        scanf("%s", &a[i]);
    }
    printf("\0Cuvantul cautat este: ");
    scanf("%s", &s);
    int (*p)(const char*, const char*);
    p = strstr;
    cauta(a, s, n, p);
}
