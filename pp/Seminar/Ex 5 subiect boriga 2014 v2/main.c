#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    double medie, bac;
    int note[100];
    char nume[100], nrNote, promovat[5];

} elev;

void rez(elev *t, int n)
{
    int i, j;
    for(i=0; i<n; i++)
    {
        t[i].medie = 0;
        int ok = 1;
        for(j=0; j<t[i].nrNote; j++)
        {
            t[i].medie += t[i].note[j];
            if(t[i].note[j] < 5)
                ok = 0;
        }
        if(ok && t[i].medie >= 6) strcpy(t[i].promovat, "DA");
        else strcpy(t[i].promovat, "NU");
    }
}

int cmpInt(const void *a, const void *b)
{
    elev sa = *(int *)a, sb = *(int *)b;
    if(sa.bac == sb.bac) return sb.medie - sa.medie;
    return sb.bac - sa.bac;
}

int main()
{
    elev t[100];
    FILE *f = fopen("elev.in", "r");
    qsort(t, n, sizeof(int), cmpInt);
    //citire m
    sprintf(sir, "elevi_%d_%d.bin", m, m*100 % 100);
    return 0;
}
