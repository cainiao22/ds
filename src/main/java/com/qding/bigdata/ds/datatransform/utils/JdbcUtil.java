package com.qding.bigdata.ds.datatransform.utils;


import com.qding.bigdata.ds.Exception.JDBCConnExcetion;
import com.qding.bigdata.ds.datatransform.commonData.CommData;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.model.DataxConfigFile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public final class JdbcUtil {

    public static Connection getConnection(ConfigValueModel configValueModel,String connType) throws JDBCConnExcetion {
        Connection conn = null;
        String dbtype = configValueModel.getDbtype();
        if("hive".equals(dbtype)){
            dbtype = "hive2";
        }
        String url = "jdbc:" + dbtype + "://" + configValueModel.getUrl() + "/" + configValueModel.getDb()+"?useUnicode=true&characterEncoding=UTF-8";
        try {
            Class.forName(connType);//指定连接类型
            conn = DriverManager.getConnection(url, configValueModel.getUser(), configValueModel.getPassword());//获取连接
        } catch (Exception e) {
            e.printStackTrace();
            throw new JDBCConnExcetion("链接数据库异常请检查传入参数:" + url);
        }
        return conn;
    }

    /**
     * 连接JDBC查数据
     * @param dataxConfigFile
     * @return
     * @throws JDBCConnExcetion
     */
    public static Connection getConnectionInfo(DataxConfigFile dataxConfigFile) throws JDBCConnExcetion {
        String connType = "";
        Connection conn = null;
        String url = dataxConfigFile.getJdbcUrl()+"?useUnicode=true&characterEncoding=UTF-8";
        if("mysql".equals(dataxConfigFile.getDataBaseType())){
            connType = CommData.MYSQL_CLASSDRIVER;
        }
        if("hive".equals(dataxConfigFile.getDataBaseType())){
            connType = CommData.HIVE_CLASSDRIVER;
        }
        if("postgresql".equals(dataxConfigFile.getDataBaseType())){
            connType = CommData.POSTGRESQL_CLASSDRIVER;
        }
        try {
            Class.forName(connType);//指定连接类型
            conn = DriverManager.getConnection(url, dataxConfigFile.getUsername(), dataxConfigFile.getPassword());//获取连接
        } catch (Exception e) {
            e.printStackTrace();
            throw new JDBCConnExcetion("链接数据库异常请检查传入参数:" + url);
        }
        return conn;
    }



    /**
     * 关闭连接
     * @param rs
     * @param pstm
     * @param conn
     */
    public static void closeResouce(ResultSet rs,PreparedStatement pstm,Connection conn){
        try{
            if(rs != null){
                rs.close();
            }
            if(pstm != null){
                pstm.close();
            }
            if(conn != null){
                conn.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
