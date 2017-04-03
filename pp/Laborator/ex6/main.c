#include <stdio.h>
#include <stdlib.h>
//ex6
int f1(unsigned n)
{
    unsigned cf,ap;
    for(cf=n%10,ap=0 ; n!=0 ; n/=10)
        if(n%10==cf) ap++;
    return ap;
}

int f2(int n)
{
    int i,s;
    for(i=1,s=0;i<=n/2;i++)
        if(n%i==0) s+=i;
    if(s==n) printf("%d este numar perfect.",n);
    else printf("%d nu este numar perfect.",n);
}

int f3(int n)
{
    int i,ok;
    for(i=2,ok=1;i<=n/2 && ok==1;i++)
        if(n%i==0) ok=0;
    if(ok==1) printf("%d este numar prim.",n);
    else printf("%d nu este numar prim.",n);
}
//ex4:
int cmmdc(int n,int m)
{
    while(n!=m)
        if(m>n) m-=n;
        else n-=m;
    return n;
}

int cmmmc(int n,int m)
{
    int a=n,b=m;
    while(n!=m)
        if(m>n) m-=n;
        else n-=m;
    return a*b/n;
}

int f5(int n)
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
    int op;
    printf("Scrieti numarul functie pe care doriti sa o accesati:\n 1 - afiseaza numarul de aparitii al cifrei unitatilor unui numar \n 2 - verifica daca un numar este perfect \n 3 - determina daca un numar este prim \n 4 - afiseaza cmmdc si cmmmc a doua numere \n 5 - afiseaza cele mai mari doua valori distincte dintr-un sir\n");
    scanf("%d",&op);
    while(op!=-1)
    switch(op)
    {
    case 1:
        {unsigned n;
        printf("n= ");
        scanf("%d",&n);
        printf("Numarul de aparitii al cifrei unitatilor este %d",f1(n));
        printf("\nScrieti numarul functiei pe care doriti sa o accesati in continuare sau -1 pentru oprire ");
        scanf("%d",&op);
        break;}
    case 2:
        {int n;
        printf("n= ");
        scanf("%d",&n);
        f2(n);
        printf("\nScrieti numarul functiei pe care doriti sa o accesati in continuare sau -1 pentru oprire ");
        scanf("%d",&op);
        break;}
    case 3:
        {int n;
        printf("n= ");
        scanf("%d",&n);
        f3(n);
        printf("\nScrieti numarul functiei pe care doriti sa o accesati in continuare sau -1 pentru oprire ");
        scanf("%d",&op);
        break;}
    case 4:
        {int n,m;
        printf("n= ");
        scanf("%d",&n);
        printf("\nm= ");
        scanf("%d",&m);
        printf("Cmmdc(n,m)=%d si cmmmc(n,m)=%d",cmmdc(n,m),cmmmc(n,m));
        printf("\nScrieti numarul functiei pe care doriti sa o accesati in continuare sau -1 pentru oprire ");
        scanf("%d",&op);
        break;}
    case 5:
        {int n;
        printf("n= ");
        scanf("%d",&n);
        f5(n);
        printf("\nScrieti numarul functiei pe care doriti sa o accesati in continuare sau -1 pentru oprire ");
        break;}
    default:
        break;
    }
    return 0;
}
