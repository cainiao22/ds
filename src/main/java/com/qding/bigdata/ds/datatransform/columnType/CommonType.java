package com.qding.bigdata.ds.datatransform.columnType;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.datatransform.model.JdbcConfig;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by lzs on 2018/5/18.
 */
public class CommonType {

    protected static JdbcConfig commonJdbcConf;

    static {
        try {
            InputStream inputStream = CommonType.class.getClassLoader().getResourceAsStream("jdbc/jdbc-templete.json");
            String commenText = IOUtils.toString(inputStream, "utf8");
            commonJdbcConf= JSON.parseObject(commenText,JdbcConfig.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
