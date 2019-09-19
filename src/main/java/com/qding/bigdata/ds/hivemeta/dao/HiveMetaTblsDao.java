package com.qding.bigdata.ds.hivemeta.dao;

import com.qding.bigdata.ds.model.hiveMeta.HiveMetaTbls;
import org.apache.ibatis.annotations.Param;

public interface HiveMetaTblsDao {
    HiveMetaTbls getTable(@Param("dbId") Long dbId, @Param("tableName") String tableName);
}