package com.qding.bigdata.ds.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.enums.DBTypeEnum;
import com.qding.bigdata.ds.service.MetaDbsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.service.MetaTableService;
import com.qding.bigdata.ds.util.CommonUtil;
import com.qding.bigdata.ds.util.PageUtil;

@Controller
public class MetaTableController extends BasicController {

	@Autowired
	private MetaTableService metaTableService;

	@Autowired
	private Map<String, MetaDbsService> hiveMetaDbsServiceMap;

	@RequestMapping("/metaTableList")
	public ModelAndView metaTableList(MetaTable metaTableParam) {
		Integer totalCount = metaTableService.count(metaTableParam);
		List<MetaTable> metaTableList = metaTableService.list(metaTableParam);
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("dbTypes", DBTypeEnum.values());
		Map<String, List<String>> metaTableTypes = new HashMap<String, List<String>>();
		for (DBTypeEnum dbTypeEnum : DBTypeEnum.values()){
			List<String> allDbs = hiveMetaDbsServiceMap.get(dbTypeEnum.handlerName).getAllDbs();
			metaTableTypes.put(dbTypeEnum.name(), allDbs);

		}
		modelAndView.addObject("metaTableTypes", JSON.toJSONString(metaTableTypes));
		modelAndView.addObject("totalCount", totalCount);
		modelAndView.addObject("totalPage", PageUtil.getTotalCount(totalCount, metaTableParam.getPageCount()));
		modelAndView.addObject("metaTableList", metaTableList);
		modelAndView.addObject("metaTableParam", metaTableParam);
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据仓库);
		return modelAndView;
	}

	@RequestMapping("/metaTableAdd")
	public ModelAndView metaTableAdd(MetaTable metaTableParam) {
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("dbTypes", DBTypeEnum.values());
		Map<String, List<String>> metaTableTypes = new HashMap<String, List<String>>();
		for (DBTypeEnum dbTypeEnum : DBTypeEnum.values()){
			List<String> allDbs = hiveMetaDbsServiceMap.get(dbTypeEnum.handlerName).getAllDbs();
			metaTableTypes.put(dbTypeEnum.name(), allDbs);

		}
		modelAndView.addObject("metaTableParam", metaTableParam);
		modelAndView.addObject("metaTableTypes", JSON.toJSONString(metaTableTypes));
		modelAndView.addObject("etl_job_types", Constant.ETL_JOB_TYPES);
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据仓库);
		return modelAndView;
	}

	@RequestMapping("/metaTableSave")
	public String metaTableSave(MetaTable metaTableParam) {
		if (CommonUtil.isEmpty(metaTableParam.getId())) {
			metaTableService.save(metaTableParam);
		} else {
			metaTableService.update(metaTableParam);
		}
		StringBuffer sb = getRedirectMetatableList(metaTableParam);
		return sb.toString();
	}

	private StringBuffer getRedirectMetatableList(MetaTable metaTableParam) {
		StringBuffer sb = new StringBuffer("redirect:./metaTableList?");
		if(StringUtils.isNotBlank(metaTableParam.getType())){
			sb.append("&type=").append(metaTableParam.getType());
		}
		if(StringUtils.isNotBlank(metaTableParam.getDbType())){
			sb.append("&dbType=").append(metaTableParam.getDbType());
		}
		if(StringUtils.isNotBlank(metaTableParam.getOwner())){
			sb.append("&owner=").append(URLEncoder.encode(metaTableParam.getOwner()));
		}
		if(StringUtils.isNotBlank(metaTableParam.getKeyword())){
			sb.append("&keyword=").append(URLEncoder.encode(metaTableParam.getKeyword()));
		}
		return sb;
	}

	@RequestMapping("/metaTableManage")
	public ModelAndView metaTableManage(MetaTable metaTableParam) {
		MetaTable metaTable = metaTableService.getOne(metaTableParam);
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("metaTable", metaTable);
		modelAndView.addObject("dbTypes", DBTypeEnum.values());
		Map<String, List<String>> metaTableTypes = new HashMap<String, List<String>>();
		for (DBTypeEnum dbTypeEnum : DBTypeEnum.values()){
			List<String> allDbs = hiveMetaDbsServiceMap.get(dbTypeEnum.handlerName).getAllDbs();
			metaTableTypes.put(dbTypeEnum.name(), allDbs);

		}
		modelAndView.addObject("metaTableParam", metaTableParam);
		modelAndView.addObject("metaTableTypes", JSON.toJSONString(metaTableTypes));
		modelAndView.addObject("etl_job_types", Constant.ETL_JOB_TYPES);
		modelAndView.setViewName("metaTableAdd");
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据仓库);
		return modelAndView;
	}

	@RequestMapping("/metaTableDelete")
	public String metaTabledelete(MetaTable metaTableParam) {
		metaTableService.delete(metaTableParam);
		StringBuffer sb = getRedirectMetatableList(metaTableParam);
		return sb.toString();
	}

}
