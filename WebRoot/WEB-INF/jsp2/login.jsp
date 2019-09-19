<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!-- BEGIN HEAD -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>千丁大数据平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<c:import url="common/global_style.jsp"></c:import>
<link href="./assets/pages/css/login-2.min.css" rel="stylesheet" type="text/css" />
</head>
<!-- END HEAD -->

<body class=" login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <h1>千丁大数据平台</h1>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form class="login-form" method="post">
                <h3 class="form-title">登录</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span>请输入用户名密码！ </span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">用户名</label>
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off"  name="username"  id="username"/> </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off"  name="password"  id="password" /> </div>
                </div>
                <div class="form-actions">
                 <p>   <button type="button" class="btn green pull-right inline" id="loginBtn"> 登录 </button></p>
                </div>
            
            </form>
            <!-- END LOGIN FORM -->
         
        </div>
        <!-- END LOGIN -->
               <c:import url="common/global_js.jsp"></c:import>
            <script src="./assets/pages/scripts/login.js"
	type="text/javascript"></script>
    </body>
</html>