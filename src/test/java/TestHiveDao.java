/*
import com.qding.bigdata.ds.datatransform.dao.HiveDao;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

*/
/**
 * Created by lzs on 2018/5/28.
 *//*

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml", "classpath*:/spring/applicationContext.xml"})
public class TestHiveDao {
    @Autowired
    HiveDao hiveDao;
    @Test
    public void test1(){
        ConfigValueModel metaConfigValueModel = new ConfigValueModel();
        metaConfigValueModel.setDb("devds");
        metaConfigValueModel.setUrl("10.37.5.111:3306");
        metaConfigValueModel.setUser("ds");
        metaConfigValueModel.setPassword("123456!");
        metaConfigValueModel.setDbtype("mysql");
        String tableName="student";
        ConfigValueModel targetConfigValueModel = new ConfigValueModel();
        hiveDao.insertIntoTable(tableName,targetConfigValueModel,metaConfigValueModel, index);
    }
}
*/
