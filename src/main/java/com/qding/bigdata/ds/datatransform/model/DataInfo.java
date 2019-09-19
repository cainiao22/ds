package com.qding.bigdata.ds.datatransform.model;

import java.io.Serializable;

/**
 * Created by lzs on 2018/5/21.
 */
public class DataInfo implements Serializable {

    private static final long serialVersionUID = 8700990881989619714L;

    private String metaDataType;//原始数据库类型
    private String metaConfigkey;//原始数据库key
    private String targetDataType;//目标数据库类型
    private String targetConfigkey;//目标数据库key
    private String tableName;//源表名
    private String targetTableName;//目标表名
    private String districtField;//分片字段
    private String partitioned;//分区字段
    private String terminate;//插入hive数据库时需要的
    private String stored;//插入hive数据库时需要的
    private String location;//插入hive数据库时需要的
    private String partitionvalue;//插入hive时的key和value
    private String alias;//中文名
    private String ownerd;//负责人

    public DataInfo() {
    }

    public DataInfo(String metaDataType, String metaConfigkey, String targetDataType, String targetConfigkey, String tableName, String targetTableName, String districtField, String partitioned, String terminate, String stored, String location, String partitionvalue, String alias, String ownerd) {
        this.metaDataType = metaDataType;
        this.metaConfigkey = metaConfigkey;
        this.targetDataType = targetDataType;
        this.targetConfigkey = targetConfigkey;
        this.tableName = tableName;
        this.targetTableName = targetTableName;
        this.districtField = districtField;
        this.partitioned = partitioned;
        this.terminate = terminate;
        this.stored = stored;
        this.location = location;
        this.partitionvalue = partitionvalue;
        this.alias = alias;
        this.ownerd = ownerd;
    }

    public String getTargetTableName() {
        return targetTableName;
    }

    public void setTargetTableName(String targetTableName) {
        this.targetTableName = targetTableName;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getMetaDataType() {
        return metaDataType;
    }

    public void setMetaDataType(String metaDataType) {
        this.metaDataType = metaDataType;
    }

    public String getMetaConfigkey() {
        return metaConfigkey;
    }

    public void setMetaConfigkey(String metaConfigkey) {
        this.metaConfigkey = metaConfigkey;
    }

    public String getTargetDataType() {
        return targetDataType;
    }

    public void setTargetDataType(String targetDataType) {
        this.targetDataType = targetDataType;
    }

    public String getTargetConfigkey() {
        return targetConfigkey;
    }

    public void setTargetConfigkey(String targetConfigkey) {
        this.targetConfigkey = targetConfigkey;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getDistrictField() {
        return districtField;
    }

    public void setDistrictField(String districtField) {
        this.districtField = districtField;
    }

    public String getPartitioned() {
        return partitioned;
    }

    public void setPartitioned(String partitioned) {
        this.partitioned = partitioned;
    }

    public String getTerminate() {
        return terminate;
    }

    public void setTerminate(String terminate) {
        this.terminate = terminate;
    }

    public String getStored() {
        return stored;
    }

    public void setStored(String stored) {
        this.stored = stored;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPartitionvalue() {
        return partitionvalue;
    }

    public void setPartitionvalue(String partitionvalue) {
        this.partitionvalue = partitionvalue;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getOwnerd() {
        return ownerd;
    }

    public void setOwnerd(String ownerd) {
        this.ownerd = ownerd;
    }
}
