package socket_5_download_server;

import java.io.*;
import java.net.*;
import java.util.*;

//clasa care gestioneaza conexiunea cu un client pe un fir de executare separat
class Conexiune extends Thread
{

    Socket cs = null;
    OutputStream os = null;
    DataInputStream dis = null;

    public Conexiune(Socket client) throws IOException
    {
        cs = client;
        dis = new DataInputStream(cs.getInputStream());
        os = cs.getOutputStream();
    }

    @Override
    public void run()
    {
        String fisier = null;
        try
        {
            fisier = dis.readUTF();
            System.out.println(fisier);
        }
        catch (IOException ex)
        {
            System.out.println("Eroare: " + ex);
        }

	int c = 1;
        FileInputStream f = null;
        try
        {
            //am considerat faptul ca server-ul pastreaza fisierele pe care le pot descarca clientii
            //in directorul C:\\fisiere
            f = new FileInputStream("c:\\fisiere\\" + fisier);
        }
        catch (FileNotFoundException ex)
        {
            //daca fisierul cerut de client nu se gaseste in directorul respectiv, 
            //server-ul va transmite mesajul 0
            c = 0;
        }

        try
        {
            os.write(c);

            if (c == 0)
                System.out.println("Fisier inexistent!");
            else
            {
                //fisierul exista si server-ul il transfera octet cu octet clientului
		while ((c = f.read()) != -1)
                {
                    os.write(c);
                }
                f.close();
                System.out.println("Fisier transmis!");
            }

            cs.close();
            dis.close();
            os.close();
        }
        catch (IOException ex)
        {
            System.out.println("Eroare: " + ex);
        }
    }
}

public class DownloadServer
{

    public static void main(String[] arg) throws IOException
    {
        Scanner sc = new Scanner(System.in);

        System.out.print("Port: ");
        ServerSocket ss = new ServerSocket(sc.nextInt());

        System.out.println("Serverul a pornit!");
        //pentru fiecare client care se conecteaza server-ul creeaza un fir de executare separat
	while (true)
        {
            Socket cs = ss.accept();
            System.out.print("Client nou. Fisier cerut: ");
            new Conexiune(cs).start();
        }
    }
}
