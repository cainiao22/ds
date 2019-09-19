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
<script type='text/javascript' src="js/modulemanage.js"></script>
</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">模块管理</h1>
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

							<form class="form-inline" action="./modulesave" method="post"
								id="form">
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="groupName">模块信息: </label> <label class="span9">父级模块:
											<select id="p_module" name="pid" style="width: 300px;">
												<option value='-1'>系统顶级</option>
												<c:forEach items="${allTreeModules}" var="moduleTemp">

													<option value='${ moduleTemp.id}'
														<c:if test="${ moduleTemp.id eq  module.pid }"> selected=selected </c:if>>
														<c:forEach begin="1" end="${moduleTemp.level}">------</c:forEach>
														${moduleTemp.moduleName}
													</option>
												</c:forEach>
										</select>
										</label>
									</div>


									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">模块信息:
										</label> <label class="span3">模块名称: <input type="text"
											name="moduleName" class="input-medium"
											value="${module.moduleName }">
										</label> <label class="span6">模块标识: <input type="text"
											name="moduleUrl" class="input-xlarge"
											value="${module.moduleUrl }"></label>

									</div>



									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">模块信息:
										</label> <label class="span3">顺序编码: <input type="text"
											name="sortNo" class="input-medium" value="${module.sortNo }"></label>
										<label class="span6">模块状态: <select id="status"
											name="status">
												<option value='0'
													<c:if test="${ module.status eq  0 }"> selected=selected </c:if>>正常</option>
												<option value='1'
													<c:if test="${ module.status eq  1 }"> selected=selected </c:if>>内测</option>
										</select>
										</label>
									</div>
									<div class="separator"></div>
								</div>
								<input name="id" value="${module.id }" type="hidden" /> <input
									name="roleLevelsStr" id="roleLevelsStr" type="hidden" />

							</form>
						</li>
					</ul>
				</div>
			</div>
			<c:if test="${ !empty  module}">
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
								<td><a id="role_${role.id}" href="javascript:viod(0)">折叠</a>
									<a id="NoSelect_${role.id}" href="javascript:void(0)">不选</a>
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
													${roleLevel.cnName}</td>
												<td width="33%">${roleLevel.enName}</td>
												<td width="33%"><input type="radio"
													id="roleLevel_${roleLevel.id}" name="roleLevels_${role.id}"
													<c:if test="${moduleRoles.contains(roleLevel.id)}"> checked=true </c:if>
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
				<button id="submitBtn" type="submit" class="btn btn-success">确定</button>

				<c:if test="${ !empty  module}">
					<button id="addBtn" type="button" class="btn btn-warning"
						onclick="deleteItem('./moduledelete?id=${module.id}')">删除模块</button>

				</c:if>
			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>