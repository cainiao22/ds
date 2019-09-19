package com.qding.bigdata.ds.datatransform.transport.sql;

import com.qding.bigdata.ds.datatransform.model.MetaColumn;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;

/**
 * @author yanpf
 * @date 2018/4/26 16:06
 * @description
 */
public class SqlCreateFactory {

    public static String buildCreateSql(MetaRecord record){
        StringBuffer sb = new StringBuffer("CREATE EXTERN TABLE IF NOT EXIST");
        sb.append(record.getTableName())
                .append("(");
        for (MetaColumn column : record.getColumns()) {
            sb.append(column.getName()).append(" ").append(javaTypeToHiveType(column.getType()));
        }
        sb.setLength(sb.length() - 1);
        sb.append(")");
        return sb.toString();
    }

    static String javaTypeToHiveType(String type){
        String originDataType = type.toLowerCase();
        String hiveDataType;
        if (originDataType.startsWith("varchar")) {
            hiveDataType = "string";
        } else if (originDataType.startsWith("integer")) {
            hiveDataType = "int";
        } else if (originDataType.startsWith("bigint")) {
            hiveDataType = "bigint";
        } else {
            hiveDataType = originDataType;
        }

        return hiveDataType;
    }
}
