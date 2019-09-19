//package ds1;
//
//import com.alibaba.fastjson.JSON;
//import com.qding.bigdata.ds.datatransform.channel.Channel;
//import com.qding.bigdata.ds.datatransform.channel.MemoryChannel;
//import com.qding.bigdata.ds.datatransform.enums.SQLTypEnum;
//import com.qding.bigdata.ds.datatransform.model.JdbcConfig;
//import com.qding.bigdata.ds.datatransform.transport.Reader;
//import com.qding.bigdata.ds.datatransform.transport.Writer;
//import com.qding.bigdata.ds.datatransform.transport.sql.AbstractMetaDataConverter;
//import com.qding.bigdata.ds.datatransform.transport.sql.MetaDataReader;
//import com.qding.bigdata.ds.datatransform.transport.sql.hive.HiveMetaWriter;
//import org.apache.commons.io.IOUtils;
//import org.junit.Test;
//
//import java.io.FileInputStream;
//import java.io.InputStream;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//
///**
// * @author yanpf
// * @date 2018/4/26 14:00
// * @description
// */
//public class JobTest {
//
//    ExecutorService executorService = Executors.newFixedThreadPool(10);
//
//    @Test
//    public void testJob() throws Exception {
//        Channel channel = new MemoryChannel();
//        Reader reader = new MetaDataReader(channel);
//        Writer writer = new HiveMetaWriter(channel);
//        reader.start();
//        writer.start();
//
//        for(int i=0; i<Integer.MAX_VALUE; i++){
//            Thread.sleep(1000);
//        }
//
//    }
//
//    @Test
//    public void testJdbcConfig() throws Exception {
//        JdbcConfig config = new JdbcConfig();
//        AbstractMetaDataConverter converter = new AbstractMetaDataConverter(SQLTypEnum.MYSQL);
//        /*config.setReaderTypes(converter.getPositive());
//        config.setWriterTypes(converter.getNegative());*/
//        String json = JSON.toJSONString(config);
//        System.out.println(json);
//
//        JdbcConfig a = JSON.parseObject(json, JdbcConfig.class);
//        System.out.println(a);
//    }
//
//    @Test
//    public void testConvert() throws Exception {
//        InputStream inputStream = new FileInputStream("D:\\work\\Project\\Qding\\ds\\branch-20180425-hivejdbc\\src\\main\\resources\\jdbc\\jdbc-templete.json");
//        String text = IOUtils.toString(inputStream,"utf8");
//        JdbcConfig root = JSON.parseObject(text,JdbcConfig.class);
//        System.out.println(root);
//    }
//
//}
