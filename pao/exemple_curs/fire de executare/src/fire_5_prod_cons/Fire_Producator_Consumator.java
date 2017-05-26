package fire_5_prod_cons;

import java.util.LinkedList;

class BandaRulanta
{
    private LinkedList<Integer> banda;
    private int dimMaximaBanda;

    public BandaRulanta(int dimMaximaBanda)
    {
        banda = new LinkedList();
        this.dimMaximaBanda = dimMaximaBanda;
    }

    public synchronized void PreiaObiect() throws InterruptedException
    {
        while (banda.size() == 0)
            wait();
        
        int x = banda.remove(0);
        System.out.println("Consumator: " + x);
        notifyAll();
//        notify();
    }

    public synchronized void PuneObiect(int x) throws InterruptedException
    {
        while (banda.size() == dimMaximaBanda)
            wait();
        
        banda.add(x);
        System.out.println("Producator: " + x);
        notifyAll();
//        notify();
    }
}

class Producator extends Thread
{
    private BandaRulanta banda;

    public Producator(BandaRulanta banda)
    {
        this.banda = banda;
    }

    @Override
    public void run()
    {
        for (int i = 1; i <= 10; i++)
            try
            {
                Thread.sleep((int) (Math.random() * 100));
                banda.PuneObiect(i);
            } 
            catch (InterruptedException e){}
    }
}

class Consumator extends Thread
{
    private BandaRulanta banda;

    public Consumator(BandaRulanta banda)
    {
        this.banda = banda;
    }

    @Override
    public void run()
    {
        for (int i = 1; i <= 10; i++)
            try
            {
                Thread.sleep((int) (Math.random() * 100));
                banda.PreiaObiect();
            } 
            catch (InterruptedException ex){}
    }
}

public class Fire_Producator_Consumator
{
    public static void main(String[] args)
    {
        BandaRulanta b = new BandaRulanta(5);
        
        Producator p = new Producator(b);
        Consumator c = new Consumator(b);
        
        p.start();
        c.start();
    }
}
