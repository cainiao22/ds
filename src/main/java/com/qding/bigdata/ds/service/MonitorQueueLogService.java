package com.qding.bigdata.ds.service;

import java.util.List;

import com.qding.bigdata.ds.model.MonitorExecuteLog;

/**
 * Created by yanpf on 2017/7/21.
 */
public interface MonitorQueueLogService extends BaseService<MonitorExecuteLog> {

    List<MonitorExecuteLog> getMonitorExecuteLogByQueueId(String monitorQueueId);
}
