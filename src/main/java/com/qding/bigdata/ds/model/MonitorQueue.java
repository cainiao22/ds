package com.qding.bigdata.ds.model;

import java.math.BigDecimal;

public class MonitorQueue extends BaseModel {
    private String id;

    private String metaTableId;

    private String executeResultId;

    private String dbType;

    private String type;

    private String tableName;

    private String tableAlias;

    private String monitorName;


    private String sql;

    private String scheduleTime;

    private String currentStatus;

    private String jobUniqueId;

    private String monitorJobId;

    private BigDecimal valueMax;

    private BigDecimal valueMin;

    private Integer priority;

    private String dataDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName == null ? null : tableName.trim();
    }

    public String getTableAlias() {
        return tableAlias;
    }

    public void setTableAlias(String tableAlias) {
        this.tableAlias = tableAlias == null ? null : tableAlias.trim();
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql == null ? null : sql.trim();
    }

    public String getScheduleTime() {
        return scheduleTime;
    }

    public void setScheduleTime(String scheduleTime) {
        this.scheduleTime = scheduleTime == null ? null : scheduleTime.trim();
    }

    public String getJobUniqueId() {
        return jobUniqueId;
    }

    public void setJobUniqueId(String jobUniqueId) {
        this.jobUniqueId = jobUniqueId == null ? null : jobUniqueId.trim();
    }

    public String getMonitorJobId() {
        return monitorJobId;
    }

    public void setMonitorJobId(String monitorJobId) {
        this.monitorJobId = monitorJobId == null ? null : monitorJobId.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getDataDate() {
        return dataDate;
    }

    public void setDataDate(String dataDate) {
        this.dataDate = dataDate;
    }

    public String getExecuteResultId() {
        return executeResultId;
    }

    public void setExecuteResultId(String executeResultId) {
        this.executeResultId = executeResultId;
    }

    public String getCurrentStatus() {
        return currentStatus;
    }

    public void setCurrentStatus(String currentStatus) {
        this.currentStatus = currentStatus;
    }

    public String getMetaTableId() {
        return metaTableId;
    }

    public void setMetaTableId(String metaTableId) {
        this.metaTableId = metaTableId;
    }

    public String getMonitorName() {
        return monitorName;
    }

    public void setMonitorName(String monitorName) {
        this.monitorName = monitorName;
    }

    public BigDecimal getValueMax() {
        return valueMax;
    }

    public void setValueMax(BigDecimal valueMax) {
        this.valueMax = valueMax;
    }

    public BigDecimal getValueMin() {
        return valueMin;
    }

    public void setValueMin(BigDecimal valueMin) {
        this.valueMin = valueMin;
    }

    public String getDbType() {
        return dbType;
    }

    public void setDbType(String dbType) {
        this.dbType = dbType;
    }
}