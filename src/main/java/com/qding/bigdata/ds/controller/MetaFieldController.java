package com.qding.bigdata.ds.controller;

import java.util.List;

import com.qding.bigdata.ds.common.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.MetaField;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.service.MetaFieldService;
import com.qding.bigdata.ds.service.MetaTableService;
import com.qding.bigdata.ds.util.CommonUtil;
import com.qding.bigdata.ds.util.PageUtil;

@Controller
public class MetaFieldController extends BasicController {

	@Autowired
	private MetaFieldService metaFieldService;
	@Autowired
	private MetaTableService metaTableService;

	@RequestMapping("/metaFieldList")
	public ModelAndView metaFieldList(MetaField metaFieldParam) {
		if(metaFieldParam.getSortAndDesc() == null){
			metaFieldParam.setSortAndDesc("name");
		}
		Integer totalCount = metaFieldService.count(metaFieldParam);
		List<MetaField> metaFieldList = metaFieldService.listAll(metaFieldParam);
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("metaFieldTypes", Constant.META_FIELD_TYPES);
		modelAndView.addObject("totalCount", totalCount);
		modelAndView.addObject("totalPage", PageUtil.getTotalCount(totalCount, metaFieldParam.getPageCount()));
		modelAndView.addObject("metaFieldList", metaFieldList);
		modelAndView.addObject("metaFieldParam", metaFieldParam);
		MetaTable metaTableParam = new MetaTable();
		metaTableParam.setId(metaFieldParam.getTableId());
		modelAndView.addObject("metaTable", metaTableService.getOne(metaTableParam));
		modelAndView.addObject(Constant.SIDEBAR_MENU,SideBarMenu.数据仓库);
		return modelAndView;
	}

	@RequestMapping("/metaFieldAdd")
	public ModelAndView metaFieldAdd(MetaField metaFieldParam) {
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("metaFieldTypes", Constant.META_FIELD_TYPES);
		modelAndView.addObject("metaFieldParam", metaFieldParam);
		MetaTable metaTableParam = new MetaTable();
		metaTableParam.setId(metaFieldParam.getTableId());
		modelAndView.addObject("metaTable", metaTableService.getOne(metaTableParam));
		modelAndView.addObject("allMetaTables", this.metaTableService.listAll(new MetaTable()));
		modelAndView.addObject(Constant.SIDEBAR_MENU,SideBarMenu.数据仓库);
		return modelAndView;
	}

	@RequestMapping("/metaFieldSave")
	public String metaTableSave(MetaField metaFieldParam) {
		if(metaFieldParam.getSourceTables()==null){
			metaFieldParam.setSourceTables("");
		}
		if (CommonUtil.isEmpty(metaFieldParam.getId())) {
			metaFieldService.save(metaFieldParam);
		} else {
			metaFieldService.update(metaFieldParam);
		}
		return "redirect:./metaFieldList?tableId=" + metaFieldParam.getTableId();
	}

	@RequestMapping("/metaFieldManage")
	public ModelAndView metaTableManage(MetaField metaFieldParam) {
		MetaField metaField = metaFieldService.getOne(metaFieldParam);
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("metaField", metaField);
		modelAndView.addObject("metaFieldTypes", Constant.META_FIELD_TYPES);
		modelAndView.setViewName("metaFieldAdd");
		MetaTable metaTableParam = new MetaTable();
		metaTableParam.setId(metaField.getTableId());
		modelAndView.addObject("metaTable", metaTableService.getOne(metaTableParam));
		modelAndView.addObject("allMetaTables", this.metaTableService.listAll(new MetaTable()));
		modelAndView.addObject(Constant.SIDEBAR_MENU,SideBarMenu.数据仓库);
		return modelAndView;
	}

	@RequestMapping("/metaFieldDelete")
	public String metaTabledelete(MetaField metaFieldParam) {
		metaFieldService.delete(metaFieldParam);
		return "redirect:./metaFieldList?tableId=" + metaFieldParam.getTableId();
	}

	@RequestMapping("/syncFieldMeta")
	@ResponseBody
	public Result syncFieldMeta(MetaTable metaTable) {
		return metaTableService.syncFieldMeta(metaTable);
	}
	@RequestMapping("/updateFiled")
	@ResponseBody
	public Object updateFiled(@RequestParam("fieldId")String fieldId,@RequestParam("key")String key,
			@RequestParam("value")String value) {
		return metaTableService.updateFiled(fieldId,key,value);
	}

}
