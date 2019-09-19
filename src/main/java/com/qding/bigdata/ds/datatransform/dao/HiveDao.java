package com.qding.bigdata.ds.datatransform.dao;

import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import org.springframework.stereotype.Repository;

/**
 * Created by lzs on 2018/5/18.
 */
@Repository
public interface HiveDao {
    Boolean creatTable(String sql, ConfigValueModel targetConfigValueModel);
    Boolean insertIntoTable(String tableName, ConfigValueModel targetConfigValueModel, ConfigValueModel metaConfigValueModel, long index,String districtField);
    void ThreadPoolInsert(final String tableName, final ConfigValueModel targetConfigValueModel, final ConfigValueModel metaConfigValueModel, final String districtField);
    Boolean queryFromHive(String tableName,ConfigValueModel targetConfigValueModel);
}
