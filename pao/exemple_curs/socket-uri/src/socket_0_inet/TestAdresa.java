package socket_0_inet;

import java.net.*;

public class TestAdresa
{

    public static void main(String[] args)
    {
        try
        {
            InetAddress ip = InetAddress.getByName("fmi.unibuc.ro");
//            InetAddress ip = InetAddress.getByName("193.226.51.6");
//            InetAddress ip = InetAddress.getByAddress(new byte[]{(byte)193,(byte)226,(byte)51,(byte)6});
                        
            System.out.println("Host: " + ip.getHostName());
            System.out.println("IP: " + ip.getHostAddress());
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }
}
