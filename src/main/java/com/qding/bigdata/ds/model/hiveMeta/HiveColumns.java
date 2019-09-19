package com.qding.bigdata.ds.model.hiveMeta;

public class HiveColumns extends HiveColumnsKey {
    private String comment;

    private String typeName;

    private Integer integerIdx;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Integer getIntegerIdx() {
        return integerIdx;
    }

    public void setIntegerIdx(Integer integerIdx) {
        this.integerIdx = integerIdx;
    }
}