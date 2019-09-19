package com.qding.bigdata.ds.mysqlmeta.service.impl;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.model.MetaField;
import com.qding.bigdata.ds.model.mysqlMeta.MysqlColumns;
import com.qding.bigdata.ds.mysqlmeta.dao.MysqlColumnsDao;
import com.qding.bigdata.ds.mysqlmeta.dao.MysqlSchemaDao;
import com.qding.bigdata.ds.service.MetaDbsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/8/14 17:32
 * @description
 */

@Service
public class MysqlMetaDbsServiceImpl implements MetaDbsService {

    @Autowired
    MysqlSchemaDao mysqlSchemaDao;

    @Autowired
    MysqlColumnsDao mysqlColumnsDao;

    /**
     * select SCHEMA_NAME from information_schema.SCHEMATA
     * @return
     */
    @Override
    public List<String> getAllDbs() {
        return mysqlSchemaDao.getAllDbs();
    }


    /**
     * select COLUMN_NAME, COLUMN_COMMENT, DATA_TYPE from information_schema.COLUMNS where table_name = 'ds_config' and TABLE_SCHEMA = 'devds';
     * @param tableName
     * @param dbName
     * @return
     */
    @Override
    public Result<List<MetaField>> getTableColumns(String tableName, String dbName) {
        List<MysqlColumns> mysqlColumnsList = mysqlColumnsDao.getTableColumns(tableName, dbName);
        List<MetaField> result = new ArrayList<MetaField>();
        if(!CollectionUtils.isEmpty(mysqlColumnsList)){
            for (MysqlColumns columns : mysqlColumnsList) {
                MetaField metaField = new MetaField();
                metaField.setName(columns.getColumnName());
                metaField.setType(columns.getDataType());
                metaField.setDescription(columns.getColumnComment());
                result.add(metaField);
            }
        }
        return Result.success(result);
    }
}
