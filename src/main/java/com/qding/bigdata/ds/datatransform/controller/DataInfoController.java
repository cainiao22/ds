package com.qding.bigdata.ds.datatransform.controller;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.controller.BasicController;
import com.qding.bigdata.ds.datatransform.service.DataInfoService;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.DataBaseParams;
import com.qding.bigdata.ds.model.DataInfoList;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by syj on 2018/6/11.
 */
@Controller
public class DataInfoController extends BasicController {
    @Autowired
    private DataInfoService dataInfoService;
    @RequestMapping("/dataInfo")
    public ModelAndView dataInfoList() {
        ModelAndView modelAndView = initModelAndView("dataInfo");
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据同步列表);
        return modelAndView;
    }

    @RequestMapping("/queyrSynDataInfoRecord")
    @ResponseBody
    public  Object synDataInfoRecordList(DataInfoList info){
        log.info("query  synchronization DataInfo   record  start. params:"+ JSON.toJSONString(info));
        SearchResult<DataInfoList> synDataInfoRecordList = dataInfoService.queryList(info);
        log.info("query  synchronization DataInfo   record  end.");
        return synDataInfoRecordList;
    }
    @RequestMapping("/dataInfoDetail")
    public ModelAndView dataInfoDetails( String id) {
        ModelAndView modelAndView =super.initModelAndView();
        DataInfoList  info =dataInfoService.queryByID(id);
        modelAndView.addObject("info", info);
        modelAndView.setViewName("dataInfoDetail");
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据同步列表);
        return modelAndView;
    }
}
