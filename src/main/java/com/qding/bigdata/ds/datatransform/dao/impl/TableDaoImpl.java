package com.qding.bigdata.ds.datatransform.dao.impl;

import com.qding.bigdata.ds.datatransform.dao.TableDao;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.datatransform.model.MetaColumn;
import com.qding.bigdata.ds.datatransform.model.RowColumnNamAndVal;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;
import com.qding.bigdata.ds.datatransform.utils.JdbcUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lzs on 2018/5/18.
 */
@Repository
public class TableDaoImpl implements TableDao{
    protected Log log = LogFactory.getLog(this.getClass());
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
   /* public  String connType = CommData.MYSQL_CLASSDRIVER;*/
   //mysql查询
    /**
     * 查询表信息
     * @param tableName
     * @param metaConfigValueModel
     * @return
     */
    @Override
    public MetaRecord queryTableByTbName(String tableName,ConfigValueModel metaConfigValueModel,String driverName) {
        MetaRecord sqlMetaRecord=null;
            try {
            conn= JdbcUtil.getConnection(metaConfigValueModel,driverName);
            String sql="SELECT TABLE_NAME,TABLE_COMMENT FROM INFORMATION_SCHEMA.Tables WHERE TABLE_NAME =? AND TABLE_SCHEMA =?";
            PreparedStatement  ps = conn.prepareStatement(sql);
                ps.setString(1,tableName);
                ps.setString(2,metaConfigValueModel.getDb());
            ResultSet rs = ps.executeQuery();
             sqlMetaRecord= new MetaRecord();
            while (rs.next()){
               sqlMetaRecord.setTableName(rs.getString("TABLE_NAME"));
               sqlMetaRecord.setComment(rs.getString("TABLE_COMMENT"));
            }
            List<MetaColumn> sqlMetaColumns = queryColumnByTbName(tableName, metaConfigValueModel,driverName);
            sqlMetaRecord.setColumns(sqlMetaColumns);
        } catch (Exception e){
            log.error("查询表信息异常");
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return sqlMetaRecord;
    }

    /**
     * 查询表字段信息
     * @param tableName
     * @param metaConfigValueModel
     * @return
     */
    @Override
    public List<MetaColumn> queryColumnByTbName(String tableName, ConfigValueModel metaConfigValueModel,String driverName) {
        List<MetaColumn> columnList = new ArrayList<MetaColumn>();
       try {
           conn = JdbcUtil.getConnection(metaConfigValueModel,driverName);
           String sql="SELECT COLUMN_NAME,COLUMN_COMMENT,CHARACTER_MAXIMUM_LENGTH,DATA_TYPE FROM INFORMATION_SCHEMA.Columns WHERE TABLE_NAME=? AND TABLE_SCHEMA=?";
           ps = conn.prepareStatement(sql);
           ps.setString(1,tableName);
           ps.setString(2,metaConfigValueModel.getDb());
           rs= ps.executeQuery();
           while (rs.next()){
               MetaColumn sqlMetaColumn=new MetaColumn(rs.getString("COLUMN_NAME"),rs.getString("DATA_TYPE"),rs.getString("COLUMN_COMMENT"),rs.getString("CHARACTER_MAXIMUM_LENGTH"));
            columnList.add(sqlMetaColumn);
           }

       }catch (Exception e){
           log.error("查询列信息异常");
            e.printStackTrace();
       }finally {
           JdbcUtil.closeResouce(rs, ps, conn);
       }
        return columnList;
    }

    /**
     * 查询表信息
     * @param tableName
     * @param metaConfigValueModel
     * @param index
     * @return
     */
    @Override

    public List<List<RowColumnNamAndVal>> queryTableInfo(String tableName, ConfigValueModel metaConfigValueModel, long index,String districtField,String driverName) {

        List<List<RowColumnNamAndVal>> tableInfo = new ArrayList<List<RowColumnNamAndVal>>();
        try {
            conn = JdbcUtil.getConnection(metaConfigValueModel,driverName);
            String sql="select * from "+tableName+" where hex("+districtField+")%10="+index;
           /* String sql="select * from "+tableName;*/
            ps = conn.prepareStatement(sql);
            rs= ps.executeQuery();
            if(rs!=null){
                while (rs.next()){
                    ResultSetMetaData metaData = rs.getMetaData();
                    int columnCount = metaData.getColumnCount();
                    List<RowColumnNamAndVal> rows = new ArrayList<RowColumnNamAndVal>();
                    for (int i = 1; i <= columnCount; i++) {
                        RowColumnNamAndVal namAndVal = new RowColumnNamAndVal();
                        namAndVal.setRowColumnNam(metaData.getColumnName(i));
                        namAndVal.setRowColumnVal(rs.getString(i));
                        rows.add(namAndVal);
                    }
                    tableInfo.add(rows);
                }
            }else {
                return null;
            }
        }catch (Exception e){
            log.error("查询表信息异常");
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return tableInfo;
    }

    //postgresql 查询
    @Override
    public MetaRecord queryPostgresqlTableByTbName(String tableName, ConfigValueModel metaConfigValueModel, String driverName) {
        MetaRecord psqlMetaRecord=null;
        try {
            conn= JdbcUtil.getConnection(metaConfigValueModel,driverName);
            String sql="select table_name from information_schema.tables where table_name=? and table_schema=? ";
            PreparedStatement  ps = conn.prepareStatement(sql);
            ps.setString(1,tableName);
            ps.setString(2,metaConfigValueModel.getSchema());
            ResultSet rs = ps.executeQuery();
            psqlMetaRecord= new MetaRecord();
            while (rs.next()){
                psqlMetaRecord.setTableName(rs.getString("TABLE_NAME"));
                /*sqlMetaRecord.setComment(rs.getString("TABLE_COMMENT"));*/
            }
            List<MetaColumn> psqlMetaColumns = queryPostgresqlColumnByTbName(tableName, metaConfigValueModel,driverName);
            psqlMetaRecord.setColumns(psqlMetaColumns);
        } catch (Exception e){
            log.error("查询表信息异常");
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return psqlMetaRecord;
    }

    @Override
    public List<MetaColumn> queryPostgresqlColumnByTbName(String tableName, ConfigValueModel metaConfigValueModel, String driverName) {
        List<MetaColumn> columnList = new ArrayList<MetaColumn>();
        try {
            conn = JdbcUtil.getConnection(metaConfigValueModel,driverName);
            String sql="SELECT column_name,udt_name,character_maximum_length,description  FROM  (SELECT\n" +
                    "\td.attname AS columnname,\n" +
                    "\te.description\n" +
                    "FROM\n" +
                    "\tpg_catalog.pg_namespace A\n" +
                    "JOIN pg_catalog.pg_class b ON A .oid = b.relnamespace\n" +
                    "AND b.relkind = 'r'\n" +
                    "JOIN pg_catalog.pg_attribute d ON b.oid = d.attrelid\n" +
                    "AND d.attnum >= 0\n" +
                    "LEFT JOIN pg_catalog.pg_description e ON b.oid = e.objoid\n" +
                    "AND b.tableoid = e.classoid\n" +
                    "AND d.attnum = e.objsubid \n" +
                    "WHERE A.nspname = ? \n" +
                    "AND b.relname = ?) AS w \n" +
                    "RIGHT JOIN \n" +
                    "(select column_name,udt_name,character_maximum_length from information_schema.columns where table_schema=? and table_name=?) \n" +
                    "AS f ON w.columnname=f.column_name";
            ps = conn.prepareStatement(sql);
            ps.setString(1,metaConfigValueModel.getSchema());
            ps.setString(2,tableName);
            ps.setString(3,metaConfigValueModel.getSchema());
            ps.setString(4,tableName);
            rs= ps.executeQuery();
            /*Map<String, String> commmentMap = queryPostgresqlColumnCommentByTbName(tableName, metaConfigValueModel, driverName);*/
            while (rs.next()){
                MetaColumn psqlMetaColumn=new MetaColumn();
                psqlMetaColumn.setName(rs.getString("column_name"));
                psqlMetaColumn.setType(rs.getString("udt_name"));
                psqlMetaColumn.setLength(rs.getString("character_maximum_length"));
                psqlMetaColumn.setComment(rs.getString("description"));
                columnList.add(psqlMetaColumn);
            }

        }catch (Exception e){
            log.error("查询psql列信息异常");
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return columnList;
    }

}

  /*  @Override
    public Map<String,String> queryPostgresqlColumnCommentByTbName(String tableName, ConfigValueModel metaConfigValueModel, String driverName) {
        Map<String,String> columnMap = new HashMap<String, String>();
        try {
            conn = JdbcUtil.getConnection(metaConfigValueModel,driverName);
            String sql="SELECT d.attname AS column_name,e.description FROM pg_catalog.pg_namespace A\n" +
                    "JOIN pg_catalog.pg_class b ON A .oid = b.relnamespace\n" +
                    "AND b.relkind = 'r'\n" +
                    "JOIN pg_catalog.pg_attribute d ON b.oid = d.attrelid\n" +
                    "AND d.attnum >= 0\n" +
                    "LEFT JOIN pg_catalog.pg_description e ON b.oid = e.objoid\n" +
                    "AND b.tableoid = e.classoid\n" +
                    "AND d.attnum = e.objsubid\n" +
                    "WHERE b.relname = ? AND A .nspname = ?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1,tableName);
            ps.setString(2,metaConfigValueModel.getPsqlSchema());
            rs= ps.executeQuery();
            while (rs.next()){
                columnMap.put(rs.getString("column_name"),rs.getString(""));
            }

        }catch (Exception e){
            log.error("查询psql信息异常");
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return columnMap;
    }*/
