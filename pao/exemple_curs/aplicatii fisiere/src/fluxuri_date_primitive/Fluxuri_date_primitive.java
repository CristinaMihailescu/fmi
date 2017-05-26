package fluxuri_date_primitive;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Fluxuri_date_primitive
{
    public static void main(String[] args)
    {
        try(DataOutputStream fout = new DataOutputStream(new FileOutputStream("numere.bin"));)
        {
            double v[] = {1.5 , 2.6 , 3.7 , 4.8 , 5.9};
           
            fout.writeInt(v.length);
            
            for(int i = 0; i < v.length; i++)
                fout.writeDouble(v[i]);
            
        } 
        catch (IOException ex)
        {
            System.out.println("Eroare la scrierea in fisier!");
        }
        
        try(DataInputStream fin = new DataInputStream(new FileInputStream("numere.bin"));)
        {
            int n = fin.readInt();
            double []v = new double[n];
            
            for(int i = 0; i < v.length; i++)
                v[i] = fin.readDouble();
            
            for(int i = 0; i < v.length; i++)
                System.out.print(v[i] + " ");
        } 
        catch (IOException ex)
        {
            System.out.println("Eroare la citirea din fisier!");
        }
    }
}

