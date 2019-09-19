package com.qding.bigdata.ds.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.dao.MonitorExecuteLogDao;
import com.qding.bigdata.ds.model.MonitorExecuteLog;
import com.qding.bigdata.ds.service.MonitorQueueLogService;

/**
 * Created by yanpf on 2017/7/21.
 */

@Service
public class MonitorQueueLogServiceImpl extends BaseServiceImpl<MonitorExecuteLog> implements MonitorQueueLogService {

    @Autowired
    MonitorExecuteLogDao monitorExecuteLogDao;

    @Override
    public BaseDao<MonitorExecuteLog> getDao() {
        return monitorExecuteLogDao;
    }

    @Override
    public List<MonitorExecuteLog> getMonitorExecuteLogByQueueId(String monitorQueueId) {
        log.info("通过monitorQueueId获取执行日志:{}" + monitorQueueId);
        if(StringUtils.isEmpty(monitorQueueId)){
            return null;
        }
        return monitorExecuteLogDao.getMonitorExecuteLogByQueueId(monitorQueueId);
    }
}
