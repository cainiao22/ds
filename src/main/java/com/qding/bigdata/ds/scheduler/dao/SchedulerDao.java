package com.qding.bigdata.ds.scheduler.dao;

import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.model.scheduler.SchedulerJob;
import com.qding.bigdata.ds.model.scheduler.SchedulerJobDependency;

import java.util.List;

public interface SchedulerDao extends BaseDao<SchedulerJob> {
	void deleteDependency(SchedulerJob job);

	void saveDependency(SchedulerJobDependency schedulerJobDependency);

	List<SchedulerJob> getchildrenJobs(SchedulerJob job);
}
