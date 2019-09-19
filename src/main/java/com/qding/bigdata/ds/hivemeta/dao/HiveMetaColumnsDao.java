package com.qding.bigdata.ds.hivemeta.dao;


import com.qding.bigdata.ds.model.hiveMeta.HiveColumns;

import java.util.List;

public interface HiveMetaColumnsDao {
    List<HiveColumns> getColumnsBySdId(Long sdId);
}