package stiva;

public class StivaTablou implements Stiva
{
    private Object[] stiva;
    private int varf;

    public StivaTablou(int dim_max) 
    {
        stiva = new Object[dim_max];
        varf = -1;
    }

    @Override
    public void push(Object x) throws ExceptieStiva 
    {
        if (varf == stiva.length - 1) 
            throw new ExceptieStiva("Nu pot sa adaug un element intr-o stiva plina!");
            
        
        stiva[++varf] = x;
    }

    @Override
    public Object pop() throws ExceptieStiva
    {
        if (varf == -1) 
            throw new ExceptieStiva("Nu pot sa extrag un element dintr-o stiva vida!");
        
        Object aux = stiva[varf];
        stiva[varf--] = null;
        return aux;
    }

    @Override
    public Object peek() throws ExceptieStiva
    {
        if (varf == -1) 
            throw new ExceptieStiva("Nu pot sa accesez elementul din varful unei stive vide!");
        
        return stiva[varf];
    }

    @Override
    public boolean esteVida() 
    {
        return varf == -1;
    }

    @Override
    public int nrElemente() 
    {
        return varf + 1;
    }

    @Override
    public void afisareStiva() throws ExceptieStiva
    {
        if (varf == -1) 
            throw new ExceptieStiva("Nu pot sa afisez o stiva vida!");

        System.out.print("Stiva: ");
        for(int i = varf; i >= 0; i--)
            System.out.print(stiva[i] + " ");
        System.out.println();
    }
}
