package com.qding.bigdata.ds.scheduler.service;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.model.scheduler.SchedulerJob;
import com.qding.bigdata.ds.scheduler.model.Graph;
import com.qding.bigdata.ds.service.BaseService;

public interface SchedulerService extends BaseService<SchedulerJob> {

	Result saveOrUpdate(SchedulerJob job);

	Result deleteSchedulerJob(SchedulerJob jobParam);

	void fillLatestExecuteLog(SchedulerJob jobParam, int size);

	Graph<SchedulerJob> getGraph(SchedulerJob jobParam);

}
