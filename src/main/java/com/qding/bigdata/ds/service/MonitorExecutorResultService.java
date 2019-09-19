package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.model.MonitorExecuteResult;


/**
 * Created by yanpf on 2017/7/19.
 */
public interface MonitorExecutorResultService extends BaseService<MonitorExecuteResult> {

    SearchResult<MonitorExecuteResult> queryList(MonitorExecuteResult param);
}
