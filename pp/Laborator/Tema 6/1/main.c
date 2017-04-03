#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, i=0, infoNou;
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
    p=rad;
    while(p!=NULL)
    {
        printf("%d ", p->info);
        p=p->urm;
    }

    return 0;
}
