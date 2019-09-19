package com.qding.bigdata.ds.enums;

/**
 * @author yanpf
 * @date 2018/8/17 15:56
 * @description
 */
public enum DBTypeEnum {

    mysql("mysqlMetaDbsServiceImpl"), hive("hiveMetaDbsServiceImpl"), postgresql("GPMetaDbsServiceImpl");

    public final String handlerName;

    DBTypeEnum(String handlerName) {
        this.handlerName = handlerName;
    }
}
