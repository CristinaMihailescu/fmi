#include <stdio.h>
#include <stdlib.h>
//ex1
int f(unsigned n)
{
    unsigned cf,ap;
    for(cf=n%10,ap=0 ; n!=0 ; n/=10)
        if(n%10==cf) ap++;
    return ap;
}

int main()
{
    unsigned n;
    scanf("%d",&n);
    printf("Numarul de aparitii al cifrei unitatilor numarului n este %d",f(n));
    return 0;
}
