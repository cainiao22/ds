package com.qding.bigdata.ds.datatransform.columnType;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.datatransform.model.JdbcConfig;
import org.apache.commons.io.IOUtils;

import java.io.InputStream;
import java.util.HashMap;

/**
 * Created by lzs on 2018/5/18.
 */
public class PostgresqlColumnType extends CommonType {

    public static JdbcConfig postgresqlJdbcCon;

    public PostgresqlColumnType() throws CloneNotSupportedException {
    }

    public PostgresqlColumnType(JdbcConfig postgresqlJdbcCon) throws CloneNotSupportedException {
        PostgresqlColumnType.postgresqlJdbcCon = postgresqlJdbcCon;

    }


    public static JdbcConfig getPostgresqlCommColumnType() {
        JdbcConfig commonJdConf = null;
        try {
            commonJdConf = commonJdbcConf.clone();
            InputStream inputStream = CommonType.class.getClassLoader().getResourceAsStream("jdbc/jdbc-types-postgresql.json");
            String postgresqlText = IOUtils.toString(inputStream, "utf8");
            postgresqlJdbcCon = JSON.parseObject(postgresqlText, JdbcConfig.class);

            //公共type map
            HashMap<String, String> commonWriter = commonJdConf.getWriterTypes();
            HashMap<String, String> commonReader = commonJdConf.getReaderTypes();
            //本地type map
            HashMap<String, String> postgresqlWriter = postgresqlJdbcCon.getWriterTypes();
            HashMap<String, String> postgresqlReader = postgresqlJdbcCon.getReaderTypes();

            commonWriter.putAll(postgresqlWriter);
            commonReader.putAll(postgresqlReader);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return commonJdConf;
    }


}
