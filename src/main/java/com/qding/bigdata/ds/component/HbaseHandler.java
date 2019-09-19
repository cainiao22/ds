package com.qding.bigdata.ds.component;

import com.qding.bigdata.ds.annotation.HBaseColumn;
import com.qding.bigdata.ds.annotation.HBaseRowKey;
import com.qding.bigdata.ds.model.HBaseBatchQueryParam;
import com.qding.bigdata.ds.model.HbaseColumn;
import com.qding.bigdata.ds.model.HbaseQueryParam;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.*;

/**
 * @author yanpf
 * @date 2018/5/8 17:12
 * @description
 */

@Component
public class HbaseHandler implements InitializingBean, DisposableBean {

    private Connection connection;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public interface HandleCallBack<T> {
        T callBack(Result result);
    }

    private static class ClassConvertCallBack<T> implements HandleCallBack<T> {

        private Class<T> clazz;

        public ClassConvertCallBack(Class<T> clazz) {
            this.clazz = clazz;
        }

        @Override
        public T callBack(Result result) {
            List<Cell> cells = result.listCells();
            if(CollectionUtils.isEmpty(cells)){
                return null;
            }
            try {
                T t = clazz.newInstance();
                Map<String, Field> map = new HashMap<String, Field>();
                Field[] declaredFields = clazz.getDeclaredFields();
                for (Field declaredField : declaredFields) {
                    HBaseRowKey rowKey = declaredField.getAnnotation(HBaseRowKey.class);
                    if(rowKey != null){
                        setFieldValue(t, result.getRow(), declaredField);
                    }else{
                        HBaseColumn annotation = declaredField.getAnnotation(HBaseColumn.class);
                        if(annotation != null){
                            map.put(annotation.name().toLowerCase(), declaredField);
                        }
                    }
                }
                for (Cell cell : cells) {
                    String colum = Bytes.toString(CellUtil.cloneQualifier(cell));
                    Field field = map.get(colum.toLowerCase());
                    if(field != null){
                        setFieldValue(t, CellUtil.cloneValue(cell), field);
                    }
                }

                return t;
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }

            return null;
        }

        private <T> void setFieldValue(T t, byte[] bytes, Field field) throws IllegalAccessException {
            field.setAccessible(true);
            if(field.getType() == int.class || field.getType() == Integer.class){
                field.set(t, Bytes.toInt(bytes));
            }else if(field.getType() == long.class || field.getType() == Long.class){
                field.set(t, Bytes.toLong(bytes));
            }else if(field.getType() == String.class){
                field.set(t, Bytes.toString(bytes));
            }else if(field.getType() == double.class || field.getType() == Double.class){
                field.set(t, Bytes.toDouble(bytes));
            }else if(field.getType() == BigDecimal.class){
                field.set(t, Bytes.toBigDecimal(bytes));
            }
        }

    };

    public <T> T getByRowKey(HbaseQueryParam param, HandleCallBack<T> callBack) throws Exception {
        TableName tableName = TableName.valueOf(param.getTableName());
        Table table = null;
        try{
            table = connection.getTable(tableName);
            Get get = new Get(Bytes.toBytes(param.getRowKey()));
            if(!CollectionUtils.isEmpty(param.getFamily())){
                for (String f : param.getFamily()) {
                    get.addFamily(Bytes.toBytes(f));
                }
            }
            if(!CollectionUtils.isEmpty(param.getHbaseColumnList())){
                for (HbaseColumn column : param.getHbaseColumnList()) {
                    get.addColumn(Bytes.toBytes(column.getFamily()), Bytes.toBytes(column.getQualifier()));
                }
            }

            if(param.getMaxVersions() != null){
                get.setMaxVersions(param.getMaxVersions());
            }

            Result result = table.get(get);
            return callBack.callBack(result);
        }catch (Exception e){
            logger.error("hbase访问异常:{}", e);
            return null;
        }finally {
            if(table != null){
                table.close();
            }
        }
    }

    public <T> List<T> getByBatchRowKey(HBaseBatchQueryParam param, HandleCallBack<T> callBack) throws Exception {
        TableName tableName = TableName.valueOf(param.getTableName());
        Table table = null;
        try{
            table = connection.getTable(tableName);
            List<Get> getList = new ArrayList<Get>();
            for (String s : param.getRowkeyList()) {
                Get get = new Get(Bytes.toBytes(s));
                if(!CollectionUtils.isEmpty(param.getFamily())){
                    for (String f : param.getFamily()) {
                        get.addFamily(Bytes.toBytes(f));
                    }
                }
                if(!CollectionUtils.isEmpty(param.getHbaseColumnList())){
                    for (HbaseColumn column : param.getHbaseColumnList()) {
                        get.addColumn(Bytes.toBytes(column.getFamily()), Bytes.toBytes(column.getQualifier()));
                    }
                }

                getList.add(get);
            }

            Result[] results = table.get(getList);
            List<T> resultList = new ArrayList<T>();
            for (Result result : results) {
                T back = callBack.callBack(result);
                if (back != null) {
                    resultList.add(back);
                }
            }

            return resultList;
        }catch (Exception e){
            logger.error("hbase访问异常:{}", e);
            return Collections.emptyList();
        }finally {
            if(table != null){
                table.close();
            }
        }
    }

    public <T> T getByRowKey(HbaseQueryParam param, final Class<T> clazz) throws Exception {
        return this.getByRowKey(param, new ClassConvertCallBack<T>(clazz));
    }

    public <T> List<T> getByBatchRowKey(HBaseBatchQueryParam param, Class<T> clazz) throws Exception {
        return this.getByBatchRowKey(param, new ClassConvertCallBack<T>(clazz));
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Configuration conf = HBaseConfiguration.create();
        conf.set("hbase.master", "BJ-HOST-113:60000,BJ-HOST-112:60000");
        conf.set("hbase.zookeeper.quorum", "m7-qding-bd-244,m7-qding-bd-242,BJ-HOST-113,m7-qding-bd-245,BJ-HOST-138");
        conf.set("hbase.zookeeper.property.clientPort","12181");

        connection = ConnectionFactory.createConnection(conf);
    }

    @Override
    public void destroy() throws Exception {
        if(connection != null){
            connection.close();
        }
    }
}
