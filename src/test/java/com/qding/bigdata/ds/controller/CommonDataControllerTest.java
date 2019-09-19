package com.qding.bigdata.ds.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.qding.bigdata.ds.enums.CommonDataHandlerEnum;

/**
 * Created by yanpf on 2017/8/9.
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml", "classpath*:/spring/applicationContext.xml"})
public class CommonDataControllerTest {

    private MockMvc mockMvc;

    @Autowired
    private CommonDataController commonDataController;

    @Before
    public void setUp() throws Exception {
        mockMvc = MockMvcBuilders.standaloneSetup(commonDataController).build();
    }

    @Test
    public void testSave() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                .get("/dataApiSave")
                .param("commonDataSummaryId", "58")
                .param("name", "testRedis")
                .param("alias", "redis测试")
                .param("dataSource", CommonDataHandlerEnum.REDIS.getDataSource())
                .param("queryContent", "select * from dual")
                .param("description", "描述")
                .param("dataType", "KV")
                .param("key", "name")
                .param("fields", "a, b, c")
                .param("owner", "yanpf"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testQuery() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                .get("/dataApiQuery/redistest")
                .param("name", "xiaoming")
                .param("date", "20150909"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testQueryKV() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                .get("/dataApiQuery/redistestkv")
                .param("name", "xiaoming")
                .param("date", "20150909"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void testDataApiList() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                .get("/dataApiList")
                .param("owner", "yanpf")
                .param("keyword", "redis"))
                .andExpect(status().isOk())
                .andDo(print());
    }

}
