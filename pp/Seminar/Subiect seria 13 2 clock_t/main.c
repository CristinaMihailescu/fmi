#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
typedef struct
{
    double time;
} clock_t;

clock_t count(char *u, unsigned int *v)
{
    clock_t t;
    int i;
    *v = 0;
    for(i=0; i<strlen(u); i++)
        if(strchr("aeiouAEIOU", u[i]) != NULL) (*v)++;
    t.time = strlen(u) * 5 / pow(10, 9);
    return t;
}

int main()
{
    unsigned int v;
    char u[] = "Vine sesiunea mai!";
    clock_t result = count(u, &v);
    printf("%lf %u", result.time, v);
    return 0;
}
