package com.qding.bigdata.ds.model;

import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;

public class DataxConfigFile extends ConfigValueModel{
    /**
     * ID
     */
    private String id;
    /**
     * 数据库表名
     */
    private String tableName;
    /**
     * 源数据库类型
     */
    private String dataBaseType;
    /**
     * 源数据库
     */
    private String dbNameSelect;
    /**
     * 数据库帐号
     */
    private String username;
    /**
     * 数据库密码
     */
    private String password;
    /**
     * 数据库地址
     */
    private String jdbcUrl;
    /**
     * HDFS地址
     */
    private String defaultFS;
    /**
     * 路径
     */
    private String path;
    /**
     * 生成文件的名称
     */
    private String fileName;
    /**
     * 分割符
     */
    private String fieldDelimiter;
    /**
     * writeMode
     */
    private String writeMode;
    /**
     * 查询SQL
     */
    private String querySql;
    /**
     * 压缩格式
     */
    private String compress;
    /**
     * 接收数据库字段
     */
    private String configValue;


    public String getDbNameSelect() {
        return dbNameSelect;
    }

    public void setDbNameSelect(String dbNameSelect) {
        this.dbNameSelect = dbNameSelect;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getJdbcUrl() {
        return jdbcUrl;
    }

    public void setJdbcUrl(String jdbcUrl) {
        this.jdbcUrl = jdbcUrl;
    }

    public String getDefaultFS() {
        return defaultFS;
    }

    public void setDefaultFS(String defaultFS) {
        this.defaultFS = defaultFS;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFieldDelimiter() {
        return fieldDelimiter;
    }

    public void setFieldDelimiter(String fieldDelimiter) {
        this.fieldDelimiter = fieldDelimiter;
    }

    public String getWriteMode() {
        return writeMode;
    }

    public void setWriteMode(String writeMode) {
        this.writeMode = writeMode;
    }

    public String getQuerySql() {
        return querySql;
    }

    public void setQuerySql(String querySql) {
        this.querySql = querySql;
    }

    public String getCompress() {
        return compress;
    }

    public void setCompress(String compress) {
        this.compress = compress;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    public String getDataBaseType() {
        return dataBaseType;
    }

    public void setDataBaseType(String dataBaseType) {
        this.dataBaseType = dataBaseType;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    @Override
    public String toString() {
        return "DataxConfigFile{" +
                "id='" + id + '\'' +
                ", dbNameSelect='" + dbNameSelect + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", jdbcUrl='" + jdbcUrl + '\'' +
                ", defaultFS='" + defaultFS + '\'' +
                ", path='" + path + '\'' +
                ", fileName='" + fileName + '\'' +
                ", fieldDelimiter='" + fieldDelimiter + '\'' +
                ", writeMode='" + writeMode + '\'' +
                ", querySql='" + querySql + '\'' +
                ", compress='" + compress + '\'' +
                ", configValue='" + configValue + '\'' +
                ", dataBaseType='" + dataBaseType + '\'' +
                ", tableName='" + tableName + '\'' +
                '}';
    }
}
