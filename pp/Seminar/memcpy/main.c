#include <stdio.h>
#include <stdlib.h>

int main()
{
    int v[] = {1, 2, 3, 4}, w[] = {5, 6, 7, 8}, i;
    memmove(v+2, v, sizeof(int));
    for(i=0; i<4; i++)
        printf("%d ", v[i]);
    return 0;
}
