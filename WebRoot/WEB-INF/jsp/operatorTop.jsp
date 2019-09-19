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
					<h1 class="l">系统访问分析</h1>
				</div>
			</div>
			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>


			<div class="section" id="Tabs">
				<table
					class="table table-striped table-bordered table-condensed table-hover"
					style="width: 40%; float: left;">
					<thead>
						<tr>
							<th>排名</th>
							<th>功能</th>
							<th>访问次数</th>
						</tr>
					</thead>

					<c:forEach items="${topModuleList}" var="operatorLog"
						varStatus="varStatus">
						<tr>
							<td>${varStatus.count}</td>
							<td>${operatorLog.moduleName}</td>
							<td>${operatorLog.count}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<table
					class="table table-striped table-bordered table-condensed table-hover"
					style="width: 40%; float: left; margin-left: 10px;">
					<thead>
						<tr>
							<th>排名</th>
							<th>用户</th>
							<th>访问次数</th>
						</tr>
					</thead>

					<c:forEach items="${topUserList}" var="operatorLog"
						varStatus="varStatus">
						<tr>
							<td>${varStatus.count}</td>
							<td>${operatorLog.realname}</td>
							<td>${operatorLog.count}</td>
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