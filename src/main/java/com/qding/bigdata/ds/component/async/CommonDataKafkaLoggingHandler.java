package com.qding.bigdata.ds.component.async;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.model.CommonDataEvent;
import com.qding.bigdata.ds.model.LoggingEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author yanpf
 * @date 2018/6/27 16:27
 * @description
 */
@EnableAsync
@Service
public class CommonDataKafkaLoggingHandler implements Observer {

    @Autowired
    KafkaTemplate<String, String> kafkaTemplate;

    @Value("${kafka.commondata.topic}")
    private String topic;


    @Async
    @Override
    public void update(Observable o, Object arg) {
        CommonDataEvent commonDataEvent = (CommonDataEvent) arg;
        LoggingEvent loggingEvent = new LoggingEvent();
        loggingEvent.setUser(commonDataEvent.getParams().get("track_user"));
        loggingEvent.setUserName(commonDataEvent.getParams().get("track_user_name"));
        loggingEvent.setSource(commonDataEvent.getParams().get("track_source"));
        loggingEvent.setEventName(commonDataEvent.getJobName());
        loggingEvent.setCreateTime(new Date());

        kafkaTemplate.send(topic, loggingEvent.toString());
    }

}
