package com.qding.bigdata.ds.model;

import org.springframework.util.Assert;

/**
 * @author yanpf
 * @date 2018/5/9 16:27
 * @description
 */
public class HbaseColumn {

    private String family;

    private String qualifier;

    public HbaseColumn(String family, String qualifier) {
        Assert.notNull(family);
        Assert.notNull(qualifier);
        this.family = family;
        this.qualifier = qualifier;
    }

    public String getFamily() {
        return family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getQualifier() {
        return qualifier;
    }

    public void setQualifier(String qualifier) {
        this.qualifier = qualifier;
    }
}
