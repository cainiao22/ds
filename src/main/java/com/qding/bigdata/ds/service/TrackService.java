package com.qding.bigdata.ds.service;


import com.alibaba.fastjson.JSONObject;



/**
 * @author yanpf
 * @date 2018/7/11 11:49
 * @description
 */
public interface TrackService {
    void pushTrackMsg(JSONObject trackMsg);
}
