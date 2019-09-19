package com.qding.bigdata.ds.datatransform.transport.sql;

import com.qding.bigdata.ds.datatransform.channel.Channel;
import com.qding.bigdata.ds.datatransform.model.MetaColumn;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;
import com.qding.bigdata.ds.datatransform.record.TerminatedRecord;
import com.qding.bigdata.ds.datatransform.transport.Reader;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/4/26 10:49
 * @description
 */
public class MetaDataReader extends Reader {

    private static final String sql = "select column_name, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, COLUMN_COMMENT from INFORMATION_SCHEMA.Columns where table_name='${tableName}' and table_schema='${db}'";

    private Connection connection;

    private PreparedStatement statement;

    private ResultSet resultSet;

    String dbName = "dw";
    String url = "jdbc:postgresql://10.37.5.115:5432/" + dbName;
    String user = "gpadmin";
    String pass = "gpadmin";
    String tableName = "test";

    public MetaDataReader(Channel channel) {
        super(channel);
    }

    @Override
    public void init() {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url,user,pass);
            String s = sql.replace("${tableName}", tableName).replace("${db}", dbName);
            statement = connection.prepareStatement("SELECT * FROM ds.ds_monitor_execute_result limit 1");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void preHandle() {
    }

    @Override
    public void read() {
        try{
            ResultSetMetaData metaData = statement.getMetaData();
            int columnCount = metaData.getColumnCount();
            MetaRecord record = new MetaRecord();
            List<MetaColumn> columns = new ArrayList<MetaColumn>();
            for(int i=1; i<=columnCount; i++){
              /*  MetaColumn column = new MetaColumn(metaData.getColumnName(i), metaData.getColumnClassName(i));*/
               /* column.setLength(metaData.getColumnDisplaySize(i));
                columns.add(column);*/
            }
            record.setColumns(columns);
            record.setTableName(tableName);
            channel.push(record);
            channel.push(TerminatedRecord.getInstance());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void postHandle() {
        super.postHandle();
        if(resultSet != null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(statement != null){
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
