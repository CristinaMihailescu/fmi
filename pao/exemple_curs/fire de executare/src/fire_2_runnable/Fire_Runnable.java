package fire_2_runnable;

class FirDeExecutare implements Runnable
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

public class Fire_Runnable
{
    public static void main(String[] args) throws InterruptedException
    {

        Thread fir_1 = new Thread(new FirDeExecutare('1'));
        Thread fir_2 = new Thread(new FirDeExecutare('2'));
        
        fir_1.start();
        fir_2.start();
        
        fir_1.join();
        fir_1.join();
        
        for(int i = 0; i < 100; i++)
            System.out.print("0 ");
    }
}
