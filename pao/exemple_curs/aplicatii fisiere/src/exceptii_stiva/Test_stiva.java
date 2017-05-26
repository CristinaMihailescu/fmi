package stiva;

import java.util.Random;

public class Test_stiva
{
    public static void main(String[] args)
    {
        StivaTablou st = new StivaTablou(5);
        
        Random rnd = new Random();
        
        for(int i = 0; i < 20; i++)
            try
            {
                int aux = rnd.nextInt();

                if(aux % 2 == 0)
                    st.push(1 + rnd.nextInt(100));
                else
                    st.pop();
                
                st.afisareStiva();
            }
            catch(ExceptieStiva ex)
            {
                System.out.println(ex.getMessage());
            }
    }
}
