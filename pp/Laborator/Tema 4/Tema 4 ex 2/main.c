#include <stdio.h>
#include <stdlib.h>

struct complex{int a, b;} x, y;
int t=1,u=1;
void adunare()
{
    printf("Suma lor este: %d+%di.\n", x.a+y.a, x.b+y.b);
}
void inmultire(int xa, int xb, int ya, int yb, int ok)
{
    if(ok)
    {
        if(ya*xb+xa*yb<0) printf("Produsul lor este: %d%di.\n", xa*ya-xb*yb, ya*xb+xa*yb);
        else printf("Produsul lor este: %d+%di.\n", xa*ya-xb*yb, ya*xb+xa*yb);}
    t=xa*ya-xb*yb;
    u=ya*xb+xa*yb;
}
void impartire()
{
    if(y.a*x.b-x.a*y.b<0) printf("Catul lor este: (%d%di)/%d.\n", x.a*y.a+x.b*y.b, y.a*x.b-x.a*y.b, y.a*y.a-y.b*y.b);
    else printf("Catul lor este: (%d+%di)/%d.\n", x.a*y.a+x.b*y.b, y.a*x.b-x.a*y.b, y.a*y.a-y.b*y.b);
}
void ridLaPutere()
{
    int p;
    printf("La ce putere doriti sa ridicati numerele? \n");
    scanf("%d", &p);
    p--;
    int pp=p;
    t=x.a, u=x.b;
    while(p)
    {
        inmultire(t, u, x.a, x.b, 0);
        p--;
    }
    if(u<0) printf("Raspunsul este: %d%di si ", t, u);
    else printf("Raspunsul este: %d+%di si ", t, u);
    p=pp, t=y.a, u=y.b;
    while(p)
    {
        inmultire(t, u, y.a, y.b, 0);
        p--;
    }
    if(u<0) printf("%d%di.", t, u);
    else printf("%d+%di.", t, u);
}
int main()
{
    printf("Scrieti doua numere complexe: ");
    scanf("%d%*c%d%*c", &x.a, &x.b);
    printf("si ");
    scanf("%d%*c%d%*c", &y.a, &y.b);
    adunare();
    inmultire(x.a, x.b, y.a, y.b, 1);
    impartire();
    ridLaPutere();
    return 0;
}
