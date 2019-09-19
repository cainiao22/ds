package com.qding.bigdata.ds.service.impl;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.PageResult;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.util.FreeMarkerUtil;
import com.qding.bigdata.ds.util.HttpForEs;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.junit.Test;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yanpf on 2017/10/18.
 */
public class FreeMakerTest {
    private static String sql = "select  * from out.out_weixin_total_koudian_maoli where dt='${day}'";
    @Test
    public void testFreeMaker() throws Exception {
        Configuration conf = new Configuration(Configuration.VERSION_2_3_0);
        StringTemplateLoader stringLoader = new StringTemplateLoader();
        stringLoader.putTemplate(sql, sql);
        conf.setTemplateLoader(stringLoader);
        Template template = conf.getTemplate(sql,"utf-8");
        Map root = new HashMap();
        root.put("day", 18);
        //root.put("studentName", "nimei");

        StringWriter writer = new StringWriter();
        try {
            template.process(root, writer);
            System.out.println(writer.toString());
        } catch (TemplateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testFreeMaker2() throws Exception {
        /*String content = "    <#if xx == \"2017-09-15\") > \n" +
                "        select  * from out.out_weixin_total asfsfsf_koudian_maoli where dt='${day}' \n" +
                "    <#elseif xx == \"2017-09-18\" >  \n" +
                "        select  * from out.out_weixin_total_koudian_maoli where dt='${day}'  \n" +
                "    <#elseif xx == \"2017-09-16\" >  \n" +
                "        ${xx}不是一个大学生  \n" +
                "    <#else>  \n" +
                "        ${xx}是一个大学生  \n" +
                "    </#if>\n" +
                "  limit  ${pageSize} offset ${currentPage - 1} * ${pageSize}";*/
        String content = "select  * from out.out_weixin_total asfsfsf_koudian_maoli where dt='${day}' limit  ${pageSize} offset ${(currentPage - 1)*pageSize}";
        Map<String, String> params = new HashMap<String, String>();
        params.put("xx", "2017-09-14");
        params.put("day", "2017-09-14");
        params.put("pageSize", "10");
        params.put("currentPage", "15");

        Result<String> result = FreeMarkerUtil.process(content, params);
        System.out.println(result.getData());
    }

    @Test
    public  void testResult() throws Exception {
        Result result = Result.success();
        List<Map<String, String>> data =   new ArrayList<Map<String, String>>();
        Map<String, String> a1 = new HashMap<String, String>();
        a1.put("column1", "v1");
        a1.put("column2", "v2");
        data.add(a1);

        Map<String, String> a2 = new HashMap<String, String>();
        a2.put("column1", "v3");
        a2.put("column2", "v4");
        data.add(a2);
        result.setData(data);
        System.out.println(JSON.toJSONString(result));
    }

    @Test
    public  void testPageResult() throws Exception {
        PageResult result = new PageResult();
        List<Map<String, String>> data =   new ArrayList<Map<String, String>>();
        Map<String, String> a1 = new HashMap<String, String>();
        a1.put("column1", "v1");
        a1.put("column2", "v2");
        data.add(a1);

        Map<String, String> a2 = new HashMap<String, String>();
        a2.put("column1", "v3");
        a2.put("column2", "v4");
        data.add(a2);
        result.setData(data);
        result.setPageSize(10);
        result.setPageCount(2);
        //result.setTotalPage(1);
        result.setCurrentPage(1);
        result.setTotal(1);
        System.out.println(JSON.toJSONString(result));
    }

    @Test
    public void testEs(){
        HttpForEs.getEsDate("select * from qding_shequ_label limit 10");
    }
}
