package com.qding.bigdata.ds.service.impl;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.dao.MetaFieldDao;
import com.qding.bigdata.ds.model.MetaField;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.service.MetaDbsService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/8/14 18:08
 * @description
 */

@Service
public class GPMetaDbsServiceImpl implements MetaDbsService {


    private MetaFieldDao dwMetaFieldDao;

    @Override
    public List<String> getAllDbs() {
        return Arrays.asList(Constant.META_TABLE_TYPES);
    }

    @Override
    public Result<List<MetaField>> getTableColumns(String tableName, String dbName) {
        MetaTable metaTable = new MetaTable();
        metaTable.setName(tableName);
        metaTable.setType(dbName);
        return Result.success(dwMetaFieldDao.getFiledInfo(metaTable));
    }
}
