package socket_3_chat_server;

import java.net.*;
import java.io.*;
import java.util.*;

public class ChatServer
{
    public static void main(String[] sir) throws IOException
    {
        ServerSocket ss = null;
        Socket cs = null;
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Portul: ");
        
        //instantiem server-ul
        int port = sc.nextInt();
        ss = new ServerSocket(port);
        //sc.nextLine();
        
        System.out.println("Serverul a pornit!");
		
	//server-ul asteapta un client sa se conecteze
        cs = ss.accept();
        
        System.out.println("Un client s-a conectat la server!");
        
	//server-ul preia fluxurile de la/catre client
        DataInputStream dis = new DataInputStream(cs.getInputStream());
        DataOutputStream dos = new DataOutputStream(cs.getOutputStream());

        //citim linia de text transmisa de catre client si o afisam, 
        //dupa care citim o linie si o transmitem clientului
        //chat-ul se inchide cand clientul transmite cuvantul STOP
        while(true)
        {
            String linie = dis.readUTF();
            
            System.out.println("Mesaj receptionat: " + linie);
            
            if (linie.equals("STOP"))
                break;

            System.out.print("Mesaj de trimis: ");
            linie = sc.nextLine();
            dos.writeUTF(linie);
        }
        
        dis.close();
        dos.close();
        cs.close();
        ss.close();
    }
}
