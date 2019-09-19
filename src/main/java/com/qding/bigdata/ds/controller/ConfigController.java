package com.qding.bigdata.ds.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.TableConfig;
import com.qding.bigdata.ds.service.ConfigService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by yanpf on 2017/9/5.
 */
@Controller
public class ConfigController extends BasicController {

    @Autowired
    ConfigService configService;

    @RequestMapping("/configIndex")
    public ModelAndView configIndex() {
        ModelAndView modelAndView = initModelAndView();
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.字典管理);
        return modelAndView;
    }
    //数据表配置列表
    @RequestMapping("/tableConfigIndex")
    public ModelAndView tableConfigIndex() {
        ModelAndView modelAndView = initModelAndView();
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据表配置);
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping("getConfig")
    public Config getConfig(String type, String key){
        Config config = configService.getConfig(type, key);
        return config;
    }

    @ResponseBody
    @RequestMapping("queryConfig")
    public SearchResult<Config> queryConfig(Config param){
        return configService.query(param);
    }

    @ResponseBody
    @RequestMapping("queryTableConfig")
    public SearchResult<TableConfig> queryTableConfig(Config param){
        SearchResult<TableConfig> query = configService.queryTableConfig(param);
        return query;
    }

    @RequestMapping("/configDetail")
    public ModelAndView configDetail(String id) {
        ModelAndView modelAndView = initModelAndView();
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.字典管理);
        Config config = configService.getConfigById(id);
        modelAndView.addObject("config", config);
        return modelAndView;
    }

    @RequestMapping("/tableConfigDetail")
    public ModelAndView tableConfigDetail(String id) {
        ModelAndView modelAndView = initModelAndView();
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据表配置);
        TableConfig config = configService.getTableConfigById(id);
        modelAndView.addObject("config", config);
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping("/configSave")
    public Result configSave(Config config) {
        if(StringUtils.isEmpty(config.getConfigType())){
            return Result.failed(1, "类型为必填");
        }
        if(StringUtils.isEmpty(config.getConfigKey())){
            return Result.failed(1, "key为必填");
        }
        if(StringUtils.isEmpty(config.getConfigValue())){
            return Result.failed(1, "value为必填");
        }
        if(StringUtils.isEmpty(config.getId())) {
            configService.save(config);
        }else {
            configService.update(config);
        }
        return Result.success();
    }
    @ResponseBody
    @RequestMapping("/tableConfigSave")
    public Result tableConfigSave(TableConfig tableConfig) {
        if(StringUtils.isEmpty(tableConfig.getConfigType())){
            return Result.failed(1, "类型为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getConfigKey())){
            return Result.failed(1, "key为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getDb())){
            return Result.failed(1, "数据库名为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getName())){
            return Result.failed(1, "数据库描述为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getPassword())){
            return Result.failed(1, "密码为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getUrl())){
            return Result.failed(1, "数据库地址为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getUser())){
            return Result.failed(1, "用户名为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getDbtype())){
            return Result.failed(1, "数据库类型为必填");
        }
        if(StringUtils.isEmpty(tableConfig.getSchema())){
            return Result.failed(1, "schema为必填");
        }
        String config_value="{'db':'"+tableConfig.getDb()+"','name':'"+tableConfig.getName()
                +"','password':'"+tableConfig.getPassword()+"','url':'"+tableConfig.getUrl()
                +"','user':'"+tableConfig.getUser()+"','dbtype':'"+tableConfig.getDbtype()
                +"','schema':'"+tableConfig.getSchema()+"'}";
        JSONObject jsonObj = JSON.parseObject(config_value);
        Config config =new Config();
        config.setConfigKey(tableConfig.getConfigKey());
        config.setConfigValue(jsonObj.toString());
        config.setConfigOrder(tableConfig.getConfigOrder());
        config.setConfigParent(tableConfig.getConfigParent());
        config.setCreateTime(tableConfig.getCreateTime());
        config.setDescription(tableConfig.getDescription());
        config.setId(tableConfig.getId());
        config.setUpdateTime(tableConfig.getUpdateTime());
        config.setConfigType(tableConfig.getConfigType()+tableConfig.getDbtype().toUpperCase());
        if(StringUtils.isEmpty(tableConfig.getId())) {
            configService.save(config);
        }else {
            configService.update(config);
        }
        return Result.success();
    }
    @ResponseBody
    @RequestMapping("configDelete")
    public Result delete(String id){
        configService.delete(id);
        return Result.success();
    }
}
