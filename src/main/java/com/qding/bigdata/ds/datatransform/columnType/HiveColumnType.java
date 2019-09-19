package com.qding.bigdata.ds.datatransform.columnType;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.datatransform.model.JdbcConfig;
import org.apache.commons.io.IOUtils;

import java.io.InputStream;
import java.util.HashMap;

/**
 * Created by lzs on 2018/5/18.
 */
public class HiveColumnType extends CommonType {

    public static JdbcConfig hiveJdbcCon;

    public HiveColumnType() throws CloneNotSupportedException {
    }

    public HiveColumnType(JdbcConfig hiveJdbcCon) throws CloneNotSupportedException {
        HiveColumnType.hiveJdbcCon = hiveJdbcCon;
    }

    public static JdbcConfig getHiveCommColumnType(){
        JdbcConfig commonJdConf=null;
        try {
            commonJdConf=commonJdbcConf.clone();
            InputStream inputStream = CommonType.class.getClassLoader().getResourceAsStream("jdbc/jdbc-types-hive.json");
            String hiveText = IOUtils.toString(inputStream, "utf8");
            hiveJdbcCon = JSON.parseObject(hiveText, JdbcConfig.class);

            //公共type map
            HashMap<String,String> commonWriter =commonJdConf.getWriterTypes();
            HashMap<String,String> commonReader=commonJdConf.getReaderTypes();
            //本地type map
            HashMap<String,String> hiveWriter=hiveJdbcCon.getWriterTypes();
            HashMap<String,String> hiveReader=hiveJdbcCon.getReaderTypes();

            commonWriter.putAll(hiveWriter);
            commonReader.putAll(hiveReader);

        }catch (Exception e){
            e.printStackTrace();
        }
        return commonJdConf;
    }

   /* public JdbcConfig getHiveCommType(JdbcConfig commonJdCon){
        try {
            InputStream inputStream = CommonType.class.getClassLoader().getResourceAsStream("jdbc/jdbc-types-hive.json");
            String hiveText = IOUtils.toString(inputStream, "utf8");
            hiveJdbcCon = JSON.parseObject(hiveText, JdbcConfig.class);

            //公共type map
            HashMap<String,String> commonWriter =commonJdCon.getWriterTypes();
            HashMap<String,String> commonReader=commonJdCon.getReaderTypes();
            //本地type map
            HashMap<String,String> mysqlWriter=hiveJdbcCon.getWriterTypes();
            HashMap<String,String> mysqlReader=hiveJdbcCon.getReaderTypes();

            commonWriter.putAll(mysqlWriter);
            commonReader.putAll(mysqlReader);

        }catch (Exception e){
            e.printStackTrace();
        }
        return commonJdCon;
    }*/
}
