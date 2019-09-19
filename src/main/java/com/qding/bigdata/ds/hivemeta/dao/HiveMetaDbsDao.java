package com.qding.bigdata.ds.hivemeta.dao;

import com.qding.bigdata.ds.model.hiveMeta.HiveMetaDbs;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface HiveMetaDbsDao {
    List<HiveMetaDbs> getAllDbs();
    HiveMetaDbs getDbByName(@Param("name") String name);
}