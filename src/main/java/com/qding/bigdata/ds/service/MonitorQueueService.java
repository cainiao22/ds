package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.model.MonitorQueue;

/**
 * Created by yanpf on 2017/7/20.
 */
public interface MonitorQueueService extends BaseService<MonitorQueue> {
    SearchResult<MonitorQueue> getMonitorQueueByMetableId(MonitorQueue monitorQueue);
}
