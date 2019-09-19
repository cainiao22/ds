package com.qding.bigdata.ds.scheduler.enums;

/**
 * @author yanpf
 * @date 2018/3/22 10:11
 * @description
 */
public enum  SchedulerJobStatusEnum {

    UNKONW(-1), UNSTARTED(0), SUCCESS(1), FAILED(2), RUNNING(3), WAITTING(4);

    private int code;

    SchedulerJobStatusEnum(int code){
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
