#include <stdio.h>
#include <stdlib.h>
double ridLaPutere(double *b, double *p)
{
    double i=2, t=*b;
    for( ; i<=*p; i++)
    {
        t*=*b;
    }
    return t;
}
int main()
{
    double x, y, P, m, n, PR;
    scanf("%lf%lf%lf%lf", &x, &y, &m, &n);
    P=ridLaPutere(&m,&n);
    PR=x*y;
    printf("%.0lf", ridLaPutere(&x,&m)+ridLaPutere(&y,&n)+ridLaPutere(&PR,&P));
    return 0;
}
