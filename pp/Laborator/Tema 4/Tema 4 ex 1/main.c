#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define medieAdm(a,b) 8*a/10+2*b/10
#define promov 5

int n, cnt;

struct date
{
    int nrLeg;
    double notaMate, notaInfo, notaBac, medie;
    char nume[100], admis, buget;
} v[100], t;

void citeste()
{
    int ok;
    printf("Numarul de candidati este: ");
    scanf("%d", &n);
    printf("Scrieti, pentru fiecare candidat, urmatoarele date: \n1. numele\n2. numarul legitimatiei\n3. nota de la examenul de matematica\n4. nota de la examenul de informatica\n5. nota de la bacalaureat\n");
    int i, j;
    for(i=1; i<=n; i++)
    {
        scanf("%s%d%lf%lf%lf", &v[i].nume, &v[i].nrLeg, &v[i].notaMate, &v[i].notaInfo, &v[i].notaBac);

        v[i].medie=medieAdm((v[i].notaMate + v[i].notaInfo)/2, v[i].notaBac);

        if(v[i].medie>=promov)
        {
            v[i].admis='Y';
            cnt++;
        }
        else v[i].admis='N';

        j=i-1;
        while(j>=1 && strcmp(v[j].nume,v[j+1].nume)>0)
        {
            t=v[j];
            v[j]=v[j+1];
            v[j+1]=t;
            j--;
        }
    }
}

void Buget()
{
    cnt=cnt*75/100;
    int i, j;
    for(i=1; i<n; i++)
        for(j=i+1; j<=n; j++)
            if(v[i].medie<v[j].medie)
            {
                t=v[i];
                v[i]=v[j];
                v[j]=t;
            }
    for(i=1; i<=n; i++)
        if(i<=cnt) v[i].buget='Y';
        else
        {
            if(v[i].admis='Y') v[i].buget='N';
            else v[i].buget=' ';
        }
}

void SWITCH()
{
    int op, i, j;
    printf("Scrieti numarul corespunzator optiunii dorite:\n");
    printf("1 - pentru afisarea tuturor candidatilor\n");
    printf("2 - pentru afisarea candidatilor admisi la buget\n");
    printf("3 - pentru afisarea candidatilor admisi la taxa\n");
    printf("4 - pentru afisarea candidatilor respinsi\n");
    scanf("%d", &op);
    switch(op)
    {
    case 1:
        for(i=1; i<n; i++)
        for(j=i+1; j<=n; j++)
            if(strcmp(v[j].nume,v[i].nume)<0)
            {
                t=v[i];
                v[i]=v[j];
                v[j]=t;
            }
        for(i=1; i<=n; i++)
            printf("%s\n", v[i].nume);
        break;
    case 2:
        for(i=1; i<=n; i++)
            if(v[i].buget=='Y') printf("%s\n", v[i].nume);
        break;
    case 3:
        for(i=1; i<=n; i++)
            if(v[i].buget=='N') printf("%s\n", v[i].nume);
        break;
    case 4:
        for(i=1; i<=n; i++)
            if(v[i].buget==' ') printf("%s\n", v[i].nume);
        break;
    }
}

int main()
{
    citeste();
    Buget();
    SWITCH();
    return 0;
}
