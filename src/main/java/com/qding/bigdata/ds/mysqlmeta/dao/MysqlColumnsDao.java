package com.qding.bigdata.ds.mysqlmeta.dao;


import com.qding.bigdata.ds.model.mysqlMeta.MysqlColumns;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MysqlColumnsDao {

    List<MysqlColumns> getTableColumns(@Param("tableName") String tableName, @Param("dbName")String dbName);

}