#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, i=0, infoNou, k;
    scanf("%d%d", &n, &k);
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
    //afisare
    p=rad;
    while(p!=NULL)
    {
        printf("%d ", p->info);
        p=p->urm;
    }
    printf("\n");
    //inserare
    p=rad, i=0;
    while(i<k-1)
    {
        i++;
        p=p->urm;
    }
    tnod* nouIns = (tnod*)malloc(sizeof(tnod));
    scanf("%d", &nouIns->info);
    nouIns->urm=p->urm;
    p->urm=nouIns;
    //afisare
    p=rad;
    while(p!=NULL)
    {
        printf("%d ", p->info);
        p=p->urm;
    }
    return 0;
}
