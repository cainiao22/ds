package com.qding.bigdata.ds.component.async;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.model.CommonDataEvent;
import com.qding.bigdata.ds.util.DateUtil;
import com.qding.bigdata.ds.util.HttpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

/**
 * @author yanpf
 * @date 2018/6/27 17:05
 * @description
 */
//@EnableAsync
//@Component
public class CommonDataTimeUsedHandler implements Observer {

    private Logger logger = LoggerFactory.getLogger(CommonDataTimeUsedHandler.class);

    @Async
    @Override
    public void update(Observable o, Object arg) {
        CommonDataEvent event = (CommonDataEvent) arg;
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            map.put("jobName", event.getJobName());
            map.put("params", event.getParams());
            map.put("sql", URLEncoder.encode(event.getRemark().replaceAll("\t", " ").replaceAll("\n", " "), "utf-8"));
            long timeMillis = System.currentTimeMillis();
            map.put("timestamp", timeMillis);
            map.put("inputTime", DateUtil.formatDateByMilliseconds(timeMillis));
            map.put("timeUsed", event.getResult().getTimeUsed());
            map.put("code", event.getResult().getCode());
            map.put("msg", event.getResult().getErrorMsg());


            String json = JSON.toJSONString(map);
            logger.info("json:{}", json);
            logger.info("url: {}", Constant.COMMON_DATA_TIME_USED_DRUID);
            HttpUtil.post(Constant.COMMON_DATA_TIME_USED_DRUID, json);
        } catch (IOException e) {
            logger.error("发送接口耗时信息到druid异常:{}", e);
        }
    }
}
