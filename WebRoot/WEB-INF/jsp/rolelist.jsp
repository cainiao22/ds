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
<script type='text/javascript' src="js/roleTableManage.js"></script>
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


			<div>
				<button id="addBtn" type="button" class="btn btn-success"
					onclick="javascript:gourl('./roleadd');">添加角色</button>
				<button id="addBtn2" type="button" class="btn btn-success"
					onclick="javascript:gourl('./roleLevelAdd');">添加角色层级</button>
			</div>
			<div class="section" id="Tabs">
				<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th width="33%">中文名称</th>
							<th width="33%">英文名称</th>
							<th width="33%">管理</th>
						</tr>
					</thead>

					<c:forEach items="${roleList}" var="role">
						<tr>
							<td>${role.cnName}</td>
							<td>${role.enName}</td>
							<td><a id="role_${role.id}" href="javascript:void(0)">展开</a>
								| <a href="./rolemanage?id=${role.id}">修改</a> | <a
								href="javascript:void(0)"
								onclick="deleteItem('./roledelete?id=${role.id}')">删除</a></td>
						</tr>
						<tr>
							<td colspan="3">
								<table
									class="table table-striped table-bordered table-condensed table-hover"
									id="roleLevelTab_${role.id}" style="display: none;">
									<c:forEach items="${role.subRoleLevels}" var="roleLevel">
										<tr>
											<td width="33%">层级：${roleLevel.level}  :${roleLevel.cnName}</td>
											<td width="33%">${roleLevel.enName}</td>
											<td width="33%"><a
												href="./roleLevelManage?id=${roleLevel.id}">修改</a> | <a
												href="javascript:void(0)"
												onclick="deleteItem('./roleLevelDelete?id=${roleLevel.id}')">删除</a></td>
										</tr>
									</c:forEach>

								</table>
							</td>



						</tr>
					</c:forEach>
					</tbody>
				</table>


			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>