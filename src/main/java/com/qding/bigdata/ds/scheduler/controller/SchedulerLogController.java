package com.qding.bigdata.ds.scheduler.controller;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.controller.BasicController;
import com.qding.bigdata.ds.model.scheduler.XxlJobLog;
import com.qding.bigdata.ds.model.scheduler.XxlJobLogParam;
import com.qding.bigdata.ds.model.scheduler.XxlJobTriggerHistory;
import com.qding.bigdata.ds.service.XxlJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/3/20 11:29
 * @description
 */

@Controller
public class SchedulerLogController extends BasicController {

    @Autowired
    XxlJobLogService xxlJobLogService;

    @RequestMapping("schedulerJobLogList")
    public ModelAndView schedulerJobLogList(XxlJobLogParam param){
        ModelAndView mv = this.initModelAndView();
        mv.addObject("param", param);
        return mv;
    }

    @ResponseBody
    @RequestMapping("schedulerJobLogPageList")
    public SearchResult<XxlJobLog> schedulerJobLogPageList(XxlJobLogParam param){
        SearchResult<XxlJobLog> result = xxlJobLogService.schedulerJobLogPageList(param);
        return result;
    }

    @ResponseBody
    @RequestMapping("getLogDetail")
    public Result getLogDetail(Integer jobLogId){
        List<XxlJobTriggerHistory> historyList = xxlJobLogService.getLogDetail(jobLogId);
        if(!CollectionUtils.isEmpty(historyList)){
            for (XxlJobTriggerHistory history : historyList) {
                if(history.getHandleCode() == 200){
                    history.setHandleMsg("执行成功");
                }
            }
        }
        return Result.success(historyList);
    }
}
