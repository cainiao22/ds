package com.qding.bigdata.ds.datatransform.transport;

import com.qding.bigdata.ds.datatransform.dao.HiveDao;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.Callable;

/**
 * Created by lzs on 2018/6/4.
 */
public class InsertCallable implements Callable<Boolean> {
    private String tableName;
    private ConfigValueModel targetConfigValueModel;
    private ConfigValueModel metaConfigValueModel;
    private String districtField;
    private int index;

    public InsertCallable(String tableName, ConfigValueModel targetConfigValueModel, ConfigValueModel metaConfigValueModel, String districtField, int index) {
        this.tableName = tableName;
        this.targetConfigValueModel = targetConfigValueModel;
        this.metaConfigValueModel = metaConfigValueModel;
        this.districtField = districtField;
        this.index = index;
    }

    @Autowired
    HiveDao hiveDao;
    @Override
    public Boolean call() throws Exception {
        Boolean bo=hiveDao.insertIntoTable(tableName,targetConfigValueModel,metaConfigValueModel,index,districtField);
        return bo;
    }
}
