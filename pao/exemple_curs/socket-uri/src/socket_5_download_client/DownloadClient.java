package socket_5_download_client;

import java.awt.Desktop;
import java.io.*;
import java.net.*;
import java.util.*;

public class DownloadClient
{

    public static void main(String[] sir) throws IOException
    {
        Scanner sc = new Scanner(System.in);

        System.out.print("Adresa server: ");
        String adresa = sc.next();
        System.out.print("Port server: ");
        int port = sc.nextInt();
        sc.nextLine();

        Socket cs = null;
        try
        {
            cs = new Socket(adresa, port);
        }
        catch (Exception e)
        {
            System.out.println("Conectare esuata la server!");
            System.exit(0);
        }

        InputStream is = cs.getInputStream();
        DataOutputStream dos = new DataOutputStream(cs.getOutputStream());

        System.out.print("Fisier cerut: ");
        String fisier = sc.next();
		
		//clientul ii transmite server-ului numele fisierului pe care doreste sa-l descarce
        dos.writeUTF(fisier);

        int c = is.read();
		//daca server-ul transmite un mesaj care incepe cu 0 inseamna ca server-ul nu a gasit fisierul cerut
        if (c == 0)
        {
            System.out.println("Fisier inexistent!");
            System.exit(0);
        }

		//fisierul a fost gasit pe server si clientul il transfera octet cu octet
        OutputStream fos = new FileOutputStream(fisier);
        while ((c = is.read()) != -1)
        {
            System.out.print("" + (char) c);
            fos.write(c);
        }

        System.out.println("\nFisier primit!");

        try
        {
            Desktop.getDesktop().open(new File(fisier));
        }
        catch (IOException ex)
        {
            System.out.println("Eroare la deschiderea fisierului!");
        }

        fos.close();
        is.close();
        dos.close();
        cs.close();
    }
}
