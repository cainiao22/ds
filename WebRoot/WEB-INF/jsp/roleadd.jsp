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
<script type='text/javascript' src="js/usermanage.js"></script>
</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">角色管理</h1>
				</div>
			</div>

			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>


			<div class="filters section" id="FilterTabs">
				<div class="tab-contents">
					<ul>
						<li style="">

							<form class="form-inline" action="./rolesave" method="post">
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="groupName">角色信息: </label> <label class="span4">中文名称:
											<input type="text" name="cnName" class="input-medium"
											value="${role.cnName }">
										</label> <label class="span4">英文名称: <input type="text"
											name="enName" class="input-medium"
											value="${role.enName }">
										</label>

									</div>
									<div class="separator"></div>
								</div>
								<div class="buttons" style="text-align: center;">
									<input type="hidden" name="id" id="id" value="${role.id }" />
									<button id="submitBtn" type="submit" class="btn btn-success">确定</button>
								</div>
							</form>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>