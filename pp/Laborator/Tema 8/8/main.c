#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *f = fopen("fisier1.in", "r"), *g = fopen("fisier2.in", "w");
    char v[1000];
    int size = fread(v, 1, 1000, f);
    fwrite(v, 1, size, g);
    return 0;
}
