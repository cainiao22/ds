package com.qding.bigdata.ds.model;

import com.qding.bigdata.ds.common.Result;

import java.util.Map;

/**
 * @author yanpf
 * @date 2018/6/27 17:07
 * @description
 */
public class CommonDataEvent {

    private String jobName;

    private Map<String, String> params;

    private Result result;

    private String remark;

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public Map<String, String> getParams() {
        return params;
    }

    public void setParams(Map<String, String> params) {
        this.params = params;
    }

    public Result getResult() {
        return result;
    }

    public void setResult(Result result) {
        this.result = result;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
