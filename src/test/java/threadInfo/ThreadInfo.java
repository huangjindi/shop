package threadInfo;

import org.junit.Test;

public class ThreadInfo implements Runnable{

    int count = 0;

    @Test
    @Override
    public void run() {
        countThread();
    }
    public void countThread(){
        count++;
    }

}
