
package FisisreProcesare;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;


public class FisierFormatare {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        DataOutputStream fout = new DataOutputStream(new FileOutputStream("date.in"));
        int x=13;
        String sir= "Java";
        fout.writeInt(x);
        fout.writeUTF(sir);
        
        DataInputStream fin = new DataInputStream(new FileInputStream("date.in"));
        int citireint = fin.readInt();
        String citiresir=fin.readUTF();
        System.out.println(citireint+" "+citiresir);
    }
    
}
