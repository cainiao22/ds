package com.qding.bigdata.ds.mysqlmeta.dao;


import java.util.List;

public interface MysqlSchemaDao {
    List<String> getAllDbs();
}