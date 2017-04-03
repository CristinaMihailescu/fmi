#include <stdio.h>
#include <stdlib.h>
//ex 2
int main()
{
    FILE *f = fopen("sir1.txt", "rb"), *g = fopen("sir2.txt", "wb");
    int x, i;
    while(fscanf(f, "%d", &x) == 1)
    {
        for(i=2; i<x; i++)
            if(x%i == 0) break;
        if(i==x && x!=2) fprintf(g, "%d ", x);
    }
    return 0;
}
