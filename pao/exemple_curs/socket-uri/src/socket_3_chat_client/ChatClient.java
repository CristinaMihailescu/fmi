package socket_3_chat_client;

import java.net.*;
import java.io.*;
import java.util.*;

public class ChatClient
{
    public static void main(String[] sir) throws IOException
    {
        Scanner sc = new Scanner(System.in);
        System.out.print("Adresa serverului: ");
        String adresa = sc.next();
        System.out.print("Portul serverului: ");
        int port = sc.nextInt();
        sc.nextLine();
		
	//conectarea la server
        Socket cs = new Socket(adresa, port);
        System.out.println("Conectare reusita la server!");
		
	//preluam fluxurile de intrare/iesire de la/catre server
        DataInputStream dis = new DataInputStream(cs.getInputStream());
        DataOutputStream dos = new DataOutputStream(cs.getOutputStream());

        //citim o linie de text de la tastatura si o transmitem server-ului, 
        //dupa care asteptam raspunsul server-ului
        //chat-ul se inchide tastand cuvantul STOP
        while(true)
        {
            System.out.print("Mesaj de trimis: ");
            String linie = sc.nextLine();
            dos.writeUTF(linie);
            
            if (linie.equals("STOP"))
                break;
            
            linie = dis.readUTF();
            System.out.println("Mesaj receptionat: " + linie);
        }
        
        cs.close();
        dis.close();
        dos.close();
    }
}
