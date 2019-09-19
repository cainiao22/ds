package com.qding.bigdata.ds.controller;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.datatransform.enums.CommonDataTypeEnum;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.DataxConfigFile;
import com.qding.bigdata.ds.service.DataxConfigFiltService;
import com.qding.bigdata.ds.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DataxConfigFiltController extends BasicController{

    @Autowired
    private DataxConfigFiltService dataxConfigFiltService;

    /**
     * 跳转页面以及查询下拉列表信息,菜单信息
     * @return
     */
    @RequestMapping("dataxConfigFiltManage")
    public ModelAndView dataxConfigFiltManage(){
        ModelAndView modelAndView = initModelAndView("dataxConfigFiltManage");
        List<String> dataSources=new ArrayList<String>();
        CommonDataTypeEnum[] values = CommonDataTypeEnum.values();
        for (CommonDataTypeEnum em:values) {
            dataSources.add(em.getDataSource());
        }
        modelAndView.addObject("dataSources",dataSources);
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.datax配置文件管理);
        return modelAndView;
    }

    /**
     * 查询数据库信息
     * @param dataxConfigFile
     * @return
     */
    @RequestMapping(value = "queryDataBaseInfo")
    @ResponseBody
    public Map<String, Object> queryDataBaseInfo(DataxConfigFile dataxConfigFile){
        return dataxConfigFiltService.queryDataBaseInfo(dataxConfigFile);
    }

    /**
     * 生成JSON文件
     * @param dataxConfigFile
     * @return
     */
    @RequestMapping(value = "createJsonFile")
    @ResponseBody
    public Map<String, Object> createJsonFile(DataxConfigFile dataxConfigFile, HttpServletRequest request){
        return dataxConfigFiltService.createJsonFile(dataxConfigFile, request);
    }

    /**
     * 下载Json文件
     * @param jsonPath
     * @return
     */
    @RequestMapping(value = "downloadJsonFile")
    @ResponseBody
    public Map<String, Object>  downloadJsonFile(String jsonPath, HttpServletResponse response, HttpServletRequest request) throws IOException {
        boolean isOk = false;
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if(!isOk){
                File file = new File(jsonPath);
                String fileName = file.getName();
                //String nameHz = jsonPath.substring(jsonPath.lastIndexOf(".")+1);
                FileUtil.downloadFile(request,response,jsonPath,fileName);
                isOk = true;
            }
            if(isOk){
                File f = new File(jsonPath);  // 输入要删除的文件位置
                if(f.exists()){
                    f.delete();
                }
            }
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("errInfo",e.getMessage());
        }
        return map;
    }

    /**
     * 删除JSON文件
     * @param jsonPath
     * @return
     */
    @RequestMapping(value = "delJsonFile")
    @ResponseBody
    public Map<String, Object> delJsonFile(String jsonPath){
        return dataxConfigFiltService.delJsonFile(jsonPath);
    }
}
