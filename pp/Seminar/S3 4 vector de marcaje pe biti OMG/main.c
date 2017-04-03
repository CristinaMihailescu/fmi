#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main()
{
    FILE *f = fopen("file.in", "r");
    int min = INT_MAX, max = INT_MIN, n, i, b, x;
    fscanf(f, "%d", &n);
    for(i=0; i<n; i++)
    {
        fscanf(f, "%d", &x);
        if(x<min) min = x;
        if(x>max) max = x;
    }
    rewind(f);
    fgetc(f);
    unsigned char *v = (unsigned char *)calloc((max - min + 1)/8 - 1, sizeof(unsigned char)); // !! sizeof(unsigned char) = 1
    while(fscanf(f, "%d", &x) == 1)
        v[(x - min) / 8] = v[(x - min) / 8] | 1<<((x - min)%8);
    for(i=0; i<(max - min +1)/8; i++)
        for(b=0; b<8; b++)
        if(v[i] & 1<<b) printf("%d ", i * 8 + b + min);
    return 0;
}
