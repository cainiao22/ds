package com.qding.bigdata.ds.dao;

import com.qding.bigdata.ds.model.scheduler.XxlJobLog;
import com.qding.bigdata.ds.scheduler.dao.XxlJobLogDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author yanpf
 * @date 2018/3/20 10:29
 * @description
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml","classpath*:/spring/applicationContext.xml"})
public class TestXxlJobLogDao {

    @Autowired
    XxlJobLogDao xxlJobLogDao;

    @Test
    public void testXxlJobLogDao(){
        XxlJobLog status = xxlJobLogDao.findLatestJobStatus(1, 48);
        System.out.println(status.toString());
    }
}
