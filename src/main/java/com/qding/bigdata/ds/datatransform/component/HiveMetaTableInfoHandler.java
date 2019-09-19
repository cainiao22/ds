package com.qding.bigdata.ds.datatransform.component;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.dao.ConfigDao;
import com.qding.bigdata.ds.datatransform.columnType.HiveColumnType;
import com.qding.bigdata.ds.datatransform.commonData.CommData;
import com.qding.bigdata.ds.datatransform.dao.TableDao;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.datatransform.model.DataInfo;
import com.qding.bigdata.ds.datatransform.model.JdbcConfig;
import com.qding.bigdata.ds.datatransform.model.MetaColumn;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;
import com.qding.bigdata.ds.model.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

/**
 * Created by lzs on 2018/5/22.
 */
@Component
public class HiveMetaTableInfoHandler implements MetaTableInfo {

    @Autowired
    ConfigDao configDao;
    @Autowired
    TableDao tableDao;
    public  String driverName = CommData.HIVE_CLASSDRIVER;
    @Override
    public MetaRecord getMetaRecord(DataInfo dataParam) {
        MetaRecord hiveCommMetaRecord=new MetaRecord();

        Config metaConfig= configDao.queryConfigByKey(dataParam.getMetaConfigkey());
        if (metaConfig!=null){
            String metaConfigValue= metaConfig.getConfigValue();
            ConfigValueModel metaConfigValueModel= JSON.parseObject(metaConfigValue, ConfigValueModel.class);
            //表信息
            hiveCommMetaRecord= tableDao.queryTableByTbName(dataParam.getTableName(),metaConfigValueModel,driverName);
        }
        //column type 本地到公共
        List<MetaColumn> hiveMetaColumns = hiveCommMetaRecord.getColumns();
        try {
            JdbcConfig hiveCommJdbcCon = HiveColumnType.getHiveCommColumnType();
            HashMap<String, String> writerTypes = hiveCommJdbcCon.getWriterTypes();
            for (MetaColumn column: hiveMetaColumns) {
                String hiveCommColumnType=writerTypes.get(column.getType());
                column.setType(hiveCommColumnType);
            }
            hiveCommMetaRecord.setColumns(hiveMetaColumns);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hiveCommMetaRecord;
    }
}
