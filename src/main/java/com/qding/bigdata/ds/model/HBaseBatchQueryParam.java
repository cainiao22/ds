package com.qding.bigdata.ds.model;

/**
 * @author yanpf
 * @date 2018/5/9 20:08
 * @description
 */
public class HBaseBatchQueryParam extends HbaseQueryParam {

    private String[] rowkeyList;

    public String[] getRowkeyList() {
        return rowkeyList;
    }

    public void setRowkeyList(String[] rowkeyList) {
        this.rowkeyList = rowkeyList;
    }
}
