package socket_1_url;

import java.net.*;

public class URL_1
{

    public static void main(String[] args)
    {
        try
        {
            URL url = new URL("http://fmi.unibuc.ro/ro/informatii/");

            System.out.println("Protocol: " + url.getProtocol());
            System.out.println("Authority: " + url.getAuthority());
            System.out.println("File name: " + url.getFile());
            System.out.println("Host: " + url.getHost());
            System.out.println("Path: " + url.getPath());
            System.out.println("Port: " + url.getPort());
            System.out.println("Default port: " + url.getDefaultPort());
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }
}
