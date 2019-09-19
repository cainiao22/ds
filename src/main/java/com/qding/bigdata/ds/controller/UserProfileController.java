package com.qding.bigdata.ds.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.Tag;
import com.qding.bigdata.ds.model.UserGroup;
import com.qding.bigdata.ds.service.TagService;
import com.qding.bigdata.ds.service.UserGroupService;
import com.qding.bigdata.ds.service.impl.UserProfileService;
import com.qding.bigdata.ds.util.PropertiesUtil;

@Controller
public class UserProfileController extends BasicController {
	@Autowired
	private TagService tagService;
	@Autowired
	private UserProfileService  userProfileService;
	@Autowired
	private UserGroupService userGroupService;
	
	
	@RequestMapping("/userProfile")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.画像分析);
		return modelAndView;

	}

	@RequestMapping("/getAllTags")
	@ResponseBody
	public Object getAllTags(HttpServletRequest request) {
		String modCondition = request.getParameter("modCondition");
		Tag tag = new Tag();
		if(StringUtils.isNotBlank(modCondition)&&modCondition.equals("1")){
			tag.setSimpleModle(1);
		}else if(StringUtils.isNotBlank(modCondition)&&modCondition.equals("2")){
			tag.setCommonConditon(1);
		}
		List<Tag> tagList = tagService.listAll(tag);
		return tagList;
	}

	@RequestMapping("/userProfilequery")
	@ResponseBody
	public Object userProfilequery(HttpServletRequest request,@RequestParam("query") String query) {
		return userProfileService.query(JSONObject.parseObject(query));
	}
	
	@RequestMapping("/userProfilequeryForSum")
	@ResponseBody
	public Object userProfilequeryForSum(HttpServletRequest request,@RequestParam("query") String query) {
		return userProfileService.queryForSum(JSONObject.parseObject(query));
	}

	@RequestMapping("/userProfileQueryById")
	@ResponseBody
	public Object userProfileQueryById(HttpServletRequest request) {
		String userGroupId = request.getParameter("userGroupId");
		UserGroup userGroupParam = new UserGroup();
		userGroupParam.setId(userGroupId);
		UserGroup userGroup = userGroupService.getOne(userGroupParam);
		JSONObject jsonObject = userGroup==null?null:JSON.parseObject(userGroup.getConditions());
		if(null!=jsonObject){
			return userProfileService.query(jsonObject);
		}else{
			return "用户群组ID【"+userGroupId+"】不存在，或者无分组条件";
		}
	}
	
	/**
	 * 导出用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/exportUsers")
	@ResponseBody
	public Object exportUsers(HttpServletRequest request) {
		String userGroupId = request.getParameter("userGroupId");
		Object exportUsers = null;
		try {
			exportUsers = userProfileService.exportUsers(userGroupId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exportUsers;
	}
	
	/**
	 * 查询用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUserListFileById")
	@ResponseBody
	public Object getUsersByGroupId(HttpServletRequest request) {
		
		long beginTime = System.currentTimeMillis();
		Map<String,Object> rsMap = new HashMap<String, Object>();
		String fileName = "";
		if(StringUtils.isNotBlank(request.getParameter("userGroupId"))){
			UserGroup userGroupParam = new UserGroup();
			userGroupParam.setId(request.getParameter("userGroupId"));
			UserGroup userGroup = userGroupService.getOne(userGroupParam);
			if (null != userGroup) {
				fileName =  PropertiesUtil.getPropertiesByKey(
						Constant.CONFIGFILE, "export.user.pre.url")+"/"+request.getParameter("userGroupId")+"/"+"export_user_"+request.getParameter("userGroupId")+".txt";
			}else{
				fileName = "文件不存在";
			}
		}
		rsMap.put("fileName",fileName);
		long endTime = System.currentTimeMillis();
		rsMap.put("usetime", (endTime - beginTime));
		return rsMap;
	}
	
	/**
	 * 关键词模糊检索接口
	 * @param request
	 * @return
	 */
	@RequestMapping("/getWordsByTag")
	@ResponseBody
	public Object getWordsByTag(HttpServletRequest request) {
		long beginTime = System.currentTimeMillis();
		String tag = request.getParameter("tag");
		String value = request.getParameter("value");
		List<String> lists = new ArrayList<String>();
		Map<String,Object> rsMap = new HashMap<String, Object>();
		lists = userProfileService.getWordsByTag(tag,value);
		rsMap.put("tag",tag);
		rsMap.put("value",value);
		rsMap.put("results",lists);
		long endTime = System.currentTimeMillis();
		rsMap.put("usetime", (endTime - beginTime));
		return rsMap;
	}
}
