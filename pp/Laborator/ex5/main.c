#include <stdio.h>
#include <stdlib.h>
//ex5
int f(int n)
{
    int max1=0,max2=0,x;
    while(n!=0)
    {
        scanf("%d",&x);
        if(x>max2)
        {
            if(x>max1)
            {
                max2=max1;
                max1=x;
            }
            else if(x!=max1) max2=x;
        }
        n--;
    }
        printf("Cele doua maxime sunt: %d si %d.",max1,max2);
}

int main()
{
    int n;
    scanf("%d",&n);
    f(n);
    return 0;
}
