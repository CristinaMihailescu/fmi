#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
    FILE *f = fopen("cuvinte.in", "r"), *g = fopen("cuvinte.out", "w");
    char s[100], linie[1000], *p;
    fscanf(f, "%s", s);
    fgetc(f);
    fgets(linie, 100, f); //!!! atentie
    linie[strlen(linie)] = '\0';
    p = strtok(linie, ".,; !?");
    int OK = 0, i;
    while(p)
    {
        int ok = 1;
        for(i=0; i<strlen(s); i++)
            if(strchr(p, s[i]) == NULL)
            {
                ok=0;
                break;
            }
        if(ok)
        {
            OK = 1;
            fprintf(g, "%s ", p);
        }
        p = strtok(NULL, ".,; !?");
    }
    if(!OK) fprintf(g, "Imposibil");
    return 0;
}
