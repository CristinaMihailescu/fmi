#include <stdio.h>
#include <stdlib.h>
//ex 6
void hexa(int *c)
{
    if('0' <= *c && *c <= '9') *c = *c - '0';
    else if('A' <= *c && *c <= 'F') *c = *c - 'A' + 10;
}

int main()
{
    int c;
    scanf("%c", &c);
    hexa(&c);
    printf("%d", c);
    return 0;
}
