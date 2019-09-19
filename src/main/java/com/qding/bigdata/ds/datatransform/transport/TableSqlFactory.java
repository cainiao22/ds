package com.qding.bigdata.ds.datatransform.transport;

import com.qding.bigdata.ds.datatransform.columnType.HiveColumnType;
import com.qding.bigdata.ds.datatransform.model.DataInfo;
import com.qding.bigdata.ds.datatransform.model.JdbcConfig;
import com.qding.bigdata.ds.datatransform.model.MetaColumn;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.List;

/**
 *
 * Created by lzs on 2018/5/18.
 */
public class TableSqlFactory {

    public static String creatHiveTableSql(DataInfo dataParam, MetaRecord sqlMetaRecord) {

        JdbcConfig hiveCommJdbCof = HiveColumnType.getHiveCommColumnType();
        HashMap<String, String> readTypes = hiveCommJdbCof.getReaderTypes();
        StringBuffer sbf = new StringBuffer("CREATE EXTERNAL TABLE " + dataParam.getTargetTableName()+ "(");
        List<MetaColumn> sqlMetaColumns = sqlMetaRecord.getColumns();

        for (int i = 0; i < sqlMetaColumns.size(); i++) {
            MetaColumn column = sqlMetaColumns.get(i);
            String hiveType = readTypes.get(column.getType());
            column.setType(hiveType);

            if (column.getLength() != null && (column.getType().equals("char") || column.getType().equals("varchar"))) {
                sbf.append(column.getName() + " " + column.getType() + " (" + column.getLength()+ ")");
            } else {
                sbf.append(column.getName() + " " + column.getType());
            }

            String comment=column.getComment();
            String regex="[0-9]+";
            if (StringUtils.isNotBlank(comment) && !comment.matches(regex)){
                sbf.append(" comment '"+column.getComment().trim()+"',");
            }else {
                sbf.append(",");
            }

        }

        /*create table student_tmp(id int, name string)
                 partitioned by(academy string, class string)
                 row format delimited fields terminated by ','
                 stored as textfile
                 location '/data/';*/
        String sql = sbf.toString();
        sql=sql.substring(0,sql.length() - 1)+") ";

        String partitioned = dataParam.getPartitioned();
        String terminated = dataParam.getTerminate();
        String stored = dataParam.getStored();
        String location = dataParam.getLocation();

        if (StringUtils.isNotBlank(partitioned)) {
            sql=sql+"PARTITIONED BY("+partitioned+") ";
        }
        if(StringUtils.isNotBlank(terminated)){
            sql=sql+"ROW FORMAT DELIMITED FIELDS TERMINATED BY '"+terminated;
        }

        if (StringUtils.isNotBlank(stored)){
            sql=sql+"' STORED AS "+stored;
        }
        if (StringUtils.isNotBlank(location)) {
            sql=sql+" LOCATION '"+location+"'";
        }
        return sql;
    }
}


     /* *//* if (i==sqlMetaColumns.size()-1){*//*
                    sbf.append(column.getName()+" "+column.getType()+" ("+column.getLength()+")");
                *//*}else {
                    sbf.append(column.getName()+" "+column.getType()+" ("+column.getLength()+"), ");*//*

}else {
                *//*if (i==sqlMetaColumns.size()-1){*//*
        sbf.append(column.getName()+" "+column.getType());
               *//* }else {
                    sbf.append(column.getName()+" "+column.getType()+", ");
                }*//*
        }
            sbf.append(") row format delimited fields terminated by '\\t' stored as textfile");
        }*/
