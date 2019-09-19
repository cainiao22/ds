package com.qding.bigdata.ds.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.dao.MonitorExecuteResultDao;
import com.qding.bigdata.ds.model.MonitorExecuteResult;
import com.qding.bigdata.ds.service.MonitorExecutorResultService;

/**
 * Created by yanpf on 2017/7/19.
 */

@Service
public class MonitorExecutorResultServiceImpl extends BaseServiceImpl<MonitorExecuteResult> implements MonitorExecutorResultService {

    @Autowired
    MonitorExecuteResultDao monitorExecuteResultDao;

    @Override
    public BaseDao<MonitorExecuteResult> getDao() {
        return monitorExecuteResultDao;
    }

    @Override
    public SearchResult<MonitorExecuteResult> queryList(MonitorExecuteResult param) {
        SearchResult<MonitorExecuteResult> result = new SearchResult<MonitorExecuteResult>();
        result.setCurrentPage(param.getPage());
        result.setPageCount(param.getPageCount());
        List<MonitorExecuteResult> list = super.list(param);
        result.setRows(list);
        int totalCount = monitorExecuteResultDao.queryCount(param);
        result.setTotal(totalCount);
        return result;
    }
}
