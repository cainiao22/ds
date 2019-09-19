package com.qding.bigdata.ds.model.scheduler;

import com.qding.bigdata.ds.model.BaseModel;

/**
 * @author yanpf
 * @date 2018/3/20 11:57
 * @description
 */
public class XxlJobLogParam extends BaseModel {

    // job info
    private Integer jobGroup;
    private Integer jobId;

    public Integer getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(Integer jobGroup) {
        this.jobGroup = jobGroup;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }
}
