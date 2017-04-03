void main(void)
{
    int c;
    do
    {
        /* şi EOF e !isdigit, atentie la ciclu infinit! */
        while (!isdigit(c = getchar()))
            if (c == EOF) return;      /* aici, c e sigur o cifra; repeta cat timp e cifra */
        do putchar(c);
        while (isdigit(c = getchar()));
        putchar('\n'); /* gata cifrele, c e altceva, poate EOF */
    }
    while (c != EOF);
}

/*Mai simplu:
când vedem o cifră, citim şi tipărim cât timp e cifră*/
void main(void)
{
    int c;
    while ((c = getchar()) != EOF)
        if (isdigit(c))
        {
            /* prima cifra; continua cu restul */
            do putchar(c);
            while (isdigit(c = getchar()));
            putchar('\n'); /* gata grupul de cifre */
        } /* daca nu e cifra, nu trebuie facut nimic */
}
