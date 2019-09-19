package com.qding.bigdata.ds.datatransform.dao;

import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.datatransform.model.MetaColumn;
import com.qding.bigdata.ds.datatransform.model.RowColumnNamAndVal;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;

import java.util.List;

/**
 * Created by lzs on 2018/5/17.
 */
public interface TableDao {
    MetaRecord queryTableByTbName(String tableName, ConfigValueModel metaConfigValueModel,String driverName);
    List<MetaColumn> queryColumnByTbName(String tableName, ConfigValueModel metaConfigValueModel,String driverName);
    MetaRecord queryPostgresqlTableByTbName(String tableName, ConfigValueModel metaConfigValueModel,String driverName);
    List<MetaColumn> queryPostgresqlColumnByTbName(String tableName, ConfigValueModel metaConfigValueModel,String driverName);
    List<List<RowColumnNamAndVal>> queryTableInfo(String tableName, ConfigValueModel metaConfigValueModel, long index,String districtField,String driverName);
}
