#include <stdio.h>
#include <stdlib.h>

int aparitie(int x, int i, int j, int *a)
{
    int cnt = 0, k;
    for(k=i; k<=j; k++)
        if(a[k] == x) cnt++;
    return cnt;
}

void distinct(int *a, int n) //O(n^2)
{
    int ok = 1, i;
    for(i=0; i<n-1; i++)
        if(aparitie(a[i], i+1, n-1, a))
    {
        ok = 0;
        break;
    }
    if(ok) printf("Da");
    else printf("Nu");
}

int main()
{
    int a[] = {1, 4, 6, 9, 10, 8};
    distinct(a, 6);
    return 0;
}
