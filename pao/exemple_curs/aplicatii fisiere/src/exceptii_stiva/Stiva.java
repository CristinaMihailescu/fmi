package stiva;

public interface Stiva
{
    void push(Object item) throws ExceptieStiva;
    Object pop() throws ExceptieStiva;
    Object peek() throws ExceptieStiva;
    int nrElemente();
    boolean esteVida();
    void afisareStiva() throws ExceptieStiva;
}
