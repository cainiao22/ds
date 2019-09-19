package com.qding.bigdata.ds.controller;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.enums.OperateType;
import com.qding.bigdata.ds.enums.ResponseStatus;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.*;
import com.qding.bigdata.ds.service.ConfigService;
import com.qding.bigdata.ds.service.SchemeService;
import com.qding.bigdata.ds.service.SyncDataService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by QDHL on 2017/7/26.
 */
@Controller
public class SchemeController extends BasicController {

    private static final String DATABASE_PARAM_TYPE = "DATABASE_PARAM_TYPE";
    @Autowired
    private SchemeService schemeService;
    @Autowired
    private ConfigService configService;
    @Autowired
    private SyncDataService syncDataService;

    /**
     *
     * 保存用户填写记录,且根据用户填写的mysql 信息， 获取mysql的scheme信息，并将scheme信息同步到数据仓库。
     *
     */
    @RequestMapping("/saveAndSynScheme")

    @ResponseBody
    public Object createGpSchema(SchemeInfo info) {
        log.info("create gp scheme by mysql table start . params:"+ JSON.toJSONString(info));
        BasicResponse response=new BasicResponse();
        // 1若存在在界面中给出提示
        if(schemeService.hasSchemeRecoder(info)){
            response.setCode(ResponseStatus.EXIST);
            response.setErrMessage("该scheme已存在数据是否更新");
           return response;
        }
        //2 构建scheme
        info=schemeService.buidGPSchemeFromMysql(info, OperateType.CREATE);

        buidResponse(info, response);
        //3  更新元数据
        log.info("create gp scheme  end ");
        //
        return response;
    }


    @RequestMapping("/updateGpScheme")
    @ResponseBody
    public Object updateGpSchema(SchemeInfo info,boolean flag) {
        log.info("create gp scheme by mysql table start . params:"+ JSON.toJSONString(info));
        return updateSchema(info,flag);
    }

    private Object updateSchema(SchemeInfo info,boolean flag) {
        BasicResponse response=new BasicResponse();
        if(!flag) {
            if (schemeService.hasSchemeRecoder(info)) {
                response.setCode(ResponseStatus.EXIST);
                response.setErrMessage("该scheme已存在数据是否更新");
                return response;
            }
        }
        //1 更新scheme
        info=schemeService.buidGPSchemeFromMysql(info, OperateType.UPDATE);
        //2 构建响应
        buidResponse(info, response);
        //3  更新元数据
        log.info("create gp scheme  end ");
        //
        return response;
    }

    @RequestMapping("/updateGpSchemaByID")
    @ResponseBody
    public Object updateGpSchema(String id,boolean flag) {
        log.info("create gp scheme by schemeInfo id start . params:"+id);
        SchemeInfo info= schemeService.queryByID(id);
        return updateSchema(info,flag);
    }

    private void buidResponse(SchemeInfo info, BasicResponse response) {
        response.setCode(info.getStatus());
        response.setErrMessage(info.getMessage());
    }


    /**

     *
     *保存用户填写表单信息
     */
    @RequestMapping("/saveOrUpdateScheme")
    @ResponseBody
    public Object saveOrUpdateSchema(SchemeInfo info) {
        log.info("save or update scheme Record start . params:"+ JSON.toJSONString(info));
        BasicResponse response=new BasicResponse();
        //1
        info=schemeService.savaOrUpdate(info);
        //2 构建响应
        buidResponse(info, response);
        log.info("save or update scheme Record  end ");
        return response;
    }
    @RequestMapping("/syncData")
    @ResponseBody
    public Object syncDataToGP(String id){
        BasicResponse response=new BasicResponse();
        SchemeInfo   info= schemeService.queryByID(id);
         if(!schemeService.hasSchemeRecoder(info)){
            response.setCode(ResponseStatus.ERROR);
            response.setErrMessage("请先将表结构同步到gp中");
            return response;
        }
        syncDataService.executeTask(info);
        buidResponse(info,response);
        return response;
    }
    @RequestMapping("/querySyncDataLog")
    @ResponseBody
    public  Object  querySyncDataLog(TaskExecuteLog info){
        log.info("query  query SyncData Log start. params:"+  JSON.toJSONString(info));
        SearchResult<TaskExecuteLog> taskExecuteLogList= syncDataService.queryList(info);
        log.info("query  SyncData Log  end.");
        return taskExecuteLogList;
    }

    /**
     * 查询用户的更新的scheme的记录(用户在界面编辑的mysql的scheme 信息）
     * @param info
     * @return
     */
    @RequestMapping("/queyrSynSchemeRecord")
    @ResponseBody
    public  Object synSchemeRecordList(SchemeInfo info){
        log.info("query  synchronization scheme   record  start. params:"+ JSON.toJSONString(info));
        info.setSortAndDesc("update_time desc");
        SearchResult<SchemeInfo> synSchemeRecordList = schemeService.queryList(info);
        log.info("query  synchronization scheme   record  end.");
        return synSchemeRecordList;
    }

