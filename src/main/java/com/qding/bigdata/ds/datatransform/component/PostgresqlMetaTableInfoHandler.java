package com.qding.bigdata.ds.datatransform.component;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.dao.ConfigDao;
import com.qding.bigdata.ds.datatransform.columnType.PostgresqlColumnType;
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
public class PostgresqlMetaTableInfoHandler implements MetaTableInfo {
    @Autowired
    ConfigDao configDao;
    @Autowired
    TableDao  tableDao;
    public  String driverName = CommData.POSTGRESQL_CLASSDRIVER;
    @Override
    public MetaRecord getMetaRecord(DataInfo dataParam) {

        MetaRecord psqlCommMetaRecord= new MetaRecord();

        Config metaConfig= configDao.queryConfigByKey(dataParam.getMetaConfigkey());
        if (metaConfig!=null){
            String metaConfigValue= metaConfig.getConfigValue();
            ConfigValueModel metaConfigValueModel= JSON.parseObject(metaConfigValue, ConfigValueModel.class);
            //表信息
            psqlCommMetaRecord= tableDao.queryPostgresqlTableByTbName(dataParam.getTableName(),metaConfigValueModel,driverName);
        }

        //column type 本地到公共
        List<MetaColumn> psqlMetaColumns = psqlCommMetaRecord.getColumns();
        try {

            JdbcConfig psqlCommJdbcCon = PostgresqlColumnType.getPostgresqlCommColumnType();
            HashMap<String, String> writerTypes = psqlCommJdbcCon.getWriterTypes();
            for (MetaColumn column: psqlMetaColumns) {
                String psqlCommColumnType=writerTypes.get(column.getType());
                column.setType(psqlCommColumnType);
            }
            psqlCommMetaRecord.setColumns(psqlMetaColumns);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return psqlCommMetaRecord;
    }
}
