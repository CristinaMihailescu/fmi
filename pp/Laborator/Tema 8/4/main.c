#include <stdio.h>
#include <stdlib.h>
//ex 4

typedef struct angajat
{
    int cod, salariu;
    char nume[100], prenume[100];
};

int main()
{
    FILE *f = fopen("pers.in", "r");
    int n, i, MIN = 10000000;
    fscanf(f, "%d", &n);
    struct angajat *v =(int *)malloc(n * sizeof(int));;
    for(i=0; i<n; i++)
        fscanf(f, "%d%d%s%s", &v[i].cod, &v[i].salariu, &v[i].nume, &v[i].prenume);
    for(i=0; i<n; i++)
        if(v[i].salariu < MIN) MIN = v[i].salariu;
    for(i=0; i<n; i++)
        if(v[i].salariu == MIN)
        printf("%d %d %s %s\n", v[i].cod, v[i].salariu, v[i].nume, v[i].prenume);
    return 0;
}
