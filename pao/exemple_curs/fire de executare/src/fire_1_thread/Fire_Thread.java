package fire_1_thread;

class FirDeExecutare extends Thread
{
    char c;

    public FirDeExecutare(char c)
    {
        this.c = c;
    }

    @Override
    public void run()
    {
        for(int i = 0; i < 100; i++)
            System.out.print(c + " ");
    }
}

public class Fire_Thread
{
    public static void main(String[] args)
    {
        FirDeExecutare fir_1 = new FirDeExecutare('1');
        FirDeExecutare fir_2 = new FirDeExecutare('2');
        
        fir_1.start();
        fir_2.start();
        
        //fir_1.run();
        //fir_2.run();
        
        try
        {
            fir_1.join();
            fir_2.join();
        } 
        catch (InterruptedException ex)
        {
            System.out.println("Eroare fire de executare!");
        }
 
        for(int i = 0; i < 100; i++)
            System.out.print("0 ");
    }
}