    @RequestMapping("/schemeLogDetail")
    public ModelAndView schemeLogDetail(String tableId){
        ModelAndView modelAndView =super.initModelAndView();
        SchemeInfo info =schemeService.queryByID(tableId);
        modelAndView.addObject("scheme", info);
        return modelAndView;
    }

    @RequestMapping("/bizSourceMeta")
    public ModelAndView bizSourceMeta( ) {
    	ModelAndView modelAndView =super.initModelAndView();
    	modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.业务库);
    	return modelAndView;
    }
    @RequestMapping("/bizSourceMetaManage")
    public ModelAndView bizSourceMetaManage( String id) {
    	ModelAndView modelAndView =super.initModelAndView();
        SchemeInfo info =schemeService.queryByID(id);
        modelAndView.addObject("info", info);
        modelAndView.setViewName("bizSourceMetaAdd");
    	modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.业务库);
        List<Config> configList = configService.getConfigByType(DATABASE_PARAM_TYPE);
        Map<String, DataBaseParams> paramsMap = new LinkedHashMap<String, DataBaseParams>();
        if(CollectionUtils.isNotEmpty(configList)){
            for (Config config : configList) {
                DataBaseParams params = JSON.parseObject(config.getConfigValue(), DataBaseParams.class);
                params.setName(config.getConfigKey());
                paramsMap.put(config.getConfigKey(), params);
            }
        }
        modelAndView.addObject("dataBaseList", JSON.toJSONString(paramsMap));
        modelAndView.addObject("dataBaseMap", paramsMap);
    	return modelAndView;
    }
    @RequestMapping("/bizSourceMetaAdd")
    public ModelAndView bizSourceMetaAdd( ) {
    	ModelAndView modelAndView =super.initModelAndView();
    	modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.业务库);
        List<Config> configList = configService.getConfigByType(DATABASE_PARAM_TYPE);
        Map<String, DataBaseParams> paramsMap = new HashMap<String, DataBaseParams>();
        if(CollectionUtils.isNotEmpty(configList)){
            for (Config config : configList) {
                DataBaseParams params = JSON.parseObject(config.getConfigValue(), DataBaseParams.class);
                params.setName(config.getConfigKey());
                paramsMap.put(config.getConfigKey(), params);
            }
        }
        modelAndView.addObject("dataBaseList", JSON.toJSONString(paramsMap));
        modelAndView.addObject("dataBaseMap", paramsMap);
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping("/createGpSchemeTest")
    public Object createGpSchemeTest() {
        //qding_passport,member_hk_room_relation,ods.ods_member_hk_room_relation,10.37.5.123,3308,qding_passport,qding_read,wh2HR~]t,;
        SchemeInfo info = new SchemeInfo();
       /* info.setDbName("tests");
        info.setIp("10.37.253.42:3307");
        info.setUser("dev");
        info.setTableName("congqing");
        info.setPassword("458kT*!W");*/
        info.setDbName("qding_passport");
        info.setIp("10.37.5.123:3308");
        info.setUser("qding_read");
        info.setTableName("account");
        info.setPassword("wh2HR~]t");
        info.setStatus(1);
        info.setUpdateType(2);
        info.setAlias("表名");
        info.setOwner("owenr");

        info= schemeService.queryByID("532149d67051453a99f1e58fa9209156");
        info= schemeService.savaOrUpdate(info);
        BasicResponse response=new BasicResponse();
        buidResponse(info, response);
        /*log.info("query  synchronization scheme   record  start. params:"+ JSON.toJSONString(info));
        SearchResult<SchemeInfo> synSchemeRecordList = schemeService.queryList(info);
        for(SchemeInfo i:synSchemeRecordList.getRows()){
            System.out.println(i.getId());
        }*/

        return response;
    }
    @ResponseBody
    @RequestMapping("addDatabase")
    public Result addDataBase(){
        DataBaseParams dataBaseParams = new DataBaseParams();
        dataBaseParams.setName("测试库1");
        dataBaseParams.setDb("dw");
        dataBaseParams.setPassword("1111");
        dataBaseParams.setUrl("192.168.1.5:3306");
        dataBaseParams.setUser("root");
        Config config = new Config();
        config.setConfigType(DATABASE_PARAM_TYPE);
        config.setConfigKey(dataBaseParams.getName());
        config.setConfigValue(JSON.toJSONString(dataBaseParams));
        config.setDescription("业务费数据库连接参数u");

        configService.save(config);
        return Result.success();
    }

}
