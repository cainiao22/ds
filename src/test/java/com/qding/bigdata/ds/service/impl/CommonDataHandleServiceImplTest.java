package com.qding.bigdata.ds.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.model.CommonDataDetail;
import com.qding.bigdata.ds.service.CommonDataHandleService;

/**
 * Created by yanpf on 2017/7/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml","classpath*:/spring/applicationContext.xml"})
public class CommonDataHandleServiceImplTest {

    @Autowired
    CommonDataHandleService commonDataHandleService;

    @Test
    public void execute() throws Exception {
        Result<List<Map<String, Object>>> result =
                commonDataHandleService.execute("testx2", new HashMap<String, String>());
        System.out.println(JSON.toJSONString(result));
    }

    @Test
    public void save() throws Exception {
        for (int i = 0; i < 14; i++) {
            CommonDataDetail detail = new CommonDataDetail();
            detail.setAlias("中文名称");
            detail.setDataSource("SQL");
            detail.setName("testx" + i);
            detail.setOwner("yanpf");
            detail.setDescription("测试");
            detail.setQueryContent("select 1 from dual");

            commonDataHandleService.save(detail);
        }

    }

    @Test
    public void update() throws Exception {
        CommonDataDetail detail = new CommonDataDetail();
        detail.setCommonDataSummaryId(24);
        detail.setQueryContent("select xxx 修改的 from test");
        detail.setName("test222changed");
        commonDataHandleService.update(detail);
    }

    @Test
    public void query() throws Exception {
        CommonDataDetail detail = new CommonDataDetail();
        detail.setKeyword("中文");
        detail.setOwner("yanpf");
        detail.setPageCount(4);
        detail.setPage(1);
        SearchResult<CommonDataDetail> query = commonDataHandleService.query(detail);
        System.out.println(JSON.toJSONString(query));
    }

    @Test
    public void getById() throws Exception {
        CommonDataDetail dataDetail = commonDataHandleService.getById(43);
        dataDetail.setDescription(null);
        //dataDetail.setQueryContent(null);
        commonDataHandleService.update(dataDetail);
        System.out.println(dataDetail);
    }

    @Test
    public void deleteById() throws Exception {
        commonDataHandleService.deleteById(37);
    }

}