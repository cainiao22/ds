package com.qding.bigdata.ds.datatransform.model;

/**
 * Created by lzs on 2018/5/18.
 */
public class ConfigValueModel {
    /**
     * 数据库的库名
     */
    private String db;
    /**
     * name
     */
    private String name;
    /**
     * \数据库用户名
     */
    private String user;
    /**
     * \数据库用密码
     */
    private String password;
    /**
     * \数据库用的ip+port
     */
    private String url;
    /**
     * \数据库类型
     */
    private String dbtype;

    /**
     * \Postgresql schema
     */
    private String schema;

    public ConfigValueModel() {
    }

    public ConfigValueModel(String db, String name, String user, String password, String url, String dbtype, String schema) {
        this.db = db;
        this.name = name;
        this.user = user;
        this.password = password;
        this.url = url;
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

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
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
