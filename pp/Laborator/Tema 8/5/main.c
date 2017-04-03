#include <stdio.h>
#include <stdlib.h>
//ex 5
typedef struct saptamana
{
    int suma;
    char zi[20];
};

int main()
{
    FILE *f = fopen("fisier.in", "r");
    struct saptamana v[7];
    int i, sum = 0, MAX = 0, ziua;
    for(i=0; i<7; i++)
        {fscanf(f, "%s%d", &v[i].zi, &v[i].suma);
        sum += v[i].suma;}
    for(i=0; i<7; i++)
        if(v[i].suma > MAX) {MAX = v[i].suma; ziua = i;}
    printf("%d %d %d", sum, MAX, sum/7);
    return 0;
}
