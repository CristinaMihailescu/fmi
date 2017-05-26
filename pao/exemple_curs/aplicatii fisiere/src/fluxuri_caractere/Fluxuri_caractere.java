package fluxuri_caractere;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Fluxuri_caractere
{
    public static void main(String[] args)
    {
        try(FileReader fin = new FileReader("test.txt");
            FileWriter fout = new FileWriter("copie_caractere.txt");)
        {
            int c;
            while((c = fin.read()) != -1)
                fout.write(c);
            
        } catch (FileNotFoundException ex)
        {
           System.out.println("Fisier de intrare inexistent!");
        } catch (IOException ex)
        {
            System.out.println("Eroare la scrierea in fisier!");
        }
    }
}
