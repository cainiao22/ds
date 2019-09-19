package com.qding.bigdata.ds.dao;

import java.util.List;

import com.qding.bigdata.ds.model.MonitorExecuteLog;

public interface MonitorExecuteLogDao extends BaseDao<MonitorExecuteLog> {
    List<MonitorExecuteLog> getMonitorExecuteLogByQueueId(String monitorQueueId);
}