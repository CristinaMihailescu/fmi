#include <stdio.h>
#include <stdlib.h>

#define min(a, b) ((a<b) ? a : b)
#define modul(a) ((a<0) ? -a : a)

int strofa_ex_4()
{
    FILE *f3 = fopen("data3.in", "r");
    char s[100], sa[100], sb[100], sc[100], sd[100];
    int v[3], a, b, c, d, i=-1;
    fgets(s, 100, f3);
    s[strlen(s)-1]='\0';
    strcpy(sa, s+strlen(s)-3);

    fgets(s, 100, f3);
    s[strlen(s)-1]='\0';
    strcpy(sb, s+strlen(s)-3);

    fgets(s, 100, f3);
    s[strlen(s)-1]='\0';
    strcpy(sc, s+strlen(s)-3);

    fgets(s, 100, f3);
    s[strlen(s)-1]='\0';
    strcpy(sd, s+strlen(s)-3);
    if(strcmp(sa, sb)==0 && strcmp(sb, sc)==0 && strcmp(sc, sd)==0) return 4;
    if(strcmp(sa, sb)==0 && strcmp(sc, sd)==0) return 1;
    if(strcmp(sa, sc)==0 && strcmp(sb, sd)==0) return 2;
    if(strcmp(sa, sd)==0 && strcmp(sb, sc)==0) return 3;
    return 0;
}

typedef struct nod
{
    int info;
    struct nod *urm;
} tnod;

void lista_ex_3(int n, int **m)
{
    FILE *g = fopen("data.out", "a");
    int i = 0, j;
    tnod *rad = NULL, *ult = NULL, *p;
    while(i<n)
    {
        for(j=0; j<n; j++)
        {
            tnod *nou = (tnod *)malloc(sizeof(tnod));
            nou -> info = m[i][j];
            nou -> urm = NULL;
            if(rad == NULL) rad = nou;
            else ult -> urm = nou;
            ult = nou;
        }
        i++;
        if(i>=n) break;
        for(j=n-1; j>=0; j--)
        {
            tnod *nou = (tnod *)malloc(sizeof(tnod));
            nou -> info = m[i][j];
            nou -> urm = NULL;
            if(rad == NULL) rad = nou;
            else ult -> urm = nou;
            ult = nou;
        }
        i++;
    }
    //afisare elemente
    fprintf(g, "\nExercitiul 3: Elementele listei sunt: ");
    p = rad;
    while(p != NULL)
    {
        fprintf(g, "%d ", p -> info);
        p = p -> urm;
    }
}

struct rational
{
    int a, b;
};

struct rational fractii_ex_2()
{
    FILE *f1=fopen("data1.in", "r");
    int n, i;
    fscanf(f1, "%d", &n); //citire n
    struct rational fr, rez;
    fscanf(f1, "%d%d", &rez.a, &rez.b);
    for(i=1; i<n; i++)
    {
        fscanf(f1, "%d%d", &fr.a, &fr.b); // citire numarator si numitor pentru fiecare fractie
        rez.a = fr.b * rez.a - rez.b * fr.a;
        rez.b = fr.b * rez.b;
    }
    for(i=2; i<min(modul(rez.a), modul(rez.b)); i++)
        while(rez.a % i == 0 && rez.b % i == 0) rez.a /= i, rez.b /= i;
    return rez;
}

/*Folosind operatorii logici de deplasare la nivel de bit,
sa se scrie o func?ie care calculeaza valoarea expresiei
12/7*5 si sa se afiseze rezultatul.
*/

void expresie_ex_1()
{
    FILE *g=fopen("data.out", "w");
    double x;
    x = (1 << 2) | (1 << 3); // x = 12
    x = x / (1 | (1 << 1) | (1 << 2)); // x = 12 / 7
    x = x * (1 | (1 <<2 )); // x = 12 / 7 * 5
    fprintf(g, "Exercitiul 1: 12 / 7 * 5 = %f", x);
}

int main()
{
    expresie_ex_1();
    struct rational rez = fractii_ex_2();
    FILE *f2 = fopen("data2.in", "r"), *g = fopen("data.out", "a");
    fprintf(g, "\nExercitiul 2: Diferenta fractiilor este %d / %d", rez.a, rez.b);

    int n, i, j;
    fscanf(f2, "%d", &n); //citire n
    int **m = (int *)malloc(n * sizeof(int *));
    m[0] = (int *)malloc(n * n * sizeof(int));
    for(i=1; i<n; i++)
        m[i] = m[0] + i*n;
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
            fscanf(f2, "%d ", &m[i][j]);
    lista_ex_3(n, m);
    free(m[0]); //dezalocare
    free(m);
    int rima = strofa_ex_4();
    switch (rima)
    {
    case 0:
        fprintf(g, "\nExercitiul 4: Strofa nu are rima.");
        break;
    case 1:
        fprintf(g, "\nExercitiul 4: Strofa are rima imperecheata.");
        break;
    case 2:
        fprintf(g, "\nExercitiul 4: Strofa are rima imbratisata.");
        break;
    case 3:
        fprintf(g, "\nExercitiul 4: Strofa are rima incrucisata.");
        break;
    case 4:
        fprintf(g, "\nExercitiul 4: Strofa are monorima.");
        break;
    }
    FILE *f4 = fopen("data4.in", "r");
    fscanf(f4, "%d", &n);
    int a[100][100];
    a[0][0] = 1;
    for(i=0; i<n * (n-1); i++)
    {
        if(i!=0) a[i][0] = a[i-1][0] + i + 1;
        for(j=1; j<n * (n-1); j++)
            a[i][j] = a[i][j-1] + i + j;
    }
    for(i=0; i<n * (n-1); i++)
        for(j=0; j<n * (n-1); j++)
            if(a[i][j] == n)
            {
                fprintf(g, "\nExercitiul 5: %d se afla pe A%d B%d", n, i+1, j+1);
            }
    free(a[0]);
    free(a);
    return 0;
}
