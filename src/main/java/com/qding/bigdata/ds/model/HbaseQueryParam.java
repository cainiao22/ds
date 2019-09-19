package com.qding.bigdata.ds.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/5/9 16:17
 * @description
 */
public class HbaseQueryParam {

    private String tableName;

    private String rowKey;

    private List<String> family = new ArrayList<String>();

    private List<HbaseColumn> hbaseColumnList = new ArrayList<HbaseColumn>();

    private Integer maxVersions;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getRowKey() {
        return rowKey;
    }

    public void setRowKey(String rowKey) {
        this.rowKey = rowKey;
    }

    public List<String> getFamily() {
        return family;
    }

    public void setFamily(List<String> family) {
        this.family = family;
    }

    public List<HbaseColumn> getHbaseColumnList() {
        return hbaseColumnList;
    }

    public void setHbaseColumnList(List<HbaseColumn> hbaseColumnList) {
        this.hbaseColumnList = hbaseColumnList;
    }

    public Integer getMaxVersions() {
        return maxVersions;
    }

    public void setMaxVersions(Integer maxVersions) {
        this.maxVersions = maxVersions;
    }
}
