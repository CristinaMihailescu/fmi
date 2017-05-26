package fire_3_runnable_lambda;

public class Fire_Runnable_Lambda
{
    public static void main(String[] args) throws InterruptedException
    {
        Runnable r1 = () -> {for(int i = 0; i < 100; i++) System.out.print("1 ");};
        Thread fir_1 = new Thread(r1);
        
        Thread fir_2 = new Thread(() -> {for(int i = 0; i < 100; i++) System.out.print("2 ");});
         
        fir_1.start();
        fir_2.start();

        //trebuie join
        
        for(int i = 0; i < 100; i++)
            System.out.print("0 ");
    }
}
