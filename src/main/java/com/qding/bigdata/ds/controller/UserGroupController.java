package com.qding.bigdata.ds.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.enums.SideBarMenu;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.model.UserGroup;
import com.qding.bigdata.ds.service.UserGroupService;
import com.qding.bigdata.ds.service.impl.UserProfileService;
import com.qding.bigdata.ds.util.CommonUtil;
import com.qding.bigdata.ds.util.CookieUtil;

@Controller
public class UserGroupController extends BasicController {

	public static Logger logger = LoggerFactory.getLogger(UserProfileService.class);

	@Autowired
	private UserGroupService userGroupService;

	@Autowired
	private UserProfileService userProfileService;


	static ExecutorService pool = Executors.newFixedThreadPool(10);


	/**
	 * 获取用户群组列表
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUserGroups")
	@ResponseBody
	public Object getUserGroups(HttpServletRequest request) {
		long beginTime = System.currentTimeMillis();
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		String userId = request.getParameter("userId");
		//从Cookie获取用户名（对应boss后台账号）
		userId = CookieUtil.getCookieValue(request, Constant.USERNAME);
		UserGroup userGroupParam = new UserGroup();
		userGroupParam.setCreateUser(userId);
		List<UserGroup> userGroups = userGroupService.getUserGroups(userGroupParam);
		List<Object> list = new ArrayList<Object>();
		if(null != userGroups && userGroups.size()>0){
			for (UserGroup userGroup : userGroups) {
				Map<String,String> userGroupMap = new HashMap<String,String>();
				userGroupMap.put("groupId", userGroup.getId());
				userGroupMap.put("groupName", userGroup.getName());
				userGroupMap.put("modModel", userGroup.getModModel()+"");
				list.add(userGroupMap);
			}
		}
		map.put("reqid",UUID.randomUUID().toString().replace("-", ""));
		map.put("num", list.size());
		map.put("results", list);
		long endTime = System.currentTimeMillis();
		map.put("usetime", (endTime - beginTime));
		return map;
	}

	/**
	 * 根据群组ID获取分群条件
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping("/getConditionsById")
	@ResponseBody
	public Object getConditionsById(HttpServletRequest request) {
		long beginTime = System.currentTimeMillis();
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		String userGroupId = request.getParameter("userGroupId");
		map = userGroupService.getConditionsById(userGroupId);
		long endTime = System.currentTimeMillis();
		map.put("usetime", (endTime - beginTime));
		return map;
	}

	@RequestMapping("saveUserGroup")
	@ResponseBody
	public Object saveUserGroup(UserGroup userGroup,HttpServletRequest request) {
		long beginTime = System.currentTimeMillis();
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		String msg="";
		String results = "success";
		//usesrId为空，则从Cookie获取用户名（对应boss后台账号）
		userGroup.setCreateUser(CookieUtil.getCookieValue(request, Constant.USERNAME));
		userGroup.setUpdateUser(CookieUtil.getCookieValue(request, Constant.USERNAME));

		try {
			//检查状态，为空则默认置为1
			if(userGroup.getStatus()==null){
				userGroup.setStatus(0);
			}
			if (CommonUtil.isEmpty(userGroup.getId())) {
				userGroup.setId(UUID.randomUUID().toString());
				userGroupService.save(userGroup);
				msg = "save success!";
			} else {
				userGroupService.update(userGroup);
				msg = "update success!";
			}

			//用户群组ID存在，则生成用户列表
			UserGroup saveedUserGroup = userGroupService.getOne(userGroup);
			if(null!=saveedUserGroup){
				pool.submit(new ExportUserRunner(userGroup.getId(),userProfileService));
			}

		} catch (Exception e) {
			msg = "save or update faild";
			results = "faild";
		}
		map.put("reqid",UUID.randomUUID().toString().replace("-", ""));
		map.put("results", results);
		map.put("msg", msg);
		long endTime = System.currentTimeMillis();
		map.put("usetime", (endTime - beginTime));
		return map;
	}

	@ResponseBody
	@RequestMapping("listUserGroup")
	public SearchResult<UserGroup> listUserGroup(UserGroup userGroup) {
		List<UserGroup> userGroupList = userGroupService.list(userGroup);
		int count = userGroupService.count(userGroup);
		SearchResult<UserGroup> result = new SearchResult<UserGroup>();
		result.setRows(userGroupList);
		result.setCurrentPage(userGroup.getPage());
		result.setPageCount(userGroup.getPageCount());
		result.setTotal(count);

		return result;
	}

	@RequestMapping("/userGroupIndex")
	public ModelAndView userGroupIndex(HttpServletRequest request) {
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.群组管理);
		return modelAndView;

	}

	@RequestMapping("/usergroup")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView modelAndView = initModelAndView();
		return modelAndView;

	}

	@RequestMapping("addUserGroup")
	public ModelAndView addUserGroup() {
		ModelAndView modelAndView = initModelAndView();
		return modelAndView;
	}

	@RequestMapping("manageUserGroup")
	public ModelAndView manageUserGroup(UserGroup userGroupParam) {
		UserGroup userGroup = userGroupService.getOne(userGroupParam);
		ModelAndView modelAndView = initModelAndView("addUserGroup");
		modelAndView.addObject("userGroup", userGroup);
		return modelAndView;
	}

	@RequestMapping("deleteUserGroup")
	public String deleteUserGroup(UserGroup userGroup) {
		userGroupService.delete(userGroup);
		return "redirect:./userGroupIndex";
	}


	/**
	 * 导出用户列表线程
	 */
	static class ExportUserRunner  implements Runnable{

		private String userGroupId;
		private UserProfileService userProfileService;
		public ExportUserRunner(String userGroupId,UserProfileService userProfileService){
             this.userGroupId = userGroupId;
             this.userProfileService = userProfileService;
		}

		@Override
		public void run() {
			try {
				logger.info(Thread.currentThread().getName() +",正在导出用户群组【"+userGroupId+"】列表");
				long start = System.currentTimeMillis();
				userProfileService.exportUsers(userGroupId);
				long end = System.currentTimeMillis();
				logger.info(Thread.currentThread().getName() +",已成功导出用户群组【"+userGroupId+"】列表，耗时："+(end-start));
			}catch(Exception e){
				e.printStackTrace();
			}

		}
	}
}
