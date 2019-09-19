<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="authority"%>
<div class="aside">
	<ul class="nav">
		<my:hasAuthority module="SysManage_group">
			<li class=""><a class="recordable open"
				href="javascript:void(0)">系统管理</a>
				<ul>
					<li class=""><a href="index">欢迎页面</a></li>
						<my:hasAuthority module="userinfo">
						<li class=""><a href="userinfo">个人信息</a></li>
					</my:hasAuthority>
					<my:hasAuthority module="userlist">
						<li class=""><a href="userlist">用户管理</a></li>
					</my:hasAuthority>
				
					<my:hasAuthority module="rolelist">
						<li class=""><a href="rolelist">角色管理</a></li>
					</my:hasAuthority>
					<my:hasAuthority module="modulelist">
						<li class=""><a href="modulelist">模块管理</a></li>
					</my:hasAuthority>


				</ul></li>
		</my:hasAuthority>

		<my:hasAuthority module="userProfileGroup">
			<li class=""><a class="recordable open"
				href="javascript:void(0)">用户画像</a>
				<ul>
						<my:hasAuthority module="userProfile">
						<li class=""><a href="userProfile">画像分析</a></li>
						</my:hasAuthority>
						<my:hasAuthority module="listTag">
						<li class=""><a href="listTag">标签管理</a></li>
						</my:hasAuthority>
						
				</ul></li>
		</my:hasAuthority>
		<my:hasAuthority module="metaGroup">
			<li class=""><a class="recordable open"
				href="javascript:void(0)">元数据系统</a>
				<ul>
						<my:hasAuthority module="metaTableList">
						<li class=""><a href="metaTableList">数据仓库</a></li>
						</my:hasAuthority>
						
						<my:hasAuthority module="measureList">
						<li class=""><a href="measureList">数据指标库</a></li>
						</my:hasAuthority>
				</ul></li>
		</my:hasAuthority>
		<my:hasAuthority module="metaGroup">
			<li class=""><a class="recordable open"
							href="javascript:void(0)">调度任务</a>
				<ul>
					<my:hasAuthority module="metaTableList">
						<li class=""><a href="monitorExecutorList">任务执行</a></li>
					</my:hasAuthority>
				</ul></li>
		</my:hasAuthority>
	</ul>
</div>
