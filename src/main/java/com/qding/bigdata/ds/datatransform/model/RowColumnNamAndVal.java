package com.qding.bigdata.ds.datatransform.model;

/**
 * Created by lzs on 2018/5/31.
 */
public class RowColumnNamAndVal {
    private String rowColumnNam;
    private String rowColumnVal;

    public String getRowColumnNam() {
        return rowColumnNam;
    }

    public void setRowColumnNam(String rowColumnNam) {
        this.rowColumnNam = rowColumnNam;
    }

    public String getRowColumnVal() {
        return rowColumnVal;
    }

    public void setRowColumnVal(String rowColumnVal) {
        this.rowColumnVal = rowColumnVal;
    }

    public RowColumnNamAndVal() {
    }

    public RowColumnNamAndVal(String rowColumnNam, String rowColumnVal) {
        this.rowColumnNam = rowColumnNam;
        this.rowColumnVal = rowColumnVal;
    }
}




