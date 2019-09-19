<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="authority"%>
<c:import url="common/topnotice.jsp"></c:import>
<div class="header-wrapper" id="Top">
	<div class="header">

		<div class="logo">
			<img src="img/logo.png" />
		</div>
		<div class="top-nav">
			<span id="onduty"
				style="color: #FFFFCC; text-align: left; float: left; margin-left: 350px;"></span>
			<span style="color: white;">欢迎你,</span><span id="currentUserInfo"
				class="currentUserName"></span>
			<my:hasAuthority module="syncAuthority">|
					<a id="syncAuthority" href="javascript:void(0);"><span
					style="color: white;">权限同步</span></a>
			</my:hasAuthority>
			|<a href="./logout"><span style="color: white;">退出</span></a>
		</div>
	</div>
</div>
