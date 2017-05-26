package SectiuneCritica;

class NumarPar{
    private int i=0;
    public /*synchronized*/ void next()
    { 
        i++;
        i++;	
    }
    public /*synchronized*/ int get()
    { 
        return i;
    } 
}

public class SectiuneCritica {
    public static void main(String[] a){
         NumarPar ob = new NumarPar();
        
        Runnable r = new Runnable()
        { 
            public void run()
            { while(true)
            {
                 int i;
               synchronized(ob)
               {
                 ob.next();
                 i=ob.get();
               }
               if(i%2 != 0){
                      System.out.println("Ah-ha! Numar impar: "+i); 
                  return;             
                }
                         
              }
           }
};
 //obiecte anonime       
   new Thread(r).start() ;
   new Thread(r).start();
  }
}