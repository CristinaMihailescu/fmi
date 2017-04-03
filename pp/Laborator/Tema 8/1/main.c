#include <stdio.h>
#include <stdlib.h>
//ex 1
int main()
{
    FILE *f = fopen("numere.in", "rb");
    int x, cnt = 0;
    while(fscanf(f, "%d", &x) != EOF)
        if(x%2 == 0) cnt++;
    printf("%d", cnt);
    return 0;
}
