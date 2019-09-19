package com.qding.bigdata.ds.model.hiveMeta;

public class HiveMetaDbs {
    private Long dbId;

    private String desc;

    private String dbLocationUri;

    private String name;

    private String ownerName;

    private String ownerType;

    public Long getDbId() {
        return dbId;
    }

    public void setDbId(Long dbId) {
        this.dbId = dbId;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc == null ? null : desc.trim();
    }

    public String getDbLocationUri() {
        return dbLocationUri;
    }

    public void setDbLocationUri(String dbLocationUri) {
        this.dbLocationUri = dbLocationUri == null ? null : dbLocationUri.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName == null ? null : ownerName.trim();
    }

    public String getOwnerType() {
        return ownerType;
    }

    public void setOwnerType(String ownerType) {
        this.ownerType = ownerType == null ? null : ownerType.trim();
    }
}