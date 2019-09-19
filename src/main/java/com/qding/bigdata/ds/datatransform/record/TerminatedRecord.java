package com.qding.bigdata.ds.datatransform.record;

/**
 * @author yanpf
 * @date 2018/4/26 11:02
 * @description
 */
public class TerminatedRecord implements Record {

    private TerminatedRecord(){};

    private static final TerminatedRecord instance = new TerminatedRecord();

    public static TerminatedRecord getInstance(){
        return instance;
    }
}
