package com.qding.bigdata.ds.model;

import com.qding.bigdata.ds.datatransform.model.DataInfo;

import java.util.Date;

/**
 * Created by syj on 2018/6/11.
 */
public class DataInfoList extends DataInfo {
    private String  id;
    private String sqlStatement;
    private Date createTime;
    private Integer page = 1;
    private Integer pageCount = 10;
    private Integer offset = 0;
    private String sortAndDesc;

    public String getSortAndDesc() {
        return sortAndDesc;
    }

    public void setSortAndDesc(String sortAndDesc) {
        this.sortAndDesc = sortAndDesc;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        if (page == null || page < 1) {
            page = 1;
        }
        this.page = page;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }
    public Integer getOffset() {
        this.offset = (page - 1) * pageCount;
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }
    public DataInfoList() {

    }

    public DataInfoList(String metaDataType, String metaConfigkey, String targetDataType, String targetConfigkey, String tableName, String targetTableName, String districtField, String partitioned, String terminate, String stored, String location, String partitionvalue, String alias, String ownerd, String id, String sqlStatement, Date createTime, Integer page, Integer pageCount, Integer offset, String sortAndDesc) {
        super(metaDataType, metaConfigkey, targetDataType, targetConfigkey, tableName, targetTableName, districtField, partitioned, terminate, stored, location, partitionvalue, alias, ownerd);
        this.id = id;
        this.sqlStatement = sqlStatement;
        this.createTime = createTime;
        this.page = page;
        this.pageCount = pageCount;
        this.offset = offset;
        this.sortAndDesc = sortAndDesc;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSqlStatement() {
        return sqlStatement;
    }

    public void setSqlStatement(String sqlStatement) {
        this.sqlStatement = sqlStatement;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
