package com.qding.bigdata.ds.hivemeta.service.impl;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.dao.MetaFieldDao;
import com.qding.bigdata.ds.service.MetaDbsService;

import com.qding.bigdata.ds.model.MetaField;
import com.qding.bigdata.ds.model.MetaTable;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/8/14 10:24
 * @description
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml","classpath*:/spring/applicationContext.xml"})

public class HiveMetaDbsServiceImplTest {

    @Autowired
    MetaDbsService hiveMetaDbsService;

    @Autowired
    MetaFieldDao metaFieldDao;

    @Test
    public void getAllDbs() throws Exception {
        List<String> allDbs = hiveMetaDbsService.getAllDbs();
    }

    @Test
    public void getTableHiveColumns() throws Exception {
        Result<List<MetaField>> columns = hiveMetaDbsService.getTableColumns("test5", "default");
        System.out.println(JSON.toJSONString(columns));
    }

    @Test
    public void testMetaFieldDao(){
        MetaTable metaTable = new MetaTable();
        metaTable.setId("d0a621bd1b514c4bbe8f7846acfde723");
        metaTable.setType("ODS");
        metaTable.setName("ods_uf_community");
        List<MetaField> filedInfo = metaFieldDao.getFiledInfo(metaTable);
        System.out.println(filedInfo);
    }

}