package com.qding.bigdata.ds.service.impl;

import com.qding.bigdata.ds.common.PageResult;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.model.scheduler.XxlJobLog;
import com.qding.bigdata.ds.model.scheduler.XxlJobLogParam;
import com.qding.bigdata.ds.model.scheduler.XxlJobTriggerHistory;
import com.qding.bigdata.ds.scheduler.dao.XxlJobLogDao;
import com.qding.bigdata.ds.scheduler.dao.XxlJobTriggerHistoryDao;
import com.qding.bigdata.ds.service.XxlJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/3/20 10:25
 * @description
 */

@Service
public class XxlJobLogServiceImpl implements XxlJobLogService {

    @Autowired
    XxlJobLogDao xxlJobLogDao;

    @Autowired
    XxlJobTriggerHistoryDao triggerHistoryDao;

    @Override
    public SearchResult<XxlJobLog> schedulerJobLogPageList(XxlJobLogParam param) {
        List<XxlJobLog> xxlJobLogList = xxlJobLogDao.pageList(param.getOffset(),
                param.getPageCount(),
                param.getJobGroup(),
                param.getJobId(),
                param.getQueryStartTime(),
                param.getQueryEndTime(),
                param.getStatus()
                );
        int count = xxlJobLogDao.pageListCount(param.getOffset(),
                param.getPageCount(),
                param.getJobGroup(),
                param.getJobId(),
                param.getQueryStartTime(),
                param.getQueryEndTime(),
                param.getStatus());

        SearchResult<XxlJobLog> result = new SearchResult<XxlJobLog>();
        result.setCurrentPage(param.getPage());
        result.setRows(xxlJobLogList);
        result.setPageCount(param.getPageCount());
        result.setTotal(count);

        return result;
    }

    @Override
    public List<XxlJobTriggerHistory> getLogDetail(Integer jobLogId) {
        List<XxlJobTriggerHistory> list = triggerHistoryDao.selectByJobLogId(jobLogId);
        return list;
    }


}
