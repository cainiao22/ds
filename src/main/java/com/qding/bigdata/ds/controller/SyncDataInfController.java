package com.qding.bigdata.ds.controller;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.model.BasicResponse;
import com.qding.bigdata.ds.model.CommonDataDetail;
import com.qding.bigdata.ds.model.CommonDataSql;
import com.qding.bigdata.ds.model.CommonDataSummary;
import com.qding.bigdata.ds.service.SyncDataInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by syj on 2018/8/1.
 */
@Controller
public class SyncDataInfController  extends BasicController{
    @Autowired
    SyncDataInfService syncDataInfService;

    @RequestMapping("/syncDataInf")
    @ResponseBody
    public Result syncDataInf(CommonDataDetail commonDataDetail) {
        CommonDataSummary byName = syncDataInfService.getByName(commonDataDetail);
        CommonDataSql commonDataSql = syncDataInfService.getBySummaryId(byName.getId());
        //CommonDataSummary
        commonDataDetail.setAlias(byName.getAlias());
        commonDataDetail.setName(byName.getName());
        commonDataDetail.setOwner(byName.getOwner());
        commonDataDetail.setProjectName(byName.getProjectName());
        commonDataDetail.setDataSource(byName.getDataSource());
        commonDataDetail.setDescription(byName.getDescription());
        commonDataDetail.setCacheTime(byName.getCacheTime());
      //CommonDataSql
        commonDataDetail.setQueryContent(commonDataSql.getQueryContent());
        CommonDataSummary Summary = syncDataInfService.executorgetByName(commonDataDetail);
      /*  if(Summary!=null){
            Result update =syncDataInfService.update(commonDataDetail,byName);
            return update;
        }*/
        if (Summary!=null){
            log.info("该数据接口已经存在:{}", JSON.toJSONString(commonDataDetail));
            return Result.failed(5, "该数据接口已经存在");
        }else{

            log.info("同步数据接口任务:{}", JSON.toJSONString(commonDataDetail));
            return syncDataInfService.save(commonDataDetail);
        }
    }


    @RequestMapping("/syncDataInfUpdate")
    @ResponseBody
    public Result syncDataInfUpdate(CommonDataDetail commonDataDetail) {
        CommonDataSummary byName = syncDataInfService.getByName(commonDataDetail);
        CommonDataSql commonDataSql = syncDataInfService.getBySummaryId(byName.getId());
        //CommonDataSummary
        commonDataDetail.setAlias(byName.getAlias());
        commonDataDetail.setName(byName.getName());
        commonDataDetail.setProjectName(byName.getProjectName());
        commonDataDetail.setOwner(byName.getOwner());
        commonDataDetail.setDataSource(byName.getDataSource());
        commonDataDetail.setDescription(byName.getDescription());
        commonDataDetail.setCacheTime(byName.getCacheTime());
        //CommonDataSql
        commonDataDetail.setQueryContent(commonDataSql.getQueryContent());
        CommonDataSummary Summary = syncDataInfService.executorgetByName(commonDataDetail);
       if(Summary!=null){
            Result update =syncDataInfService.update(commonDataDetail,Summary);
            return update;
        }else{
            log.info("该数据接口不存在:{}", JSON.toJSONString(commonDataDetail));
            return Result.failed(3, "该数据接口不存在");
        }
    }
}
