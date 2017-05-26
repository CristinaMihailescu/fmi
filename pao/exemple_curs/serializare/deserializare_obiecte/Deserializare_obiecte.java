package deserializare_obiecte;

import student.Student;
import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class Deserializare_obiecte
{
    public static void main(String[] args)
    {
        Student s[];
        
        try        
        {
            ObjectInputStream fin = new ObjectInputStream(new FileInputStream("studenti.ser"));
                    
            s = (Student [])fin.readObject();
           
            for (int i = 0; i < s.length; i++)
            {
                s[i].calculeazaMedie();
                System.out.println(s[i]);
                s[i].testMetodaPrivate();
            }
        } 
        catch (Exception ex)
        {
            System.out.println(ex);
        } 
    }
}
