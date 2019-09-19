package com.qding.bigdata.ds.datatransform.service.impl;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.dao.ConfigDao;
import com.qding.bigdata.ds.dao.DataInfoDao;
import com.qding.bigdata.ds.datatransform.commonData.TransResult;
import com.qding.bigdata.ds.datatransform.component.MetaTableInfo;
import com.qding.bigdata.ds.datatransform.dao.HiveDao;
import com.qding.bigdata.ds.datatransform.dao.TableDao;
import com.qding.bigdata.ds.datatransform.enums.CommonDataTypeEnum;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;
import com.qding.bigdata.ds.datatransform.service.TransformDataService;
import com.qding.bigdata.ds.datatransform.transport.TableSqlFactory;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.DataInfoList;
import com.qding.bigdata.ds.util.UUIDUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;


/**
 * Created by lzs on 2018/5/17.
 */
@Service
public class TransformDataServiceImpl implements TransformDataService {

    Logger logger = LoggerFactory.getLogger(TransformDataServiceImpl.class);

    @Autowired
    ConfigDao configDao;
    @Autowired
    TableDao tableDao;
    @Autowired
    HiveDao hiveDao;
    @Autowired
    Map<String, MetaTableInfo> metaTableHandlerMap;
    @Autowired
    DataInfoDao dataInfoDao;
    @Override
    public TransResult execute(DataInfoList dataParam) {

        TransResult transResult= new TransResult();
        MetaRecord sqlMetaRecord= new MetaRecord();
        if (null!=dataParam){
            String handler = CommonDataTypeEnum.getHandler(dataParam.getMetaDataType());
            sqlMetaRecord = metaTableHandlerMap.get(handler).getMetaRecord(dataParam);

        }

        ConfigValueModel metaConfigValueModel=null;
        Config metaConfig= configDao.queryConfigByKey(dataParam.getMetaConfigkey());
        if (metaConfig!=null) {
            String metaConfigValue = metaConfig.getConfigValue();
            metaConfigValueModel = JSON.parseObject(metaConfigValue, ConfigValueModel.class);
        }

        Config targetConfig= configDao.queryConfigByKey(dataParam.getTargetConfigkey());
        ConfigValueModel targetConfigValueModel=null;
        if (targetConfig!=null){
            String targetConfigValue = targetConfig.getConfigValue();
            targetConfigValueModel =JSON.parseObject(targetConfigValue,ConfigValueModel.class);
        }

        //公共到本地
        String sql = TableSqlFactory.creatHiveTableSql(dataParam,sqlMetaRecord);
        logger.info(sql);

        Boolean flag1= hiveDao.creatTable(sql, targetConfigValueModel);
        logger.info(Boolean.toString(flag1));

        if (flag1==false){
            dataParam.setId(UUIDUtil.createId());
            dataParam.setSqlStatement(sql);
            dataParam.setCreateTime(new Date());
            dataInfoDao.save(dataParam);
            transResult.setCode(0);
            transResult.setMerrage("建表成功");
        }else {
            transResult.setCode(1);
            transResult.setMerrage("建表失败:"+sql);
        }
        return transResult;
    }

    public TransResult insert(DataInfoList dataParam){
        ConfigValueModel metaConfigValueModel=null;
        Config metaConfig= configDao.queryConfigByKey(dataParam.getMetaConfigkey());
        if (metaConfig!=null) {
            String metaConfigValue = metaConfig.getConfigValue();
            metaConfigValueModel = JSON.parseObject(metaConfigValue, ConfigValueModel.class);
        }

        Config targetConfig= configDao.queryConfigByKey(dataParam.getTargetConfigkey());
        ConfigValueModel targetConfigValueModel=null;
        if (targetConfig!=null){
            String targetConfigValue = targetConfig.getConfigValue();
            targetConfigValueModel =JSON.parseObject(targetConfigValue,ConfigValueModel.class);
        }
        //插入数据
        hiveDao.ThreadPoolInsert(dataParam.getTableName(),targetConfigValueModel,metaConfigValueModel,dataParam.getDistrictField());
        Boolean flag2 = hiveDao.queryFromHive(dataParam.getTableName(), targetConfigValueModel);
        TransResult transResult= new TransResult();
        if (flag2==true){
            transResult.setCode(0);
            transResult.setMerrage("导入成功");
        }else {
            transResult.setCode(1);
            transResult.setMerrage("导入失败");
        }
        return transResult;
    }
}


/* List<Future<Boolean>> futures=new ArrayList<Future<Boolean>>();
        for (int i=0;i<10;i++){
            Future<Boolean> future = hiveDao.ThreadPoolInsert(dataParam.getTableName(), targetConfigValueModel, metaConfigValueModel, dataParam.getDistrictField(), i);
            futures.add(future);
        }*/

        /*for (int i=0;i<10;i++){
            hiveDao.ThreadPoolInsert(dataParam.getTableName(),targetConfigValueModel,metaConfigValueModel,dataParam.getDistrictField(),i);
            *//*System.out.println(flag2);*//*
        }*/
