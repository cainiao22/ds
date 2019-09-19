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
					<h1 class="l">报表管理</h1>
				</div>
			</div>
			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>


			<form action="reportList" method="post">
				<div>
					<input type="text" class="input-medium" name="realname" id="query">
					<button id="queryBtn" type="submit" class="btn btn-info">搜索报表</button>
					<button id="addBtn" type="button" class="btn btn-success"
						onclick="javascript:gourl('./reportConfigAdd');">添加报表</button>
				</div>
			</form>
			<div class="section" id="Tabs">
				<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th>Id</th>
							<th>报表</th>
							<th>状态</th>
							<th>管理</th>
						</tr>
					</thead>

					<c:forEach items="${reportConfigList}" var="reportConfig">
						<tr>
							<td>${reportConfig.id}</td>
							<td>${reportConfig.name}</td>
							<c:choose>
								<c:when test="${reportConfig.status eq 0 }">
									<td><span class="label label-success">正常</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-warning">禁用</span></td>
								</c:otherwise>
							</c:choose>
							<td><a href="./reportConfigManage?id=${reportConfig.id}">修改</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<c:import url="common/page.jsp">
					<c:param name="currentPage" value="${reportConfigParam.page}" />
					<c:param name="totalPage" value="${totalPage }" />
					<c:param name="totalCount" value="${totalCount }" />
					<c:param name="url"
						value="./reportConfigList?name=${reportConfigParam.name}&" />
				</c:import>

			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>