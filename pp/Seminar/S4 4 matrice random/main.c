#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *f = fopen("matrice.bin", "wb+");
    srand(time(NULL));
    int n = 10 + rand()%90, i, j;
    int **a = (int **)malloc(n * sizeof(int *));
    a[0] = (int *)malloc(n * n * sizeof(int));
    for(i=1; i<n; i++)
        a[i] = a[0] + i * n;
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
        a[i][j] = i > j ? (i - j) : (j - i);
    fwrite(a[0], sizeof(int), n * n, f);
    free(a[0]);
    free(a);
    //srand(time(NULL));
    int k, x, y;
    i = 10 + rand()%(n-10), j = 10 + rand()%(n-10);
    for(k=0; k<n; k++)
    {
        fseek(f, (i * n + k) * sizeof(int), SEEK_SET);
        fread(&x, sizeof(int), 1, f);
        fseek(f, (j * n + k) * sizeof(int), SEEK_SET);
        fread(&y, sizeof(int), 1, f);
        fseek(f, -sizeof(int), SEEK_CUR);
        fwrite(&x, sizeof(int), 1, f);
        fseek(f, (i * n + k) * sizeof(int), SEEK_SET);
        fwrite(&y, sizeof(int), 1, f);
    }
    rewind(f);
    FILE * g = fopen("matrice.txt", "w");
    for(i=0; i<n; i++)
        {for(j=0; j<n; j++)
        {
            fread(&x, sizeof(int), 1, f);
            fprintf(g, "%d ", x);
        }
        fprintf(g, "\n");}
    return 0;
}
