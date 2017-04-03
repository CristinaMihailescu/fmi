#include <stdio.h>
#include <string.h>
#include <windows.h>
#define KEY_UP 72
#define KEY_DOWN 80
#define KEY_LEFT 75
#define KEY_RIGHT 77
#define ENTER 13
#define ESC 27
char m[7][7];
int gm=0, col=1, esc=0, scor1=0, scor2=0, player=1;
char player1[100], player2[100];
void print()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    int i, j;
    for(i=1; i<=7; i++)
    {
        for(j=1; j<=7; j++)
        {
            if(j==col)
            {
                SetConsoleTextAttribute(hConsole, 95);
                printf(" %c ", m[i][j]);
                SetConsoleTextAttribute(hConsole, 7);
            }
            else printf(" %c ", m[i][j]);
        }
        if(i==4) printf("\t\t%s %d - %d %s", player1, scor1, scor2, player2);
        printf("\t\n");
    }
}
void printMENU1()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, 95);
    if(gm) printf("\n    NEW GAME \n");
    else printf("\n    PLAY     \n");
    SetConsoleTextAttribute(hConsole, 7);
    printf("    RULES    \n");
    printf("    QUIT GAME\n");
}
void printMENU2()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    if(gm) printf("\n    NEW GAME \n");
    else printf("\n    PLAY     \n");
    SetConsoleTextAttribute(hConsole, 95);
    printf("    RULES    \n");
    SetConsoleTextAttribute(hConsole, 7);
    printf("    QUIT GAME\n");
}
void printMENU3()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    if(gm) printf("\n    NEW GAME \n");
    else printf("\n    PLAY     \n");
    printf("    RULES    \n");
    SetConsoleTextAttribute(hConsole, 95);
    printf("    QUIT GAME\n");
    SetConsoleTextAttribute(hConsole, 7);
}
void printMENU4()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, 95);
    printf("\n    PvP      \n");
    SetConsoleTextAttribute(hConsole, 7);
    printf("    PvE      \n");
    printf("    BACK     \n");
}
void printMENU5()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    printf("\n    PvP      \n");
    SetConsoleTextAttribute(hConsole, 95);
    printf("    PvE      \n");
    SetConsoleTextAttribute(hConsole, 7);
    printf("    BACK     \n");
}
void printMENU6()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    printf("\n    PvP      \n");
    printf("    PvE      \n");
    SetConsoleTextAttribute(hConsole, 95);
    printf("    BACK     \n");
    SetConsoleTextAttribute(hConsole, 7);
}
void MENUPV()
{
    int c = 0, o=1, enter=0, ok=1;
    player=1;
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    printMENU4();
    while(1 && ok)
    {
        c=0;
        switch((c=getch()))
        {
        case KEY_UP:
            if(o!=1) o--;
            break;
        case KEY_DOWN:
            if(o!=3) o++;
            break;
        case ENTER:
            enter=1;
            break;
        default:
            break;
        }
        system("cls");
        switch (o)
        {
        case 1:
            printMENU4();
            break;
        case 2:
            printMENU5();
            break;
        case 3:
            printMENU6();
            break;
        }
        if (enter)
        {
            system("cls");
            if(o==3)
            {
                ok=0;
                gm=0;
                return;
            }
            else
            {
                if(o==1)//game mode activated: pvp
                {
                    printf("Player 1, enter your name: ");
                    scanf("%s", &player1);
                    printf("\nPlayer 2, enter your name: ");
                    scanf("%s", &player2);
                    gm=1;
                    break;
                }
                else //game mode activated:pve
                {
                    printf("Enter your name: ");
                    scanf("%s", &player1);
                    gm=2;
                    break;
                }
            }
        }
    }
}
void MENU()
{
    int c = 0, o=1, enter=0;
    player=1;
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    printMENU1();
    while(1)
    {
        c=0;
        switch((c=getch()))
        {
        case KEY_UP:
            if(o!=1) o--;
            break;
        case KEY_DOWN:
            if(o!=3) o++;
            break;
        case ENTER:
            enter=1;
            break;
        default:
            break;
        }
        system("cls");
        switch (o)
        {
        case 1:
            printMENU1();
            break;
        case 2:
            printMENU2();
            break;
        case 3:
            printMENU3();
            break;
        }
        if (enter)
        {
            system("cls");
            if(o==2)
            {
                printf("    REGULI\n    Jucatorii dau drumul la piese pe rand in unul din cele 7 sloturi, fiecare dintre ele putând contine pana la 6 piese. Castiga cine reuseste sa aiba 4 piese în linie pe verticala, orizontala sau in diagonala.\n");
                SetConsoleTextAttribute(hConsole, 95);
                printf("    BACK");
                SetConsoleTextAttribute(hConsole, 7);
                enter=0;
                while(c=getch()!=ENTER);
                system("cls");
                printMENU1();
                o=1;
            }
            else
            {
                if(o==3)
                {
                    esc=1;
                    return;
                }
                else //game mode activated
                {
                    MENUPV();
                    system("cls");
                    printMENU1(); //detele?
                    enter=0, o=1;
                    if(gm) break;
                }
            }
        }
    }
}
int test()
{
    int i, ii, j, jj, cnt=0, ok=1;
    for(i=7; i>=1; i--)
        for(j=1; j<=7; j++)
        {
            if(m[i][j]=='X')
            {
                ii=i, jj=j;
                for(ii=i-1; ii>=i-3 && ii>=1; ii--) //linie
                    if(m[ii][j]=='X') cnt++;
                    else break;
                if(cnt==3) return 1;
                cnt=0;
                for(ii=i-1, jj=j+1; ii>=i-3 && ii>=1 && jj<=j+3 && jj<=7; ii--, jj++) //diagonala 1
                    if(m[ii][jj]=='X') cnt++;
                    else break;
                if(cnt==3) return 1;
                cnt=0;
                for(ii=i-1, jj=j-1; ii>=i-3 && ii>=1 && jj>=j-3 && jj>=1; ii--, jj--) //diagonala 2
                    if(m[ii][jj]=='X') cnt++;
                    else break;
                if(cnt==3) return 1;
                cnt=0;
                for(jj=j+1; jj<=j+3 && jj<=7; jj++) //coloana
                    if(m[i][jj]=='X') cnt++;
                    else break;
                if(cnt==3) return 1;
                cnt=0;
                for(jj=j-1; jj>=j-3 && jj>=1; jj--) //coloana inversa - sterge pentru nivel mediu
                    if(m[i][jj]=='X') cnt++;
                    else break;
                if(cnt==3) return 1;
                cnt=0;
            }
            else ok=0;
        }
    cnt=0;
    for(i=7; i>=1; i--)
        for(j=1; j<=7; j++)
        {
            if(m[i][j]=='@')
            {
                ii=i, jj=j;
                for(ii=i-1; ii>=i-3 && ii>=1; ii--) //linie
                    if(m[ii][j]=='@') cnt++;
                    else break;
                if(cnt==3) return 2;
                cnt=0;
                for(ii=i-1, jj=j+1; ii>=i-3 && ii>=1 && jj<=j+3 && jj<=7; ii--, jj++) //diagonala
                    if(m[ii][jj]=='@') cnt++;
                    else break;
                if(cnt==3) return 2;
                cnt=0;
                for(ii=i-1, jj=j-1; ii>=i-3 && ii>=1 && jj>=j-3 && jj>=1; ii--, jj--) //diagonala inversa
                    if(m[ii][jj]=='@') cnt++;
                    else break;
                if(cnt==3) return 2;
                cnt=0;
                for(jj=j+1; jj<=j+3 && jj<=7; jj++) //coloana
                    if(m[i][jj]=='@') cnt++;
                    else break;
                if(cnt==3) return 2;
                cnt=0;
                for(jj=j-1; jj>=j-3 && jj>=1; jj--) //coloana inversa
                    if(m[i][jj]=='@') cnt++;
                    else break;
                if(cnt==3) return 2;
                cnt=0;
            }
            else ok=0;
        }
    if(ok==1) return 3;
    return 0;
}
void computer()
{
    int i, ii, j, jj, cnt=0, ok=1, MAX=0, indi, indj, vi[4]= {0, -1, -1, -1, 0}, vj[4]= {-1, -1, 0, 1, 1}, ki, stop=1;
    //hard mode
    for(i=7; i>=1 && stop; i--)
        for(j=1; j<=7 && stop; j++)
        {
            if(m[i][j]=='X')
            {
                for(ii=i-1; stop && ii>=i-2 && ii>=1; ii--) //linie
                    if(m[ii][j]=='X') cnt++;
                    else break;
                if(cnt==2 && ii>=1 && (ii==7 || m[ii+1][j]!='O') && stop && m[ii][j]=='O')
                {
                    m[ii][j]='@', stop=0;
                }
                cnt=0;
                for(ii=i-1, jj=j+1; stop && ii>=i-2 && ii>=1 && jj<=j+2 && jj<=7; ii--, jj++) //diagonala 1
                    if(m[ii][jj]=='X') cnt++;
                    else break;
                if(cnt==2 && ii>=1 && jj<=7 && stop && (ii==7 || m[ii+1][jj]!='O') && m[ii][jj]=='O')
                {
                    m[ii][jj]='@', stop=0;
                }
                cnt=0;
                for(ii=i-1, jj=j-1; stop && ii>=i-2 && ii>=1 && jj>=j-2 && jj>=1; ii--, jj--) //diagonala 2
                    if(m[ii][jj]=='X') cnt++;
                    else break;
                if(cnt==2 && stop && ii>=1 && jj>=1 && (ii==7 || m[ii+1][jj]!='O') && m[ii][jj]=='O')
                {
                    m[ii][jj]='@', stop=0;
                }
                cnt=0;
                for(jj=j+1; stop && jj<=j+2 && jj<=7; jj++) //coloana
                    if(m[i][jj]=='X') cnt++;
                    else break;
                if(cnt==2 && stop && jj<=7 && (i==7 || m[i+1][jj]!='O') && m[i][jj]=='O')
                {
                    m[i][jj]='@', stop=0;
                }
                cnt=0;
                for(jj=j-1; stop && jj>=j-2 && jj>=1; jj--) //coloana inversa
                    if(m[i][jj]=='X') cnt++;
                    else break;
                if(cnt==2 && stop && jj>=1 && (i==7 || m[i+1][jj]!='O') && m[i][jj]=='O')
                {
                    m[i][jj]='@', stop=0;
                }
                cnt=0;
            }
        }
    //hard mode end
    if(stop)
    {
        cnt=0;
        for(i=7; i>=1; i--)
            for(j=1; j<=7; j++)
                if(m[i][j]=='@')
                {
                    cnt=1;
                    for(ii=i-1; ii>=i-3 && ii>=1; ii--) //linie
                        if(m[ii][j]=='@') cnt++;
                        else break;
                    if(cnt>MAX && ii>=1 && m[ii][j]=='O' && (ii==7 || m[ii+1][j]!='O'))
                    {
                        MAX=cnt, indi=ii, indj=j;
                    }
                    cnt=1;
                    for(jj=j+1; jj<=j+3 && jj<=7; jj++) //coloana
                        if(m[i][jj]=='@') cnt++;
                        else break;
                    if(cnt>MAX && jj<=7 && m[i][jj]=='O' && (i==7 || m[i+1][jj]!='O'))
                    {
                        MAX=cnt, indi=i, indj=jj;
                    }
                    cnt=1;
                    for(jj=j-1; jj>=j-3 && jj>=1; jj--) //coloana inversa
                        if(m[i][jj]=='@') cnt++;
                        else break;
                    if(cnt>MAX && jj>=1 && m[i][jj]=='O' && (i==7 || m[i+1][jj]!='O'))
                    {
                        MAX=cnt, indi=i, indj=jj;
                    }
                    cnt=1;
                    for(ii=i-1, jj=j+1; ii>=i-3 && ii>=1 && jj<=j+3 && jj<=7; ii--, jj++) //diagonala 1
                        if(m[ii][jj]=='@') cnt++;
                        else break;
                    if(cnt>MAX && ii>=1 && jj<=7 && m[ii][jj]=='O' && (ii==7 || m[ii+1][jj]!='O'))
                    {
                        MAX=cnt, indi=ii, indj=jj;
                    }
                    cnt=1;
                    for(ii=i-1, jj=j-1; ii>=i-3 && ii>=1 && jj>=j-3 && jj>=1; ii--, jj--) //diagonala 2
                        if(m[ii][jj]=='@') cnt++;
                        else break;
                    if(cnt>MAX && ii>=1 && jj<=7 && m[ii][jj]=='O' && (ii==7 || m[ii+1][jj]!='O'))
                    {
                        MAX=cnt, indi=ii, indj=jj;
                    }
                    cnt=1;
                }
        if(!MAX)
        {
            for(i=7; i>=1; i--)
                for(j=1; j<=7; j++)
                    if(m[i][j]=='O' && (i==7 || m[i+1][j]!='O'))
                    {
                        m[i][j]='@';
                        j=8, i=0;
                    }
        }
        else m[indi][indj]='@';
    }
}
int main ()
{
    HANDLE hConsole;
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    int i, j, r, enter, swi=1;
    for(i=1; i<=7; i++)
        for(j=1; j<=7; j++)
            m[i][j]='O';

    MENU();
    if(gm==2) strcpy(player2, "Computer");
    if(esc) return 0;
    system("cls");
    print();
    int c=0;
    player=1;
    if(gm==1) printf("\n\t%s's turn", player1);
    while(1)
    {
        enter=0;
        switch((c=getch()))
        {
        case KEY_LEFT:
            if(col>1) col--;
            break;
        case KEY_RIGHT:
            if(col<7) col++;
            break;
        case ESC:
            for(i=1; i<=7; i++)
                for(j=1; j<=7; j++)
                    m[i][j]='O';
            system("cls");
            int gmc=gm;
            MENU();
            if(gm!=gmc) {scor1=0, scor2=0;}
            if(gm==2) strcpy(player2, "Computer");
            if(esc) return 0;
            break;
        case ENTER:
            swi=0;
            for(i=7; i>=1; i--)
                if(m[i][col]=='O')
                {
                    if(player==1) m[i][col]='X';
                    else m[i][col]='@';
                    swi=1;
                    break;
                }
            r=test();
            if(gm==2)
            {
                if(r==1)
                {
                    system("cls");
                    print();
                    printf("\a\n\tCongratulations, %s, you WON!\n", player1);
                    scor1++;
                    player=1;
                    SetConsoleTextAttribute(hConsole, 95);
                    printf("\n\t    RETRY    \n");
                    SetConsoleTextAttribute(hConsole, 7);
                    c=getch();
                    while(c!=ENTER && c!=ESC) c=getch();
                    if(c==ENTER)
                    {
                        for(i=1; i<=7; i++)
                            for(j=1; j<=7; j++)
                                m[i][j]='O';
                        system("cls");
                        print();
                        r=3;
                    }
                    else return 0;
                }
                else
                {
                    if(r==2)
                    {
                        system("cls");
                        print();
                        printf("\a\n\tGAME OVER\n");
                        scor2++;
                        player=1;
                        SetConsoleTextAttribute(hConsole, 95);
                        printf("\n\t    RETRY    \n");
                        SetConsoleTextAttribute(hConsole, 7);
                        c=getch();
                        while(c!=ENTER && c!=ESC) c=getch();
                        if(c==ENTER)
                        {
                            for(i=1; i<=7; i++)
                                for(j=1; j<=7; j++)
                                    m[i][j]='O';
                        }
                        else return 0;
                    }
                    else
                    {
                        computer();
                        r=test();
                        if(r==2)
                        {
                            system("cls");
                            print();
                            printf("\a\n\tGAME OVER\n");
                            scor2++;
                            player=1;
                            SetConsoleTextAttribute(hConsole, 95);
                            printf("\n\t    RETRY    \n");
                            SetConsoleTextAttribute(hConsole, 7);
                            c=getch();
                            while(c!=ENTER && c!=ESC) c=getch();
                            if(c==ENTER)
                            {
                                for(i=1; i<=7; i++)
                                    for(j=1; j<=7; j++)
                                        m[i][j]='O';
                            }
                            else return 0;
                        }
                    }

                }
            }
            enter=1;
            break;
        default:
            break;
        }
        system("cls");
        print();
        r=test();
        if(gm==1)
        {
            if(r==1)
            {
                printf("\a\n\tCongratulations, %s, you WON!\n", player1);
                scor1++;
                player=1;
                SetConsoleTextAttribute(hConsole, 95);
                printf("\n\t    RETRY    \n");
                SetConsoleTextAttribute(hConsole, 7);
                c=getch();
                while(c!=ENTER && c!=ESC) c=getch();
                if(c==ENTER)
                {
                    for(i=1; i<=7; i++)
                        for(j=1; j<=7; j++)
                            m[i][j]='O';
                    system("cls");
                    print();
                }
                else return 0;
            }
            else
            {
                if(r==2)
                {
                    printf("\a\n\tCongratulations, %s, you WON!\n", player2);
                    scor2++;
                    player=1;
                    SetConsoleTextAttribute(hConsole, 95);
                    printf("\n\t    RETRY    \n");
                    SetConsoleTextAttribute(hConsole, 7);
                    c=getch();
                    while(c!=ENTER && c!=ESC) c=getch();
                    if(c==ENTER)
                    {
                        for(i=1; i<=7; i++)
                            for(j=1; j<=7; j++)
                                m[i][j]='O';
                        system("cls");
                        print();
                    }
                    else return 0;
                }
                else if(r==3)
                {
                    printf("\a\n\tIt's a draw!\n");
                    player=1;
                    SetConsoleTextAttribute(hConsole, 95);
                    printf("\n\t    RETRY    \n");
                    SetConsoleTextAttribute(hConsole, 7);
                    c=getch();
                    while(c!=ENTER && c!=ESC) c=getch();
                    if(c==ENTER)
                    {
                        for(i=1; i<=7; i++)
                            for(j=1; j<=7; j++)
                                m[i][j]='O';
                        system("cls");
                        print();
                    }
                    else return 0;
                }
            }
        }
        if(gm==1)
        {
            if(enter==1 && swi)
            {

                if(player==1) player=2;
                else player=1;
                if(player==2) printf("\n\t%s's turn", player2);
                else printf("\n\t%s's turn", player1);
            }
            else
            {

                if(player==2) printf("\n\t%s's turn", player2);
                else printf("\n\t%s's turn", player1);
            }
        }
    }

    return 0;
}
