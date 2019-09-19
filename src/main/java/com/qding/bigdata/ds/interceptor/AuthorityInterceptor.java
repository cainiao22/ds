package com.qding.bigdata.ds.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qding.bigdata.ds.config.EnvConfig;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.model.User;
import com.qding.bigdata.ds.service.UserService;
import com.qding.bigdata.ds.service.impl.UserServiceImpl;
import com.qding.bigdata.ds.util.AuthorityUtil;
import com.qding.bigdata.ds.util.CookieUtil;
import com.qding.bigdata.ds.util.LoginUtil;

public class AuthorityInterceptor extends HandlerInterceptorAdapter {
	private List<String> excludedUrls;

	@SuppressWarnings("deprecation")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if(EnvConfig.isEnvLocal()){
			return true;
		}

		String userId = CookieUtil.getCookieValue(request, Constant.USERID);

		if (StringUtils.isNotBlank(userId) && !AuthorityUtil.hasModules(userId)) {
			UserService userService = RequestContextUtils.getWebApplicationContext(request)
					.getBean(UserServiceImpl.class);
			User userParam = new User();
			userParam.setId(userId);
			User user = userService.getOne(userParam);
			if (user == null) {
				return false;
			}
			LoginUtil.setLogin(request, response, user);
			AuthorityUtil.sync(userId, userService.getAllowedModules(user));

		}

		String servletPath = request.getServletPath().replace("/", "");
		if (servletPath.equals("index")) {
			return true;
		}
		for (String excludedUrl : excludedUrls) {
			if ((excludedUrl.startsWith(".") && servletPath.endsWith(excludedUrl)) || excludedUrl.equals(servletPath)) {

				return true;
			}
		}

		if (AuthorityUtil.hasAuthority(servletPath)) {
			return true;
		}

		response.sendRedirect("./notallowed.html");
		return false;

	}

	public List<String> getExcludedUrls() {
		return excludedUrls;
	}

	public void setExcludedUrls(List<String> excludedUrls) {
		this.excludedUrls = excludedUrls;
	}

}
