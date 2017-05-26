package socket_4_multichat_client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class MultichatClient
{

    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.print("Adresa server: ");
        String adresaServer = sc.nextLine();
        System.out.print("Port server: ");
        int portServer = sc.nextInt();
        sc.nextLine();
        
        //clientul incearca sa se conecteze la server
        BufferedReader in;
        PrintWriter out;
        try
        {
            Socket socket = new Socket(adresaServer, portServer);

            in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            out = new PrintWriter(socket.getOutputStream() , true);

            while(true)
            {
                //clientul citeste mesajul de la server
				String mesajServer = in.readLine();

				//clientul citeste de la tastatura si transmite server-ului un nume de utilizator 
				//pana cand numele transmis este diferit de numele tuturor utilizatorilor conectati in acel moment
                if (mesajServer.startsWith("Nume utilizator?"))
                {
                    System.out.print("Nume utilizator: ");
                    String nume = sc.nextLine();
                    out.println(nume);
                }
                //server-ul ii transmite clientului faptul ca numele de utilizator a fost acceptat
				else if (mesajServer.startsWith("Nume acceptat!"))
                {
                    System.out.println("Conectare reusita la server!");
                    break;
                }
            }
			
			//comunicarea cu server-ul (la fel ca in cazul chat-ului simplu)
            while (true)
            {
                System.out.print("Mesaj: ");
                String mesajClient = sc.nextLine();
                out.println(mesajClient);

                if (mesajClient.startsWith("STOP"))
                    break;

                String mesajServer = in.readLine();
                System.out.println(mesajServer);
            }
        }
        catch (IOException ex)
        {
            System.out.println("Conectarea esuata la server: " + ex);
        }
    }
}
