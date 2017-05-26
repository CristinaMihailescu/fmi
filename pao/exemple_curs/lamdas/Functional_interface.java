package Functional_interface;

//interfata functionala corespunzatoare unei functii

@FunctionalInterface
interface FunctieGenerica
{
    double functie(double x);
}

//clasa in care implementam mecanismul de callback pentru a calcula o suma
class Suma
{
    private Suma()
    {
    }
        
    public static double CalculeazaSuma(FunctieGenerica fg , int n)
    {
        double s = 0;
        
        for(int i = 1; i <= n; i++)
            s = s + fg.functie(i);
            
        return s;
    }
}

public class Functional_interface
{
    public static void main(String[] args)
    {
        System.out.println("Suma 1: " + Suma.CalculeazaSuma(x -> x , 10));
        
        System.out.println("Suma 2: " + Suma.CalculeazaSuma(x -> 1/x , 10));
        
        System.out.println("Suma 3: " + Suma.CalculeazaSuma(x -> Math.tan(x) , 10));
        
        System.out.println("Suma 4: " + Suma.CalculeazaSuma(Math::sin , 10));
    }
}

