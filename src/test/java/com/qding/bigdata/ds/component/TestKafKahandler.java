package com.qding.bigdata.ds.component;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



/**
 * @author yanpf
 * @date 2018/6/27 17:36
 * @description
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml", "classpath*:/spring/applicationContext.xml"})
public class TestKafKahandler {

    private static final String TOPIC = "system_web_access_test";

    @Autowired
    KafkaTemplate<String, String> template;

    @Test
    public void test() throws Exception {

       template.send(TOPIC, "hello world");
       Thread.sleep(10000);
    }
}
