package com.qding.bigdata.ds.dao;

import com.qding.bigdata.ds.model.MonitorExecuteResult;

public interface MonitorExecuteResultDao extends BaseDao<MonitorExecuteResult> {

    void save(MonitorExecuteResult record);



    int queryCount(MonitorExecuteResult param);
}