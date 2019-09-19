package com.qding.bigdata.ds.datatransform.record;

import com.qding.bigdata.ds.datatransform.model.MetaColumn;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/4/26 10:53
 * @description
 */
public class MetaRecord implements Record {

    private List<MetaColumn> columns = new ArrayList<MetaColumn>();
    private String tableName;
    private String comment;

    public List<MetaColumn> getColumns() {
        return columns;
    }

    public void setColumns(List<MetaColumn> columns) {
        this.columns = columns;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {

        StringBuffer sb = new StringBuffer("CREATE TABLE ");
        sb.append(tableName).append("(");
        for (MetaColumn column : columns) {
            sb.append(column.getName())
                    .append(" ")
                    .append(column.getType());
            if(column.getLength() != null){
                sb.append("(").append(column.getLength()).append(")");
            }
            sb.append(",");
        }
        sb.setLength(sb.length() - 1);
        sb.append(")");
        return sb.toString();
    }
}
