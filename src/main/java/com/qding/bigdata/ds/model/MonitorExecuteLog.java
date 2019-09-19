package com.qding.bigdata.ds.model;

public class MonitorExecuteLog extends BaseModel {
    private String id;

    private String monitorQueueId;

    private String monitorLog;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMonitorQueueId() {
        return monitorQueueId;
    }

    public void setMonitorQueueId(String monitorQueueId) {
        this.monitorQueueId = monitorQueueId == null ? null : monitorQueueId.trim();
    }

    public String getMonitorLog() {
        return monitorLog;
    }

    public void setMonitorLog(String monitorLog) {
        this.monitorLog = monitorLog == null ? null : monitorLog.trim();
    }
}