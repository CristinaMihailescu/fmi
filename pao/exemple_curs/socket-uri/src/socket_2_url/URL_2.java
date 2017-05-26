package socket_2_url;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Scanner;

public class URL_2
{

    public static void main(String[] args)
    {
        Scanner pin = null;
        PrintWriter pout = null;

        try
        {
            //deschidem un flux pe baza continutului HTML al paginii	
            URL pagina = new URL("http://fmi.unibuc.ro");

            pin = new Scanner(pagina.openStream());

            pout = new PrintWriter("test.html");
			
                    //copiem continutul fiserului HTML linie cu linie in fisierul local "test.html"
            while (pin.hasNextLine())
            {
                String linie = pin.nextLine();
                //System.out.println(linie);
                pout.println(linie);
            }
        }
        catch (IOException ex)
        {
            System.out.println("Continutul paginii nu poate fi preluat: " + ex);
        }
        finally
        {
            if (pin != null)
                pin.close();

            if (pout != null)
                pout.close();

            File html = new File("test.html");
            try
            {
                //afisam copia locala a paginii folosind browser-ul implicit
		Desktop.getDesktop().browse(html.toURI());
            }
            catch (IOException ex)
            {
                System.out.println("Eroare la deschiderea paginii in browser!");
            }
        }
    }
}
