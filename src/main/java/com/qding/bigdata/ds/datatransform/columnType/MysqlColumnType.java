package com.qding.bigdata.ds.datatransform.columnType;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.datatransform.model.JdbcConfig;
import org.apache.commons.io.IOUtils;

import java.io.InputStream;
import java.util.HashMap;

/**
 * Created by lzs on 2018/5/18.
 */
public class MysqlColumnType extends CommonType {

    public static JdbcConfig mysqlJdbcCon;

    public MysqlColumnType() throws CloneNotSupportedException {
    }

    public MysqlColumnType(JdbcConfig mysqlJdbcCon) throws CloneNotSupportedException {
        MysqlColumnType.mysqlJdbcCon = mysqlJdbcCon;

    }


    public static JdbcConfig getMysqlCommColumnType() {
        JdbcConfig commonJdConf = null;
        try {
            commonJdConf = commonJdbcConf.clone();
            InputStream inputStream = CommonType.class.getClassLoader().getResourceAsStream("jdbc/jdbc-types-mysql.json");
            String mysqlText = IOUtils.toString(inputStream, "utf8");
            mysqlJdbcCon = JSON.parseObject(mysqlText, JdbcConfig.class);

            //公共type map
            HashMap<String, String> commonWriter = commonJdConf.getWriterTypes();
            HashMap<String, String> commonReader = commonJdConf.getReaderTypes();
            //本地type map
            HashMap<String, String> mysqlWriter = mysqlJdbcCon.getWriterTypes();
            HashMap<String, String> mysqlReader = mysqlJdbcCon.getReaderTypes();

            commonWriter.putAll(mysqlWriter);
            commonReader.putAll(mysqlReader);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return commonJdConf;
    }


}
