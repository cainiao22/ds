package com.qding.bigdata.ds.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.dao.MetaTableDao;
import com.qding.bigdata.ds.dao.MetaTableMonitorDao;
import com.qding.bigdata.ds.dao.MonitorQueueDao;
import com.qding.bigdata.ds.model.MonitorQueue;
import com.qding.bigdata.ds.service.MonitorQueueService;

/**
 * Created by yanpf on 2017/7/20.
 */
@Service
public class MonitorQueueServiceImpl extends BaseServiceImpl<MonitorQueue> implements MonitorQueueService {

    @Autowired
    MonitorQueueDao monitorQueueDao;

    @Autowired
    MetaTableMonitorDao metaTableMonitorDao;

    @Autowired
    MetaTableDao metaTableDao;

    private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 获取某个任务下的索引规则执行信息
     * @param monitorQueue
     * @return
     */
    @Override
    public SearchResult<MonitorQueue> getMonitorQueueByMetableId(MonitorQueue monitorQueue) {
        List<MonitorQueue> monitorQueues = super.list(monitorQueue);
        int count = monitorQueueDao.queryCount(monitorQueue);
        SearchResult<MonitorQueue> result = new SearchResult<MonitorQueue>();
        result.setCurrentPage(monitorQueue.getPage());
        result.setPageCount(monitorQueue.getPageCount());
        result.setRows(monitorQueues);
        result.setTotal(count);

        return result;
    }

    @Override
    public BaseDao<MonitorQueue> getDao() {
        return monitorQueueDao;
    }
}
