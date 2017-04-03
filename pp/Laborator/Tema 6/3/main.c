#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, i=0, infoNou, max=0;
    scanf("%d", &n);
    typedef struct nod
    {
        int info;
        struct nod* urm;
    } tnod;
    tnod *rad=NULL, *p, *ult=NULL;
    while(i<n)
    {
        i++;
        scanf("%d", &infoNou);
        tnod* nou = (tnod*)malloc(sizeof(tnod));
        nou->info = infoNou;
        nou->urm = NULL;
        if(rad==NULL) rad=nou;
        else ult->urm=nou;
        ult=nou;
    }
    //cautare
    p=rad;
    while(p!=NULL)
    {
        if(p->info>max) max=p->info;
        p=p->urm;
    }
    //stergere
    p=rad;
    while(p->urm!=NULL && p->urm->info!=max)
    {
        if(p->info>max) max=p->info;
        p=p->urm;
    }
    p->urm=p->urm->urm;
    //inserare
    tnod* nouIns = (tnod*)malloc(sizeof(tnod));
    nouIns->info=max;
    nouIns->urm=rad;
    rad=nouIns;
    //afisare
    p=rad;
    while(p!=NULL)
    {
        printf("%d ", p->info);
        p=p->urm;
    }
    return 0;
}
