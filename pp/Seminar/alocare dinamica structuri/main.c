#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *f = fopen("results.out", "wb");
    char s[] = "Ana Maria", a[] = "Cristina";
    typedef struct
    {
        char *nume;
        int varsta;
    } persoana;
    persoana p, q;

    p.nume = (char *)malloc(strlen(s) + 1);
    strcpy(p.nume, s);
    p.varsta = (int *)malloc(sizeof(int));
    p.varsta = 18;

    q.nume = (char *)malloc(strlen(a) + 1);
    strcpy(q.nume, a);
    q.varsta = (int *)malloc(sizeof(int));
    q.varsta = 20;

    free(p.nume);
    p = q;
    fwrite(&p, sizeof(persoana), 1, f);
    return 0;
}
