package serializare_lista;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

class Nod implements Serializable
{
    Object data;
    Nod next;

    public Nod(Object data)
    {
        this.data = data;
        this.next = null;
    }
 }

public class Serializare_deserializare_lista
{
    public static void main(String[] args)
    {
        Nod prim , ultim;
        
        prim = ultim = null;
        
        for(int i = 1; i <= 10; i++)
        {
            Nod aux = new Nod(i);
            
            if(prim == null)
                prim = ultim = aux;
            else
            {
                ultim.next = aux;
                ultim = aux;
            }
        }
        
        //pentru lista circulara
        ultim.next = prim;
        
        System.out.println("Lista serializata:");
        Nod aux = prim;
        
        //pentru lista circulara
        //do
        
        while(aux != null)
        {
            System.out.print(aux.data + " ");
            aux = aux.next;
        }
        
        //pentru lista circulara
        //while(aux != prim);
        
        try(ObjectOutputStream fout = new ObjectOutputStream(new FileOutputStream("lista.ser")))
        {
           fout.writeObject(prim);
        } 
        catch (IOException ex)
        {
            System.out.println(ex);
        }
        
        try(ObjectInputStream fin = new ObjectInputStream(new FileInputStream("lista.ser")))
        {
           Nod prim_nou = (Nod)fin.readObject();
           
           System.out.println("\nLista deserializata:");
           aux = prim_nou;
           while(aux != null)
           {
               System.out.print(aux.data + " ");
               aux = aux.next;
           }
           System.out.println();
        } 
        catch (Exception ex)
        {
            System.out.println(ex);
        } 
    }
}
