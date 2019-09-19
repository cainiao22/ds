package com.qding.bigdata.ds.component;

import com.alibaba.fastjson.JSONArray;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.util.HttpClientUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.enums.CommonDataHandlerEnum;
import com.qding.bigdata.ds.enums.RedisDataTypeEnum;
import com.qding.bigdata.ds.model.CommonDataDetail;
import com.qding.bigdata.ds.service.CommonDataHandleService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yanpf on 2017/8/7.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml", "classpath*:/spring/applicationContext.xml"})
public class CommonDataRedisHandlerTest {

    @Autowired
    CommonDataRedisHandler redisHandler;

    @Autowired
    CommonDataHandleService commonDataHandleService;

    @Test
    public void testGetValue() throws Exception {
        //Result result = redisHandler.execute(12, null);
        //System.out.println(JSON.toJSONString(result));
    }

    @Test
    public void save() throws Exception {
        CommonDataDetail detail = new CommonDataDetail();
        detail.setAlias("redis测试TEST");
        detail.setDataSource(CommonDataHandlerEnum.REDIS.getDataSource());
        detail.setName("redistestz");
        detail.setOwner("yanpf");
        detail.setDescription("测试");
        detail.setKey("${name}");
        detail.setFields(null);
        detail.setDataType(RedisDataTypeEnum.KV.name());
        commonDataHandleService.save(detail);

    }

    @Test
    public void update() throws Exception {
        CommonDataDetail detail = commonDataHandleService.getById(51);
        detail.setQueryContent("select xxx 修改的 from test");
        detail.setDataType(RedisDataTypeEnum.KV.name());
        detail.setFields(null);
        detail.setKey("name");
        commonDataHandleService.update(detail);
    }

    @Test
    public void query() throws Exception {
        CommonDataDetail detail = new CommonDataDetail();
        detail.setKeyword("redis");
        detail.setOwner("yanpf");
        detail.setPageCount(4);
        detail.setPage(1);
        SearchResult<CommonDataDetail> query = commonDataHandleService.query(detail);
        System.out.println(JSON.toJSONString(query));
    }

    @Test
    public void getById() throws Exception {
        CommonDataDetail dataDetail = commonDataHandleService.getById(51);

        System.out.println(dataDetail);
    }

    @Test
    public void delete() throws Exception {
        commonDataHandleService.deleteById(51);
    }

    @Test
    public void getList() throws Exception {
        dealWithDruidSQL("SELECT * FROM qding_collect_log limit 2");
    }

    private List<Map<String, Object>> dealWithDruidSQL(String queryContent) throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        params.put("query", queryContent);
        String response = HttpClientUtil.doPost(Constant.DRUID_QUERY_URL, params);
        List<Map<String,Object>> listObjectSec = JSONArray.parseObject(response,List.class);
        return listObjectSec;
    }

}
