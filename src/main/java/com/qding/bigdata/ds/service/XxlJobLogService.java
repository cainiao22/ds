package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.model.scheduler.XxlJobLog;
import com.qding.bigdata.ds.model.scheduler.XxlJobLogParam;
import com.qding.bigdata.ds.model.scheduler.XxlJobTriggerHistory;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/3/20 10:25
 * @description
 */
public interface XxlJobLogService {
    SearchResult<XxlJobLog> schedulerJobLogPageList(XxlJobLogParam param);
    List<XxlJobTriggerHistory> getLogDetail(Integer jobLogId);
}
