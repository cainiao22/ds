package com.qding.bigdata.ds.model;

import java.util.Date;

public class MonitorJobQueue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8487315414612013859L;
	/**
	 * 
	 */

	private Integer page = 1;
	private Integer pageCount = 10;
	private Integer offset = 0;
	private String sortAndDesc;

	private Date createTime;
	private Date updateTime;

	private String keyword;


	private String id;
	private String executeResultId;
	private String metaTableId;
	private String dbType;
	private String type;
	private String tableName;	
	private String tableAlias;
	private String sql;
	private Date scheduleTime;
	private String jobUniqueId;
	private String status;
	private String monitorJobId;
	private Integer priority;
	private Date dataDate;
	private Integer hashCode;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getExecuteResultId() {
		return executeResultId;
	}

	public void setExecuteResultId(String executeResultId) {
		this.executeResultId = executeResultId;
	}

	public String getMetaTableId() {
		return metaTableId;
	}

	public void setMetaTableId(String metaTableId) {
		this.metaTableId = metaTableId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableAlias() {
		return tableAlias;
	}

	public void setTableAlias(String tableAlias) {
		this.tableAlias = tableAlias;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public Date getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(Date scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public String getJobUniqueId() {
		return jobUniqueId;
	}

	public void setJobUniqueId(String jobUniqueId) {
		this.jobUniqueId = jobUniqueId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMonitorJobId() {
		return monitorJobId;
	}

	public void setMonitorJobId(String monitorJobId) {
		this.monitorJobId = monitorJobId;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Date getDataDate() {
		return dataDate;
	}

	public void setDataDate(Date dataDate) {
		this.dataDate = dataDate;
	}

	public Integer getHashCode() {
		return hashCode;
	}

	public void setHashCode(Integer hashCode) {
		this.hashCode = hashCode;
	}



	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public String getSortAndDesc() {
		return sortAndDesc;
	}

	public void setSortAndDesc(String sortAndDesc) {
		this.sortAndDesc = sortAndDesc;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDbType() {
		return dbType;
	}

	public void setDbType(String dbType) {
		this.dbType = dbType;
	}
}
