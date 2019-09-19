package com.qding.bigdata.ds.datatransform.commonData;

/**
 * Created by lzs on 2018/5/21.
 */
public class TransResult {
    private int code;//0 成功  1 失败
    private String merrage;

    public TransResult() {
    }

    public TransResult(int code, String merrage) {
        this.code = code;
        this.merrage = merrage;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMerrage() {
        return merrage;
    }

    public void setMerrage(String merrage) {
        this.merrage = merrage;
    }
}
