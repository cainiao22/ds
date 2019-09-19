package com.qding.bigdata.ds.controller;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.util.FreeMarkerUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanpf on 2017/10/19.
 */

@Controller
public class TestFeeMarkerController extends BasicController {

    @RequestMapping("testFreeMarker")
    public Result<String> testFreeMarker(){
        String content = "select  <@includeX name=\"framemaker_test\"/> from dual";
        Map<String, String> params = new HashMap<String, String>();
        params.put("name", "yanpf");
        params.put("data_type", "4");
        params.put("tartget_type", "GMV");
        Result<String> process = FreeMarkerUtil.process(content, params);
        return process;
    }
}
