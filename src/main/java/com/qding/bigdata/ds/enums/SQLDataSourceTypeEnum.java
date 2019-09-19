package com.qding.bigdata.ds.enums;

/**
 * Created by yanpf on 2017/10/13.
 */
public enum SQLDataSourceTypeEnum {
    GPSQL("SQL"),
    GPSQL116("SQL116"),
    GPSQL242("SQL242"),
    DRUIDSQL("DRUID"),
    ESSQL("ES"),
    PRESTO("PRESTO"),
    MYSQL("MYSQL"),
    IMPALA("IMPALA");

    public final String name;

    SQLDataSourceTypeEnum(String name){
        this.name = name;
    }
}
