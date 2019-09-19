package ds1;

import com.qding.bigdata.ds.util.HttpUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * @author yanpf
 * @date 2018/5/15 9:54
 * @description
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml", "classpath*:/spring/applicationContext.xml"})
public class DataSourceTest {

    @Resource(name = "dsJdbcSource")
    DataSource dataSource;


    @Test
    public void test() throws Exception {
        ExecutorService executorService = Executors.newFixedThreadPool(50);
        for(int i=0; i<50; i++){
            executorService.submit(new Runnable() {
                @Override
                public void run() {
                    try {
                        Connection connection = dataSource.getConnection();
                        System.out.println(connection.hashCode());
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            });
        }
        executorService.awaitTermination(1000, TimeUnit.SECONDS);
    }

    @Test
    public void testAAA() throws Exception {

        ExecutorService executorService = Executors.newFixedThreadPool(50);
        for(int i=0; i<50; i++){
            executorService.submit(new Runnable() {
                @Override
                public void run() {
                    try {
                        HttpUtil.get("http://bigdata.qdingnet.com/ds/dataApiQuery/queryProject?projectId=659,1730,214083,22362091,22337479,1786,1941,21000000210580,22332754,21000000208749,1884,214085,21000000047318,1830,22472163,1728,1729,43,21000000085291,604&fromDate=2017-12-21&toDate=2018-03-22&pageSize=10&currentPage=2&calTotal=true");

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });
        }
        executorService.awaitTermination(1000, TimeUnit.SECONDS);
    }

    static Node[] p = new Node[10];

    static class Node {
        Node next;
        public Node(int k){
            this.next = p[k];
        }
    }
    @Test
    public void testL(){
        int[] pos = new int[]{1,3,5,7};
        int top = pos.length - 1;
        for(int k=pos[top]; k!= 1; p[k] = new Node(k)){
            k = pos[--top];
        }

        System.out.println(p);
    }
}
