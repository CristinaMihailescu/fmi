#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x, b;
    scanf("%d", &x);
    unsigned long long m = 1ULL << 8 * sizeof(int) - 1; //se incepe de la 0
    for(b=0; b<8 * sizeof(int); b++)
    {
        if(m & x) printf("1");
        else printf("0");
        m >>= 1;
    }
    return 0;
}
