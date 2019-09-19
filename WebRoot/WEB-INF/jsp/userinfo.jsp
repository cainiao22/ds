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
<c:import url="common/cssjs.jsp"></c:import>
</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">个人信息</h1>
				</div>
			</div>

	<div>
	
	<c:choose>
								<c:when test="${resCode eq 0 }">
									<td><span class="label label-success">更新成功!</span></td>
								</c:when>
								<c:when test="${resCode eq 1 }">
									<td><span class="label label-warning">更新失败：原密码或新密码输入不全！</span></td>
								</c:when>
									<c:when test="${resCode eq 2 }">
									<td><span class="label label-warning">更新失败：原密码错误！</span></td>
								</c:when>
							</c:choose>
	</div>
			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>

	<form class="form-inline" action="./userinfo" method="post"
								id="form">
			<div class="filters section" id="FilterTabs">
				<div class="tab-contents">
					<ul>
						<li style="">

						
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="groupName">个人信息: </label> <label class="span3">
											用户名:  
											${currentUser.userName } 
												 
										</label> <label class="span3"> 姓名:  ${currentUser.realName }</label> <label class="span3">
											原密码:  
													<input type="text" name="password" class="input-medium"
														value="">
											 
										</label>
<label class="span3">
											新密码:  
													<input type="text" name="newPassword" class="input-medium"
														value="">
											 
										</label>
									</div>

									<div class="separator"></div>
								</div>



							
						</li>
					</ul>
				</div>
			</div>
			
			<div class="buttons" style="text-align: center;">

				<button id="submitBtn" type="submit" class="btn btn-success">确定</button>
			</div>
			</form>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>