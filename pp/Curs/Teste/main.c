#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    double a, b, r;
    char op;
    scanf("%lf%c%lf", &a, &op, &b);
    switch(op)
    {
        case '+':
        r=a+b;
        break;
        case '-':
        r=a-b;
        break;
        case '*':
        r=a*b;
        break;
        case '/':
        r=b==0?NAN:a/b;
        break;
        defaulf:
            printf("Operatie incorecta!");
    }

    if(isnan(r))
        printf("Eroare!");
    else printf("%f%c%f=%f", a, op, b, r);
    return 0;
}
