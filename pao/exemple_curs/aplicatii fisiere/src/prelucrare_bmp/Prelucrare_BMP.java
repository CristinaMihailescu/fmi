package prelucrare_bmp;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

public class Prelucrare_BMP
{
    public static void main(String[] args) throws FileNotFoundException, IOException
    {
        String img = "baboon";
        
        FileInputStream fin = new FileInputStream(img + ".bmp");
       
        FileOutputStream fout_1 = new FileOutputStream(img + "_1.bmp");
        
        FileOutputStream fout_2 = new FileOutputStream(img + "_2.bmp");
 
        byte[] header = new byte[54];
        
        fin.read(header);
        
        fout_1.write(header);
        fout_2.write(header);
        
      Random r = new Random(100);
        
        int octet;
        
        while((octet = fin.read()) != -1)
        {
            fout_1.write(255-octet);
         
            fout_2.write(octet ^ r.nextInt());
        }
        
        
        fin.close();
        
        fout_1.close();
        fout_2.close();
     
    }
}
