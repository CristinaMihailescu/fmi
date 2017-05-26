package student;

import java.io.Serializable;
import java.util.Arrays;

public class Student implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    public static String facultate;
//    public String facultate;
    
    private String nume;
    int grupa , note[];
    //transient double medie;
    double medie;
    
    boolean promovat;

//    public Student(String nume , int grupa , int note[], String facultate ) 
    public Student(String nume , int grupa , int note[]) 
    {
        this.nume = nume;
//        this.facultate = facultate;
        this.grupa = grupa;
        
        this.note = Arrays.copyOf(note, note.length);
               
        calculeazaMedie();
    }
    
    private void metodaPrivate()
    {
        System.out.println("Metoda private!");
    }
    
    public void testMetodaPrivate()
    {
        metodaPrivate();
    }
    
    public final void calculeazaMedie()
    {
        double aux = 0;
        int n = note.length;
        
        for(int i = 0; i < n; i++)
            aux = aux + note[i];
        
        medie = aux / n *1000;
    }
        
    @Override
    public String toString()
    {
        return nume + "," + facultate + "," + grupa + "," + medie;
    }
}

