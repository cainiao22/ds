package com.qding.bigdata.ds.Exception;

import com.qding.bigdata.ds.common.Result;

/**
 * @author yanpf
 * @date 2018/2/6 12:09
 * @description
 */
public class CommonDataSearchEmptyException extends Exception {

    private String name;
    private String params;

    private Result result;

    public CommonDataSearchEmptyException(String name, String params) {
        super("通用接口返回数据为空, 接口名称：" + name + " 参数:" + params);
        this.name = name;
        this.params = params;
    }

    public CommonDataSearchEmptyException(String name, String params, Result result) {
        super("通用接口返回数据为空, 接口名称：" + name + " 参数:" + params);
        this.name = name;
        this.params = params;
        this.result = result;
    }

    public Result getResult() {
        return result;
    }
}
