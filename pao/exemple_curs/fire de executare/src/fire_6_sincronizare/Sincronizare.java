package fire_6_sincronizare;

class Counter
{
    long count = 0;

    public long getCount()
    {
        return count;
    }

    synchronized public void add()
    {
        //synchronized(this)
        {
            this.count++;
        }
    }
}

class CounterThread extends Thread
{
    protected Counter counter = null;

    public CounterThread(Counter counter)
    {
        this.counter = counter;
    }

    @Override
    public void run()
    {
        for (int i = 0; i < 1000; i++)
                counter.add();
    }
}

public class Sincronizare
{
    public static void main(String[] args) throws InterruptedException
    {
        Counter counter = new Counter();
        CounterThread threadA = new CounterThread(counter);
        CounterThread threadB = new CounterThread(counter);

        threadA.start();
        threadB.start();
        
        threadA.join();
        threadB.join();
        
        System.out.println("Counter: " + counter.getCount());
    }
}
