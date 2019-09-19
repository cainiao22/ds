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
<c:import url="common/kindeditor.jsp"></c:import>

</head>
<body>

	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">通用配置</h1>
				</div>
			</div>

			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>
			<c:if test="${tip eq '1' }">
				<div>
					<span style="color: red;">更新成功！</span>
				</div>
			</c:if>
			<form class="form-inline" action="./sysconfigSaveOrUpdate"
				method="post" id="form">

				<div class="filters section" id="FilterTabs">
					<div class="tab-contents">
						<ul>
							<li style="">


								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="groupName">系统通告: </label> <label class="span6">
											<textarea name="notice" style="width: 600px;">${config.notice }</textarea>
										</label>
									</div>
									<div class="group clearfix">
										<label class="groupName">值班信息: </label> <label class="span6">
											<textarea name="onduty" style="width: 600px;">${config.onduty }</textarea>
										</label>
									</div>
									<div class="group clearfix">
										<label class="groupName">使用手册: </label> <label class="span6">
											<textarea name="handbook" id="handbook" style="width: 600px;">${config.handbook }</textarea>
										</label>
									</div>
									<div class="group clearfix">
										<label class="groupName">欢迎页面: </label> <label class="span6">
											<textarea name="welcomeContent" id="welcomeContent"
												style="width: 600px;">${config.welcomeContent }</textarea>
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