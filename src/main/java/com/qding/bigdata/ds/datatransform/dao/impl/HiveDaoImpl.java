package com.qding.bigdata.ds.datatransform.dao.impl;

import com.qding.bigdata.ds.Exception.JDBCConnExcetion;
import com.qding.bigdata.ds.datatransform.commonData.CommData;
import com.qding.bigdata.ds.datatransform.dao.HiveDao;
import com.qding.bigdata.ds.datatransform.dao.TableDao;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.datatransform.model.RowColumnNamAndVal;
import com.qding.bigdata.ds.datatransform.utils.JdbcUtil;
import com.qding.bigdata.ds.datatransform.utils.PoolThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by lzs on 2018/5/18.
 */
@Repository
public class HiveDaoImpl implements HiveDao{
    @Autowired
    TableDao tableDao;
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    public String onnType= CommData.HIVE_CLASSDRIVER;
    public String mysqlType= CommData.MYSQL_CLASSDRIVER;
    @Override
    public Boolean creatTable(String sql, ConfigValueModel targetConfigValueModel) {
        Boolean flag=true;
        try {
            conn = JdbcUtil.getConnection(targetConfigValueModel,onnType);
            ps=conn.prepareStatement(sql);
            flag= ps.execute();
        } catch (JDBCConnExcetion jdbcConnExcetion) {
            jdbcConnExcetion.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return flag;

    }


    public void ThreadPoolInsert(final String tableName, final ConfigValueModel targetConfigValueModel, final ConfigValueModel metaConfigValueModel, final String districtField) {
        for (int i=0;i<=10;i++) {
            PoolThread.fixedThread(new Runnable() {
                @Override
                public void run() {
                    long id = Thread.currentThread().getId();
                    long index = id % 10;
                    Boolean boo = insertIntoTable(tableName, targetConfigValueModel, metaConfigValueModel, index, districtField);
                }
            });
        }
    }


    public Boolean insertIntoTable(String tableName, ConfigValueModel targetConfigValueModel, ConfigValueModel metaConfigValueModel, long index,String districtField) {
        Boolean flag=true;
        List<List<RowColumnNamAndVal>> tableInfos = tableDao.queryTableInfo(tableName, metaConfigValueModel,index,districtField,mysqlType);
        if (null!=tableInfos){
            for (List<RowColumnNamAndVal> row : tableInfos) {
                StringBuffer sbf = new StringBuffer("insert into table "+tableName+"(");
                for (int i=0;i<row.size();i++) {
                    if (i==row.size()-1){
                        sbf.append(row.get(i).getRowColumnNam());
                    }else {
                        sbf.append(row.get(i).getRowColumnNam()+",");
                    }
                }
                sbf.append(") values(");
                for (int i=0;i<row.size();i++) {
                    if (i==row.size()-1){
                        sbf.append("'"+row.get(i).getRowColumnVal()+"'");
                    }else {
                        sbf.append("'"+row.get(i).getRowColumnVal()+"',");
                    }
                }
                sbf.append(")");
                String sql=sbf.toString();
                flag = isExecute(sql,targetConfigValueModel);
            }
        }
        return flag;
    }
    //插入分区表
    public Boolean insertIntoPartitionTable(String tableName, ConfigValueModel targetConfigValueModel, ConfigValueModel metaConfigValueModel, long index,String districtField) {
        List<List<RowColumnNamAndVal>> tableInfos = tableDao.queryTableInfo(tableName, metaConfigValueModel,index,districtField,mysqlType);
        Boolean flag=true;
        String partitionvalue="dt='2018-06-13'";
        if (null!=tableInfos){
            for (List<RowColumnNamAndVal> row : tableInfos) {
               /* insert into table test1 () partition() values() */
                StringBuffer sbf = new StringBuffer("insert into table "+tableName+"partition("+partitionvalue+")"+"(");
                for (int i=0;i<row.size();i++) {
                    if (i==row.size()-1){
                        sbf.append(row.get(i).getRowColumnNam());
                    }else {
                        sbf.append(row.get(i).getRowColumnNam()+",");
                    }
                }
                sbf.append(") partition("+partitionvalue+") values(");
                for (int i=0;i<row.size();i++) {
                    if (i==row.size()-1){
                        sbf.append("'"+row.get(i).getRowColumnVal()+"'");
                    }else {
                        sbf.append("'"+row.get(i).getRowColumnVal()+"',");
                    }
                }
                sbf.append(")");
                String sql=sbf.toString();
                flag = isExecute(sql,targetConfigValueModel);
            }
        }
        return flag;
    }

    private boolean isExecute(String sql,ConfigValueModel targetConfigValueModel) {
        Boolean flag=true;
        try {
            conn = JdbcUtil.getConnection(targetConfigValueModel,onnType);
            ps = conn.prepareStatement(sql);
            flag =ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return flag;
    }

    public Boolean queryFromHive(String tableName,ConfigValueModel targetConfigValueModel){
        Boolean boo = false;
        try {
            conn=JdbcUtil.getConnection(targetConfigValueModel,onnType);
            String sql="select * from "+tableName;
            ps=conn.prepareStatement(sql);
            boo=ps.execute();
        } catch (JDBCConnExcetion jdbcConnExcetion) {
            jdbcConnExcetion.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boo;
    }



}

/* Future<Boolean> future = PoolThread.fixedThreadPool.submit(new Callable<Boolean>() {
            @Override
            public Boolean call() throws Exception {
                return insertIntoTable(tableName, targetConfigValueModel, metaConfigValueModel, index, districtField);
            }
        });*/

/*    public int importDataFromMysql(DataInfo dataInfo,ConfigValueModel metaConfigValueModel,ConfigValueModel targetConfigValueModel){
        System.setProperty("HADOOP_USER_NAME","hive");
        String[] args = new String[] {
                "--connect","jdbc:" + metaConfigValueModel.getDbtype() + "://" + metaConfigValueModel.getUrl() + "/" + metaConfigValueModel.getDb(),
                "--driver",mysqlType,
                "-username",metaConfigValueModel.getUser(),
                "-password",metaConfigValueModel.getPassword(),
                "--table",dataInfo.getTableName(),
                "--direct",
                "-m","1",
                "--hive-import",
                "--delete-target-dir",
                "--target-dir",""
        };

        String[] expandArguments = null;
        try {
            expandArguments = OptionsFileUtil.expandArguments(args);
        } catch (Exception e) {
            e.printStackTrace();
        }

        SqoopTool tool = SqoopTool.getTool("import");

        Configuration conf = new Configuration();
        conf.set("fs.default.name", "hdfs://"+targetConfigValueModel.getUrl());//设置HDFS服务地址
        Configuration loadPlugins = SqoopTool.loadPlugins(conf);

        Sqoop sqoop = new Sqoop((com.cloudera.sqoop.tool.SqoopTool) tool, loadPlugins);
        return Sqoop.runSqoop(sqoop, expandArguments);
    }*/

 /*String sw=tableInfos.toString();
        List<MetaColumn> metaColumns = tableDao.queryColumnByTbName(tableName,metaConfigValueModel);
        int pageSize = metaColumns.size();
        int total = tableInfos.size();
        int pageCount = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
        for (int i = 0; i < pageCount; i++) {
            int start = i * pageSize;
            int end = start + pageSize > total ? total : start + pageSize;
            List<String> subList = tableInfos.subList(start, end);
            String ss=subList.toString();
            StringBuffer sbf = new StringBuffer("insert into table "+tableName+" values(");
            for (int j=1;j<subList.size();j++) {
                sbf.append("'"+subList.get(j)+"',");
                if(j==subList.size()-1){
                    sbf.append("'"+subList.get(subList.size()-1)+"'");
                }
            }
            sbf.append(")");
            sql = sbf.toString();
            flag = isExecute(sql,targetConfigValueModel);
            String strip = StringUtils.strip(subList.toString(), "[]");
            sbf.append(strip);
*/
