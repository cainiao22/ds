package com.qding.bigdata.ds.datatransform.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.qding.bigdata.ds.Exception.JDBCConnExcetion;
import com.qding.bigdata.ds.datatransform.commonData.CommData;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by QDHL on 2017/8/10.
 */

public class JdbcTool {

    static Map<String, ComboPooledDataSource> map = new HashMap<String, ComboPooledDataSource>();

    public static ComboPooledDataSource buildConnetionPool(ConfigValueModel configValueModel) throws JDBCConnExcetion {
        //获取连接池对象
        ComboPooledDataSource cp = new ComboPooledDataSource();
        String url = "jdbc:"+configValueModel.getDbtype()+"://" + configValueModel.getUrl() + "/" + configValueModel.getDb();
        try {
            //设置连接参数
            cp.setJdbcUrl(url);
            cp.setUser(configValueModel.getUser());
            cp.setPassword(configValueModel.getPassword());
            cp.setDriverClass(CommData.MYSQL_CLASSDRIVER);
            //设置连接池的参数
            cp.setInitialPoolSize(1);//初始数量
            cp.setMaxPoolSize(8);//最大数量
            cp.setCheckoutTimeout(3000);//最大等待时间
            cp.getConnection().hashCode();
        } catch (Exception e) {
            cp.close();
            throw new JDBCConnExcetion("链接数据库异常请检查传入参数:" + url);
        }
        return cp;
    }

    public static ComboPooledDataSource getComboPooledDataSource(ConfigValueModel configValueModel) throws JDBCConnExcetion {
        String dbName = configValueModel.getDb();
        if (!map.containsKey(dbName)) {
            synchronized (JdbcTool.class) {
                if (!map.containsKey(dbName)) {
                    ComboPooledDataSource cp = buildConnetionPool(configValueModel);
                    map.put(dbName, cp);
                }
            }
        }
        return map.get(dbName);

    }

  /* public static void close(Connection conn) {
        try {
            conn.close();
        }catch (Exception e) {
            e.printStackTrace();
        }

   }
*/


}









