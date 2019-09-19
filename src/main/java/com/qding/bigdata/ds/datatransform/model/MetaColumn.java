package com.qding.bigdata.ds.datatransform.model;

/**
 * @author yanpf
 * @date 2018/4/26 10:55
 * @description
 */
public class MetaColumn {

    private String name;
    private String type;
    private String comment;
    private String length;

    @Override
    public String toString() {
        return name+" "+type+" "+length+" "+comment;
    }

    public MetaColumn() {
    }

    public MetaColumn(String name, String type, String comment, String length) {
        this.name = name;
        this.type = type;
        this.comment = comment;
        this.length = length;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }
}
