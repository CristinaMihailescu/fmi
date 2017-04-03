#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, i, cnt = 0;
    scanf("%d", &n);
    unsigned long long m = 1ULL << 8 * sizeof(int) - 1;
    for(i=0; i<8 * sizeof(int); i++)
    {
        if(n & m) cnt++;
        m >>= 1;
    }
    printf("%d", cnt);
    return 0;
}
