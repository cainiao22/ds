package com.qding.bigdata.ds.datatransform.enums;

/**
 * Created by yanpf on 2017/7/27.
 */
public enum CommonDataTypeEnum {

    MYSQL("mysql", "mysqlMetaTableInfoHandler"),
    HIVE("hive","hiveMetaTableInfoHandler"),
    POSTGRESQL("postgresql","postgresqlMetaTableInfoHandler");


    String dataSource;
    String handlerName;

    CommonDataTypeEnum(String dataSource, String handlerName) {
        this.dataSource = dataSource;
        this.handlerName = handlerName;
    }

    public String getDataSource() {
        return dataSource;
    }

    public String getHandlerName() {
        return handlerName;
    }

    public static String getHandler(String dataSource){
        for (CommonDataTypeEnum handlerEnum : CommonDataTypeEnum.values()) {
            if(handlerEnum.getDataSource().equals(dataSource)){
                return handlerEnum.getHandlerName();
            }
        }
        return null;
    }

    public static String getDataSource(String handlerName){
        for (CommonDataTypeEnum handlerEnum : CommonDataTypeEnum.values()) {
            if(handlerEnum.getHandlerName().equals(handlerName)){
                return handlerEnum.getDataSource();
            }
        }
        return null;
    }
}
