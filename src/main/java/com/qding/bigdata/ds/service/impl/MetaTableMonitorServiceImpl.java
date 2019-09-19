package com.qding.bigdata.ds.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.dao.*;
import com.qding.bigdata.ds.enums.MonitorJobStatus;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.model.MonitorExecuteLog;
import com.qding.bigdata.ds.model.MonitorJobQueue;
import com.qding.bigdata.ds.util.SqlUtil;
import com.qding.bigdata.ds.util.UUIDUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.model.MetaTableMonitor;
import com.qding.bigdata.ds.service.MetaTableMonitorService;

/**
 * Created by yanpf on 2017/7/17.
 */
@Service
public class MetaTableMonitorServiceImpl extends BaseServiceImpl<MetaTableMonitor> implements MetaTableMonitorService {

    @Autowired
    private MetaTableMonitorDao metaTableMonitorDao;

    @Autowired
    private MetaTableDao metaTableDao;

    @Autowired
    private MonitorQueueDao monitorQueueDao;

    @Autowired
    MonitorExecuteLogDao monitorExecuteLogDao;

    @Override
    public List<MetaTableMonitor> getListByMetaTableId(String metaTableId) {
        log.info("根据metaTableId获取规则列表");
        return metaTableMonitorDao.getListByMetaTableId(metaTableId);
    }

    @Override
    public Result<String> runMonitor(MetaTableMonitor param) {
        if(StringUtils.isBlank(param.getId())){
            return Result.success();
        }
        MetaTableMonitor tableMonitor = metaTableMonitorDao.getById(param);
        if(tableMonitor == null){
            return Result.success();
        }
        addMonitorJobQueue(tableMonitor, Calendar.getInstance());
        return Result.success();
    }

    private void addMonitorJobQueue(MetaTableMonitor monitorJob, Calendar ca) {
        MonitorJobQueue queue = new MonitorJobQueue();
        queue.setId(UUIDUtil.createId());
        queue.setMonitorJobId(monitorJob.getId());
        queue.setMetaTableId(monitorJob.getMetaTableId());

        //获取表名
        MetaTable metaTableParam = new MetaTable();
        metaTableParam.setId(monitorJob.getMetaTableId());
        MetaTable etlJob = metaTableDao.getById(metaTableParam);
        if (null != etlJob) {
            queue.setDbType(etlJob.getDbType());
            queue.setType(etlJob.getType());
            queue.setTableName(etlJob.getName());
            queue.setTableAlias(etlJob.getAlias());
        } else { //如果没有找到这张表，那么这个规则就作废，不再加入
            return;
        }

        queue.setCreateTime(ca.getTime());
        queue.setScheduleTime(ca.getTime());
        //获取前一天
        ca.set(Calendar.DATE, ca.get(Calendar.DATE) - 1);
        queue.setDataDate(ca.getTime());
        ca.set(Calendar.DATE, ca.get(Calendar.DATE) + 1);

        queue.setStatus(MonitorJobStatus.Pending.name());
        queue.setPriority(monitorJob.getPriority());
        queue.setMetaTableId(monitorJob.getMetaTableId());
        queue.setSql(SqlUtil.parse(monitorJob.getMonitorSql(), queue.getScheduleTime()));
        queue.setJobUniqueId(DigestUtils.md5Hex(queue.getMonitorJobId() + queue.getSql()));
        queue.setHashCode(Math.abs(queue.getId().hashCode() % 100));
        if (monitorQueueDao.checkJobInQueue(queue) == 0) {
            monitorQueueDao.addMonitorJobQueue(queue);
            MonitorExecuteLog executeLog = new MonitorExecuteLog();
            executeLog.setId(UUIDUtil.createId());
            executeLog.setMonitorQueueId(queue.getId());
            executeLog.setCreateTime(new Date());
            executeLog.setMonitorLog("手动加入作业,作业状态变为:Pending");
            monitorExecuteLogDao.save(executeLog);
        }
    }

    @Override
    public BaseDao<MetaTableMonitor> getDao() {
        return metaTableMonitorDao;
    }
}
