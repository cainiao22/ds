import com.qding.bigdata.ds.datatransform.utils.PoolThread;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

/**
 * Created by lzs on 2018/6/4.
 */
public class TestFFA {

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        List<Future> list=new ArrayList<Future>();
        ExecutorService pool=PoolThread.fixedThreadPool;

        for (int i=0;i<10;i++){
            Future<Integer> submit1 = pool.submit(new Callable<Integer>() {

                @Override
                public Integer call() throws Exception {
                    Runb runb=new Runb();
                    return  runb.dd();
                }
            });
           /* Callable testCallable=new TestCallable();
            Future submit = pool.submit(testCallable);*/
            list.add(submit1);
        }
        /*pool.shutdown();*/
        for (Future fut:list){
            System.out.println(fut.get());
        }
    }


}
