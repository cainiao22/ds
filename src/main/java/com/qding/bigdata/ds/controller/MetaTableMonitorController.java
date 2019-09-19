package com.qding.bigdata.ds.controller;

import java.util.List;

import com.qding.bigdata.ds.common.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.model.MetaTableMonitor;
import com.qding.bigdata.ds.service.MetaTableMonitorService;
import com.qding.bigdata.ds.service.MetaTableService;
import com.qding.bigdata.ds.util.CommonUtil;

/**
 * Created by yanpf on 2017/7/17.
 * 监控规则信息
 */

@Controller
public class MetaTableMonitorController extends BasicController {

    @Autowired
    MetaTableService metaTableService;

    @Autowired
    MetaTableMonitorService metaTableMonitorService;

    @RequestMapping("/metaTableMonitorList")
    public ModelAndView metaTableMonitorList(MetaTable metaTable) throws Exception {
        if (StringUtils.isEmpty(metaTable.getId())) {
            log.info("参数异常，metaTableId不能为空");
            throw new NullPointerException("metaTableId不能为空");
        }
        ModelAndView mv = initModelAndView();
        getMetaTable(metaTable.getId(), mv);
        List<MetaTableMonitor> metaTableMonitorList =
                metaTableMonitorService.getListByMetaTableId(metaTable.getId());
        mv.addObject("metaTableMonitorList", metaTableMonitorList);
        mv.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据仓库);
        return mv;
    }

    @RequestMapping("/metaTableMonitorAdd")
    public ModelAndView metaTableMonitorAdd(MetaTable metaTable) throws Exception {
        ModelAndView mv = initModelAndView();
        getMetaTable(metaTable.getId(), mv);
        mv.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据仓库);
        return mv;
    }

    @RequestMapping("/metaTableMonitorManage")
    public ModelAndView metaTableMonitorManage(MetaTableMonitor metaTableMonitorParam) throws Exception {
        ModelAndView mv = initModelAndView("metaTableMonitorAdd");
        MetaTableMonitor metaTableMonitor = metaTableMonitorService.getOne(metaTableMonitorParam);
        getMetaTable(metaTableMonitor.getMetaTableId(), mv);
        mv.addObject("metaTableMonitor", metaTableMonitor);
        mv.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据仓库);
        return mv;
    }

    @RequestMapping("/metaTableMonitorSave")
    public String metaTableMonitorSave(MetaTableMonitor metaTableMonitorParam) {
        if (CommonUtil.isEmpty(metaTableMonitorParam.getId())) {
            metaTableMonitorService.save(metaTableMonitorParam);
        } else {
            metaTableMonitorService.update(metaTableMonitorParam);
        }
        return "redirect:./metaTableMonitorList?id=" + metaTableMonitorParam.getMetaTableId();
    }

    @RequestMapping("/metaTableMonitorDelete")
    public String metaTableMonitorDelete(MetaTableMonitor metaTableMonitorParam) {
        metaTableMonitorService.delete(metaTableMonitorParam);
        return "redirect:./metaTableMonitorList?id=" + metaTableMonitorParam.getMetaTableId();
    }

    @ResponseBody
    @RequestMapping("/metaTableMonitorRun")
    public Result<String> metaTableMonitorRun(MetaTableMonitor metaTableMonitorParam){
       return metaTableMonitorService.runMonitor(metaTableMonitorParam);
    }

    /**
     * 将metaTable相关信息放到页面中去
     * @param metaTableId
     * @param mv
     * @throws Exception
     */
    private void getMetaTable(String metaTableId, ModelAndView mv) throws Exception {
        MetaTable metaTable = new MetaTable();
        metaTable.setId(metaTableId);
        MetaTable table = metaTableService.getOne(metaTable);
        if (table == null) {
            log.info("metaTable不存在, metaTableId:" + metaTable.getId());
            throw new Exception("metaTable不存在, metaTableId:" + metaTable.getId());
        }
        mv.addObject("metaTable", table);
    }
}
