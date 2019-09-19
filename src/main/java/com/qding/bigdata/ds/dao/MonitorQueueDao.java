package com.qding.bigdata.ds.dao;

import java.util.List;

import com.qding.bigdata.ds.model.MonitorJobQueue;
import com.qding.bigdata.ds.model.MonitorQueue;
import org.apache.ibatis.annotations.Param;

public interface MonitorQueueDao extends BaseDao<MonitorQueue> {
    List<MonitorQueue> query(MonitorQueue param);
    int queryCount(MonitorQueue param);

    void addMonitorJobQueue(MonitorJobQueue queue);

    int checkJobInQueue(MonitorJobQueue queue);

    List<MonitorJobQueue> listPendingQueue(@Param("currentIndex") int currentIndex, @Param("totalCount") int totalCount);

    void updateJobStatus(MonitorJobQueue monitorJobQueue);

    List<MonitorJobQueue> queryByCondition(MonitorJobQueue monitorJobQueue);

    void updateExecutorResultId(MonitorJobQueue monitorJobQueue);
}