package com.qding.bigdata.ds.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.service.TrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author yanpf
 * @date 2018/7/11 11:47
 * @description
 */

@Controller
public class TrackController {

    @Autowired
    TrackService trackService;

    @ResponseBody
    @RequestMapping("pushTrackMsg")
    public Result pushTrackMsg(String trackMsg){
        if(trackMsg == null){
            return Result.failed(100, "");
        }
        JSONObject parseObject = JSON.parseObject(trackMsg);
        for (Map.Entry<String, Object> entry : parseObject.entrySet()) {
            if(entry.getValue() instanceof JSONObject || entry.getValue() instanceof JSONArray){
                entry.setValue(entry.getValue().toString().replaceAll("\"", "\\\""));
            }
        }
        trackService.pushTrackMsg(parseObject);
        return Result.success();
    }
}
