#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *ft = tmpfile();
    char nume[100];
    int i, n, x, y;
    scanf("%d", &n);
    for(i=0; i<n; i++)
    {
        scanf("%d", &x);
        rewind(ft);
        int ok = 1;
        while(fread(&y, sizeof(int), 1, ft))
        {
            if(y == x)
            {
                ok = 0; break;
            }
        }
        if(ok)
            fwrite(&x, sizeof(int), 1, ft);
    }
    scanf("%s", nume);
    FILE *f = fopen(nume, "w");
    rewind(ft);
    while(fread(&x, sizeof(int), 1, ft))
        fprintf(f, "%d ", x);
    fclose(ft);
    fclose(f);
    return 0;
}
