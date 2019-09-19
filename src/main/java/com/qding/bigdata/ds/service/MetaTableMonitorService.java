package com.qding.bigdata.ds.service;

import java.util.List;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.model.MetaTableMonitor;

/**
 * Created by yanpf on 2017/7/17.
 */
public interface MetaTableMonitorService extends BaseService<MetaTableMonitor> {

    List<MetaTableMonitor> getListByMetaTableId(String metaTableId);

    Result<String> runMonitor(MetaTableMonitor metaTableMonitorParam);
}
