package com.qding.bigdata.ds.component;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.listener.MessageListener;

/**
 * @author yanpf
 * @date 2018/7/2 17:30
 * @description
 */
public class CommonDataServiceLoggetComsumer implements MessageListener<String, String> {


    @Override
    public void onMessage(ConsumerRecord<String, String> record) {
        String value = record.value();
        System.out.println(value);
    }
}
