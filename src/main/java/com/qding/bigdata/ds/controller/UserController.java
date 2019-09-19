package com.qding.bigdata.ds.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.Role;
import com.qding.bigdata.ds.model.RoleLevel;
import com.qding.bigdata.ds.model.User;
import com.qding.bigdata.ds.service.RoleLevelService;
import com.qding.bigdata.ds.service.RoleService;
import com.qding.bigdata.ds.service.UserRoleLevelService;
import com.qding.bigdata.ds.service.UserService;
import com.qding.bigdata.ds.util.AuthorityUtil;
import com.qding.bigdata.ds.util.CommonUtil;
import com.qding.bigdata.ds.util.CookieUtil;
import com.qding.bigdata.ds.util.LoginUtil;
import com.qding.bigdata.ds.util.PageUtil;

@Controller
public class UserController extends BasicController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private RoleLevelService roleLevelService;
	@Autowired
	private UserRoleLevelService userRoleLevelService;

	@ResponseBody
	@RequestMapping("/loginCheck")
	public Object loginCheck(User user, HttpServletRequest request, HttpServletResponse response) {

		Map<String, String> responseMap = new HashMap<String, String>();
		if( user.getUserName().trim().equals("admin")){
			User userInDb = userService.getUserByUserName(user.getUserName());
			boolean isValidUser = (userInDb != null);
			if (!isValidUser) {
				responseMap.put("result", Boolean.FALSE.toString());
				responseMap.put("reason", "抱歉，该用户未加入本系统认证，请联系管理员！");
				return responseMap;
			}

			if (userInDb.getPassword().equals(CommonUtil.md5(user.getPassword()))) {
				LoginUtil.setLogin(request, response, userInDb);
				AuthorityUtil.sync(userInDb.getId(), userService.getAllowedModules(userInDb));
				responseMap.put("result", Boolean.TRUE.toString());
				responseMap.put("reason", "");
				responseMap.put("url", "index");
				return responseMap;
			} else {
				responseMap.put("result", Boolean.FALSE.toString());
				responseMap.put("reason", "用户名或者密码错误！");
				return responseMap;
			}
		}else{
			responseMap.put("result", Boolean.FALSE.toString());
			responseMap.put("reason", "抱歉，该用户未加入本系统认证，请联系管理员！");
			return responseMap;
		}
	}
	
	@ResponseBody
	@RequestMapping("/loginByBoss")
	public Object loginByBoss(User user, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, String> responseMap = new HashMap<String, String>();
		/*
		//通过boss登陆
		userService.loginByBoss(user, request, response,responseMap);
		return responseMap;*/
		User userInDb = userService.getUserByUserName(user.getUserName());
		boolean isValidUser = (userInDb != null);
		if (!isValidUser) {
			responseMap.put("result", Boolean.FALSE.toString());
			responseMap.put("reason", "抱歉，该用户未加入本系统认证，请联系管理员！");
			return responseMap;
		}

		if (userInDb.getPassword().equals(CommonUtil.md5(user.getPassword()))) {
			LoginUtil.setLogin(request, response, userInDb);
			AuthorityUtil.sync(userInDb.getId(), userService.getAllowedModules(userInDb));
			responseMap.put("result", Boolean.TRUE.toString());
			responseMap.put("reason", "");
			responseMap.put("url", "index");
			return responseMap;
		} else {
			responseMap.put("result", Boolean.FALSE.toString());
			responseMap.put("reason", "用户名或者密码错误！");
			return responseMap;
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		LoginUtil.setLogout(request, response);
		return "redirect:./login";

	}

	@ResponseBody
	@RequestMapping("/getCurrentUserInfo")
	public Object getCurrentUserInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put(Constant.USERNAME, CookieUtil.getCookieValue(request, Constant.USERNAME));
		responseMap.put(Constant.REALNAME, CookieUtil.getCookieValue(request, Constant.REALNAME));
		return responseMap;

	}

	@ResponseBody
	@RequestMapping("/syncAuthority")
	public Object syncAuthority() {
		Map<String, String> responseMap = new HashMap<String, String>();
		userService.syncsAllUsersAuthority();
		responseMap.put("result", "1");
		responseMap.put("info", "同步完成");
		return responseMap;

	}

	@RequestMapping("/userlist")
	public ModelAndView userlist(User userParam) {
		Integer totalCount = userService.count(userParam);
		List<User> userList = userService.list(userParam);
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("totalCount", totalCount);
		modelAndView.addObject("totalPage", PageUtil.getTotalCount(totalCount, userParam.getPageCount()));
		modelAndView.addObject("userList", userList);
		modelAndView.addObject("userParam", userParam);
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.用户管理);
		return modelAndView;
	}

	@RequestMapping("/useradd")
	public ModelAndView useradd() {
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.用户管理);
		return modelAndView;
	}

	@RequestMapping("/usersave")
	public String usersave(User userParam) {
		if (CommonUtil.isEmpty(userParam.getId())) {
			userService.save(userParam);
		} else {
			userService.update(userParam);
		}
		return "redirect:./userlist";
	}

	@RequestMapping("/usermanage")
	public ModelAndView usermanage(User userParam) {
		User user = userService.getOne(userParam);
		List<RoleLevel> userRoleLevels = roleLevelService.listByUser(userParam);

		HashSet<String> userRolesSet = new HashSet<String>();
		HashSet<String> userRoleLevelsSet = new HashSet<String>();
		for (RoleLevel roleLevel : userRoleLevels) {
			userRoleLevelsSet.add(roleLevel.getId());
		}
		List<Role> roleList = roleService.listAll(new Role());
		for (Role role : roleList) {

			roleService.putSubRoleLevels(role);
		}
		ModelAndView modelAndView = initModelAndView();
		modelAndView.addObject("roleList", roleList);
		modelAndView.addObject("userRolesSet", userRolesSet);
		modelAndView.addObject("userRoleLevelsSet", userRoleLevelsSet);
		modelAndView.addObject("user", user);
		modelAndView.setViewName("useradd");
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.用户管理);
		return modelAndView;
	}

	@RequestMapping("/userinfo")
	public ModelAndView userinfo(HttpServletRequest request,User userParam ) {
		userParam.setId( CookieUtil.getCookieValue(request, Constant.USERID));
		User currentUser = userService.getOne(userParam);
		ModelAndView modelAndView = initModelAndView();
		if("POST".equals(request.getMethod())){
		modelAndView.addObject("resCode",this.userService.updatePassword(userParam));
		}
	
		modelAndView.addObject("currentUser", currentUser);
		modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.用户管理);
		return modelAndView;
	}

	@RequestMapping("/userdelete")
	public String userdelete(User userParam) {
		userService.delete(userParam);
		return "redirect:./userlist";
	}

	@ResponseBody
	@RequestMapping("/getTotalByUserName")
	public Object getTotalCountByUsername(User user) {
		Map<String, String> responseMap = new HashMap<String, String>();
		responseMap.put("total", this.userService.count(user).toString());
		return responseMap;

	}

}
