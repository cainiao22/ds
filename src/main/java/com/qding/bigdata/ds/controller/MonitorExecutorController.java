package com.qding.bigdata.ds.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qding.bigdata.ds.enums.DBTypeEnum;
import com.qding.bigdata.ds.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.model.MonitorExecuteLog;
import com.qding.bigdata.ds.model.MonitorExecuteResult;
import com.qding.bigdata.ds.model.MonitorQueue;
import com.qding.bigdata.ds.util.DateUtil;

/**
 * Created by yanpf on 2017/7/19.
 * @description 调度任务相关
 */

@Controller
public class MonitorExecutorController extends BasicController {

    @Autowired
    MonitorExecutorResultService monitorExecutorResultService;

    @Autowired
    MonitorQueueLogService monitorQueueLogService;

    @Autowired
    MonitorQueueService monitorQueueService;
    @Autowired
    MetaTableService metaTableService;

    @Autowired
    private Map<String, MetaDbsService> hiveMetaDbsServiceMap;

    @RequestMapping("monitorExecutorList")
    public ModelAndView monitorExecutorList(){
        ModelAndView mv  = initModelAndView();
        mv.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数仓监控);
        mv.addObject("dbTypes", DBTypeEnum.values());
        Map<String, List<String>> metaTableTypes = new HashMap<String, List<String>>();
        for (DBTypeEnum dbTypeEnum : DBTypeEnum.values()){
            List<String> allDbs = hiveMetaDbsServiceMap.get(dbTypeEnum.handlerName).getAllDbs();
            metaTableTypes.put(dbTypeEnum.name(), allDbs);

        }
        mv.addObject("metaTableTypes", JSON.toJSONString(metaTableTypes));
        mv.addObject("dataDate", DateUtil.getDayByN(-1));
        return mv;
    }
    @RequestMapping("dwMonitorTableDetail")
    public ModelAndView dwMonitorTableDetail(MetaTable metaTable){
    	ModelAndView mv  = initModelAndView();
    	mv.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数仓监控);
    	mv.addObject("dataDate", DateUtil.getDayByN(-1));
    	mv.addObject("metaTable", metaTableService.getOne(metaTable));
    	return mv;
    }

    /**
     * 获取所有任务的执行状态
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("/getMonitorExecutorList")
    public SearchResult<MonitorExecuteResult> getMonitorExecutorList(MonitorExecuteResult param){
        log.info("查询调度任务列表入参:" + JSON.toJSONString(param));
        SearchResult<MonitorExecuteResult> monitorExecuteResult = monitorExecutorResultService.queryList(param);
        return monitorExecuteResult;
    }

    /**
     * 获取某张表的所有执行规则的执行情况
     * @param monitorQueue
     * @return
     */
    @ResponseBody
    @RequestMapping("getMonitorJobStatusList")
    public SearchResult<MonitorQueue> getMonitorJobStatusList(MonitorQueue monitorQueue){
        log.info("查询调度任务规则列表入参,{}:", JSON.toJSONString(monitorQueue));
        SearchResult<MonitorQueue> monitorQueueList = monitorQueueService.getMonitorQueueByMetableId(monitorQueue);
        return monitorQueueList;
    }

    /**
     * 获取某条规则的执行日志
     * @param monitorQueueId
     * @return
     */
    @ResponseBody
    @RequestMapping("getMonitorExecuteLogByQueueId")
    public List<MonitorExecuteLog> getMonitorExecuteLogByQueueId(String monitorQueueId){
        return monitorQueueLogService.getMonitorExecuteLogByQueueId(monitorQueueId);
    }

}

