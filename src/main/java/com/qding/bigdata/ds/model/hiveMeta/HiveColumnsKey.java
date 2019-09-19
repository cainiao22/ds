package com.qding.bigdata.ds.model.hiveMeta;

public class HiveColumnsKey {
    private Long cdId;

    private String columnName;

    public Long getCdId() {
        return cdId;
    }

    public void setCdId(Long cdId) {
        this.cdId = cdId;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName == null ? null : columnName.trim();
    }
}