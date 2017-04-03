#include <stdio.h>
#include <stdlib.h>
//ex 7
int maxim(int v[100], int n)
{
    int MAX = v[0], i, ind = 0;
    for(i=1; i<n; i++)
        if(v[i] > MAX)
        {
            MAX = v[i];
            ind = i;
        }
    return ind;
}

int cauta(int v[100], int n, int (*comp)(int, int))
{
    printf("%d", (*comp)(v, n) + 1);
}
void main(void)
{
    int n, MAX, i, j, ind, v[100];
    scanf("%d", &n);
    for(i=0; i<n; i++)
        scanf("%d", &v[i]);
    for(i=0; i<n; i++)
    {
        MAX = v[0], ind = 0;
        for(j=1; j<n-i; j++)
            if(v[j] > MAX)
            {
                MAX = v[j];
                ind = j;
            }
        int aux = v[ind];
        v[ind] = v[n-i-1];
        v[n-i-1] = aux;
    }
    printf("Vectorul ordonat este: ");
    for(i=0; i<n; i++)
        printf("%d ", v[i]);
    printf("\n");
    int (*p)(int , int);
    p = maxim;
    cauta(v, n, p);
}
