package com.qding.bigdata.ds.model.scheduler;

import com.qding.bigdata.ds.model.BaseModel;

public class SchedulerJobDependency extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer jobId; // 主键ID (JobKey.name)
	private Integer dependencyJobId; // 依赖的job ID (JobKey.name)

	
	public SchedulerJobDependency(Integer jobId, Integer dependencyJobId) {
		super();
		this.jobId = jobId;
		this.dependencyJobId = dependencyJobId;
	}

	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	public Integer getDependencyJobId() {
		return dependencyJobId;
	}

	public void setDependencyJobId(Integer dependencyJobId) {
		this.dependencyJobId = dependencyJobId;
	}

}
