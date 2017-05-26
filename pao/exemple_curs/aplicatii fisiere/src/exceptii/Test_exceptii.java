package exceptii;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Test_exceptii
{

    public static void main(String[] args)
    {
        int a, b;
        
        Scanner f = null;

       try{
            f = new Scanner(new File("numere.txt"));

            a = f.nextInt();
            b = f.nextInt();
            
            double r;
            r = a / b;
           
            System.out.println(r);
        } catch (FileNotFoundException e)
        {
            System.out.println("Fisier inexistent");
        }
       
        catch(ArithmeticException e)
        {
            System.out.println("Impartire la 0");
        }
       
    catch(InputMismatchException e)
    {
        System.out.println("Format incorect!!!");
    }
        
       
              
        finally
        {
            try
            {
                f.close();
            } catch (Exception ob)
            {
                System.out.println("Nu se poate inchide!");
            }
            System.out.println("Bloc finally");
        }

        a = 3;
        b = 5;
        System.out.println("Suma = " + (a + b));
        System.out.println("The end");
    
                }
}
