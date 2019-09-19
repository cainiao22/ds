package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.model.MetaField;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/8/13 15:12
 * @description
 */
public interface MetaDbsService {

    List<String> getAllDbs();

    Result<List<MetaField>> getTableColumns(String tableName, String dbName);

}
