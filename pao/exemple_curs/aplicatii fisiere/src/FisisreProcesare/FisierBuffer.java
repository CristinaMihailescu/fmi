
package FisisreProcesare;

import java.io.FileReader;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
public class FisierBuffer {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        BufferedReader fin = new BufferedReader(new FileReader("text.txt"));
        String linie;
        
        while((linie=fin.readLine())!=null)
        {
            String tab[]=linie.split(" ");
            System.out.println(tab.length);
        }
        }
    }
    

