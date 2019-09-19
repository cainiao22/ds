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
<script type='text/javascript' src="js/roleTableManage.js"></script>
<script type='text/javascript' src="js/usermanage.js"></script>
</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">用户管理</h1>
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

							<form class="form-inline" action="./usersave" method="post"
								id="form">
								<input type="hidden" name="rolesStr" id="rolesStr" /> <input
									type="hidden" name="id" id="id" value="${user.id }" />
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="groupName">用户信息: </label> <label class="span3">
											用户名: <c:choose>
												<c:when test="${ !empty  user}">${user.userName }</c:when>
												<c:otherwise>
													<input type="text" name="userName" id="userName"
														class="input-medium" value="${user.userName }">
												</c:otherwise>
											</c:choose>
										</label> <label class="span3"> 姓名: <input type="text"
											name="realName" class="input-medium"
											value="${user.realName }"></label> <label class="span3">
											密码: <c:choose>
												<c:when test="${ !empty  user}">
													<input type="text" name="password" class="input-medium"
														value="">
												</c:when>
												<c:otherwise>
													<input type="text" name="password" id="password"
														class="input-medium" value="123456">
												</c:otherwise>
											</c:choose>
										</label>

									</div>

									<div class="separator"></div>
								</div>



							</form>
						</li>
					</ul>
				</div>
			</div>
			<c:if test="${ ! empty user}">
				<div id="ReportWrapper" class="content clearfix">
					<div class="title-bar clearfix">
						<h1 class="l">权限管理</h1>
					</div>
				</div>
				<div class="section" id="Tabs">
					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr>
								<th width="33%">中文名称</th>
								<th width="33%">英文名称</th>
								<th width="33%">配置权限</th>
							</tr>
						</thead>

						<c:forEach items="${roleList}" var="role">
							<tr>
								<td><span style="color: blue">角色：</span>${role.cnName}</td>
								<td>${role.enName}</td>
								<td><a id="role_${role.id}" href="javascript:void(0)">折叠</a>
									<a id="NoSelect_${role.id}" href="javascript:void(0)">不选</a> <%-- <input type="checkbox" id="role_${role.id}"
									name="roles" value="${role.id}"
									<c:if test="${userRolesSet.contains(role.id)}"> checked=true </c:if>> --%>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table
										class="table table-striped table-bordered table-condensed table-hover"
										id="roleLevelTab_${role.id}">
										<c:forEach items="${role.subRoleLevels}" var="roleLevel">
											<tr>
												<td width="33%"><span style="color: blue">角色层级：</span>${roleLevel.level}
													${roleLevel.enName}</td>
												<td width="33%">${roleLevel.enName}</td>
												<td width="33%"><input type="radio"
													id="roleLevel_${roleLevel.id}" name="roleLevels_${role.id}"
													<c:if test="${userRoleLevelsSet.contains(roleLevel.id)}"> checked=true </c:if>
													value="${roleLevel.id}"></td>
											</tr>
										</c:forEach>

									</table>
								</td>



							</tr>
						</c:forEach>
						</tbody>
					</table>


				</div>
			</c:if>
			<div class="buttons" style="text-align: center;">

				<button id="submitBtn" type="button" class="btn btn-success">确定</button>
			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>