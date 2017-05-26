package fluxuri_octeti;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Fluxuri_octeti
{
    public static void main(String[] args)
    {
        try(FileInputStream fin = new FileInputStream("test.txt");
            FileOutputStream fout = new FileOutputStream("copie_octeti.txt"))
        {
            int dimFisier = fin.available();
            byte []buffer = new byte[dimFisier];
            
            fin.read(buffer);
            
            fout.write(buffer);
            
        } catch (FileNotFoundException ex)
        {
           System.out.println("Fisier de intrare inexistent!");
        } catch (IOException ex)
        {
            System.out.println("Eroare la scrierea in fisier!");
        }
    }
}

