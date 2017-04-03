#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//ex 7
typedef struct elev
{
    int nota;
    char nume[100], prenume[100];
};

void swap(char *a, char *b)
{
    char temp[100];
    strcpy(temp, a);
    strcpy(a, b);
    strcpy(b, temp);
}

int main()
{
    while(1)
    {
        FILE *f;
        char name[100], num[100], prenum[100], NUME[100], PRENUME[100];
        printf("Scrieti numele fisierului din care doriti sa cititi: ");
        scanf("%s", name);
        f = fopen(name, "r");
        if(!f) printf("\nFisierul nu exista");
        else
        {
            int i = 0, j, n = 0, ok = 0, MED = 0, ans, NOTA;
            struct elev v[100];
            while(fscanf(f, "%s%s%d", &NUME, &PRENUME, &NOTA) == 3)
            {
                n++;
                strcpy(v[n-1].nume, NUME);
                strcpy(v[n-1].prenume, PRENUME);
                v[n-1].nota = NOTA;
                MED += v[n-1].nota;
            }
            printf("\nScrieti numele unui student: ");
            scanf("%s%s", num, prenum);
            for(i=0; i<n && !ok; i++)
                if(strcmp(v[i].nume, num) == 0 && strcmp(v[i].prenume, prenum) == 0)
                {
                    ok = 1;
                    printf("\nStudentul este prezent");
                }
            if(!ok)
                printf("\nStudentul nu este prezent");
            for(i=0; i<n - 1; i++)
                for(j=i + 1; j<n; j++)
                    if(strcmp(v[i].nume, v[j].nume) > 0 || (strcmp(v[i].nume, v[j].nume) == 0 && strcmp(v[i].prenume, v[j].prenume) > 0))
                    {
                        int aux = v[i].nota;
                        v[i].nota = v[j].nota;
                        v[j].nota = aux;
                        swap(v[i].nume, v[j].nume);
                        swap(v[i].prenume, v[j].prenume);
                    }
            printf("\nOrdine alfabetica:");
            for(i=0; i<n; i++)
                printf("%s %s %d\n", v[i].nume, v[i].prenume, v[i].nota);
            printf("\nMedia grupei este %d", MED/n);
            printf("\nDoriti sa repetati procedura? 1 = DA, 0 = NU ");
            scanf("%d", &ans);
            if(!ans) return 0;
        }
        fclose(f);
    }
}
