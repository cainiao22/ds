package com.qding.bigdata.ds.hivemeta.service.impl;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.hivemeta.dao.HiveMetaColumnsDao;
import com.qding.bigdata.ds.hivemeta.dao.HiveMetaDbsDao;
import com.qding.bigdata.ds.hivemeta.dao.HiveMetaTblsDao;
import com.qding.bigdata.ds.model.MetaField;
import com.qding.bigdata.ds.model.hiveMeta.HiveColumns;
import com.qding.bigdata.ds.model.hiveMeta.HiveMetaDbs;
import com.qding.bigdata.ds.model.hiveMeta.HiveMetaTbls;
import com.qding.bigdata.ds.service.MetaDbsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/8/13 15:14
 * @description
 */

@Service
public class HiveMetaDbsServiceImpl implements MetaDbsService {


    @Autowired
    private HiveMetaDbsDao dbsDao;

    @Autowired
    private HiveMetaTblsDao tblsDao;

    @Autowired
    private HiveMetaColumnsDao hiveMetaColumnsDao;

    @Override
    public List<String> getAllDbs() {
        List<HiveMetaDbs> allDbs = dbsDao.getAllDbs();
        List<String> result = new ArrayList<String>();
        for (HiveMetaDbs allDb : allDbs) {
            result.add(allDb.getName());
        }
        return result;
    }

    @Override
    public Result<List<MetaField>> getTableColumns(String tableName, String dbName) {
        HiveMetaDbs hiveMetaDbs = dbsDao.getDbByName(dbName.toLowerCase());
        if(hiveMetaDbs == null){
            return Result.failed(401, "该数据库不存在," + dbName);
        }
        HiveMetaTbls table = tblsDao.getTable(hiveMetaDbs.getDbId(), tableName.toLowerCase());
        if(table == null){
            return Result.failed(401, "该表不存在, dbName:"+ dbName + " tableName:" + tableName);
        }
        List<HiveColumns> hiveColumnsList = hiveMetaColumnsDao.getColumnsBySdId(table.getSdId());
        List<MetaField> metaFieldList = new ArrayList<MetaField>();
        if(hiveColumnsList != null){
            for (HiveColumns hiveColumns : hiveColumnsList) {
                MetaField metaField = new MetaField();
                metaField.setName(hiveColumns.getColumnName());
                metaField.setType(hiveColumns.getTypeName());
                metaField.setDescription(hiveColumns.getComment());
                metaFieldList.add(metaField);
            }
        }
        return Result.success(metaFieldList);
    }

}
