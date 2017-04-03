#include <stdio.h>
#include <stdlib.h>
//ex 3
int main()
{
    char m[100][100];
    int i, j, MAX = 0, ind, n;
    printf("Numarul de siruri este: ");
    scanf("%d", &n);
    fgetc(stdin);
    for(i=0; i<n; i++)
    {
        fgets(m[i], 100, stdin);
        m[i][strlen(m[i]) - 1] = '\0';
    }
    for(i=0; i<n; i++)
    {
        int cnt = 0;
        for(j=0; j<strlen(m[i]); j++)
            if(strchr("aeiouAEIOU .,!?;", m[i][j]) == 0) cnt++;
        if(cnt > MAX)
        {
            MAX = cnt, ind = i;
        }
    }
    printf("Sirul cu cele mai multe consoane este %d", ind + 1);
    return 0;
}
