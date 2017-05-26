package serializare_obiecte;

import student.Student;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class Serializare_obiecte
{
    public static void main(String[] args)
    {
        Student s[] = new Student[5];
        
        Student.facultate =  "Facultatea de Matematica si Informatica";
                
//        s[0] = new Student("Ion Popescu" , 241 , new int[]{10, 9, 10, 7, 8},"Facultatea de Matematica si Informatica");
//        s[1] = new Student("Anca Pop" , 242 , new int[]{9, 10, 10, 8},"Facultatea de Matematica si Informatica");
//        s[2] = new Student("Mihai Creanga" , 241 , new int[]{8, 10, 8},"Facultatea de Matematica si Informatica");
//        s[3] = new Student("Adrian Georgescu" , 243 , new int[]{9, 9, 10, 8},"Facultatea de Matematica si Informatica");
//        s[4] = new Student("Ioana Toma" , 242 , new int[]{10, 9, 10},"Facultatea de Matematica si Informatica");
        
        s[0] = new Student("Ion Popescu" , 241 , new int[]{10, 9, 10, 7, 8});
        s[1] = new Student("Anca Pop" , 242 , new int[]{9, 10, 10, 8});
        s[2] = new Student("Mihai Creanga" , 241 , new int[]{8, 10, 8});
        s[3] = new Student("Adrian Georgescu" , 243 , new int[]{9, 9, 10, 8});
        s[4] = new Student("Ioana Toma" , 242 , new int[]{10, 9, 10});
        
        try        
        {
           ObjectOutputStream fout = 
                   new ObjectOutputStream(new FileOutputStream("studenti.ser"));
           
           fout.writeObject(s);
        } 
        catch (IOException ex)
        {
            System.out.println(ex);
        }
    }
}
