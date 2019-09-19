package com.qding.bigdata.ds.model;

/**
 * Created by syj on 2018/6/14.
 */
public class TableConfig extends Config{
    private String db;//数据库名

    private String name;//描述

    private String password;//密码

    private String url;//路径

    private String user;//用户名

    private String dbtype;//数据库类型
    private String schema;
    public TableConfig() {

    }

    public TableConfig(String db, String name, String password, String url, String user, String dbtype, String schema) {
        this.db = db;
        this.name = name;
        this.password = password;
        this.url = url;
        this.user = user;
        this.dbtype = dbtype;
        this.schema = schema;
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getDbtype() {
        return dbtype;
    }

    public void setDbtype(String dbtype) {
        this.dbtype = dbtype;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }
}
