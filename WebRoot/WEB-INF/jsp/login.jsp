<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="common/title.jsp"></c:import>
<link rel='stylesheet' type='text/css' href='css/login.css' />
<script type='text/javascript' src="js/jquery-1.7.2.min.js"></script>
<script type='text/javascript' src="js/login.js"></script>

</head>
<body>
	<c:import url="common/topnotice.jsp"></c:import>
	<div id="main">
		<!--头部-->
		<div class="top">
			<div class="logo">
				<a href="./" target="_top"><img src="./img/logo_login.png"></a>
			</div>
		</div>
		<!--头部 end-->

		<div class="main_body">
			<div class="login">
				<div class="logo_blue">
					<img src="./img/lock.gif">&nbsp;&nbsp;登&nbsp;&nbsp;录
				</div>
				<form action="#" name="loginForm" id="loginForm" method="post">
					<div class="logintable link1">
						<ul>
							<li class=" zi_red" id="tip_login"
								style="display: none; text-align: center; width: 300px;"></li>
						</ul>
						<ul>
							<li class="logint_l">登录名：</li>
							<li><input value="" id="username" class="logininput_l"
								type="text"></li>
							<li class="logint_r zi_red" id="tip_username"
								style="visibility: hidden;">用户名不能为空！</li>
						</ul>

						<ul>
							<li class="logint_l">密&nbsp;&nbsp;&nbsp;码：</li>
							<li><input id="password" class="logininput_l"
								type="password" value=""></li>
							<li class="logint_r zi_red" id="tip_password"
								style="visibility: hidden;">密码不能为空！</li>
						</ul>
					</div>
					<div class="btnenter">
						<img src="./img/enter.gif" id="loginBtn" style="cursor: pointer;">
					</div>
					<div class="logint_r zi_red" style="padding-left: 105px;">统一使用boss系统用户登陆</div>
					
				</form>
			</div>
		</div>
		<div id="s_footer">
			www.qding.me
		</div>
		<!--底-->
	</div>

	<script type='text/javascript' src="js/common_public.js?v=20130916"></script>
</body>
</html>