package com.qding.bigdata.ds.dao;

import com.qding.bigdata.ds.hivemeta.dao.HiveMetaTblsDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author yanpf
 * @date 2018/8/10 15:20
 * @description
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml","classpath*:/spring/applicationContext.xml"})
public class TestHiveMetaDao {

    @Autowired
    private HiveMetaTblsDao tblsDao;


    @Test
    public void testQuery(){
        //HiveMetaTblsWithBLOBs hiveMetaTblsWithBLOBs = tblsDao.selectByPrimaryKey(190L);
        //System.out.println(JSON.toJSONString(hiveMetaTblsWithBLOBs));
    }
}
