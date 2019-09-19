package com.qding.bigdata.ds.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.qding.bigdata.ds.service.TrackService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;


/**
 * @author yanpf
 * @date 2018/7/11 11:51
 * @description
 */

@Service
public class TrackServiceImpl implements TrackService {

    @Autowired
    KafkaTemplate<String, String> kafkaTemplate;

    @Value("${kafka.track.topic}")
    private String topic;

    @Override
    public void pushTrackMsg(JSONObject trackMsg) {
        if(trackMsg.getLong("online_time") >= 1540209362000L){
            return;
        }
        if(StringUtils.isBlank(trackMsg.getString("user")) || StringUtils.isBlank(trackMsg.getString("user_name"))){
            return;
        }
        kafkaTemplate.send(topic, JSON.toJSONString(trackMsg, SerializerFeature.WriteMapNullValue));
    }
}
