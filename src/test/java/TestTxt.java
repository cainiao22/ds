import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.datatransform.utils.JdbcUtil;
import com.qding.bigdata.ds.datatransform.utils.PoolThread;
import org.apache.hive.jdbc.HiveDriver;

import java.sql.Connection;

/**
 * Created by lzs on 2018/5/30.
 */
public class TestTxt {
    /* public static void main(String[] args) {
         ExecutorService fixedThreadPool = Executors.newFixedThreadPool(3);
         for (int i = 0; i < 10; i++) {
             final int index = i;
             fixedThreadPool.execute(new Runnable() {
                 public void run() {
                     try {
                         System.out.println(index);
                         Thread.sleep(2000);
                     } catch (InterruptedException e) {
                         e.printStackTrace();
                     }
                 }
             });
         }
     }*/
    public static void main(String[] args) throws Exception {
        /*xx((long) 9);*/
        /*String partitionvalue="dt='2018-06-13',er='sss'";
        String sb = new String("insert into table sss partition(");
        String ss=sb+partitionvalue+")"+"()";
        System.out.println(ss);*/
        ConfigValueModel model = new ConfigValueModel();
        model.setDbtype("hive2");
        model.setUrl("10.37.5.116:10000");
        model.setDb("qding_mds");
        model.setUser("bigdata");
        Connection connection = JdbcUtil.getConnection(model, HiveDriver.class.getName());
        System.out.println(connection);

    }

    private static void xx(final Long a) {
        PoolThread.fixedThreadPool.execute(new Runnable() {
            @Override
            public void run() {
                long id = Thread.currentThread().getId();
                System.out.println(id+"--------");
                long index = id % 10;
                System.out.println(index+"++++++++++++++");
                int dd = dd(id, index,a);
                System.out.println(dd+"..........");
            }


        });
    }

    private static int dd(long id, long index, Long a) {
        return (int) ((int)id+index+a);
    }

}
