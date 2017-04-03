#include <stdio.h>
#include <stdlib.h>
//ex 7
int main()
{
    FILE *f = fopen("fisier1.in", "r"), *g = fopen("fisier2.in", "w");
    char v[1000];
    while(fread(v, 1, 1, f) == 1)
        fwrite(v, 1, 1, g);
    return 0;
}
