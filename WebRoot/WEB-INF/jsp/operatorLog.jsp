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
					<h1 class="l">操作日志</h1>
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
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th>用户名</th>
							<th>姓名</th>
							<th>功能</th>
							<th>路径</th>
							<th>时间</th>
						</tr>
					</thead>

					<c:forEach items="${operatorLogList}" var="operatorLog">
						<tr>
							<td>${operatorLog.username}</td>
							<td>${operatorLog.realname}</td>
							<td>${operatorLog.moduleName}</td>
							<td>${operatorLog.moduleurl}</td>
							<td><fmt:formatDate value="${operatorLog.operatorTime}"
									type="both"></fmt:formatDate></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<c:import url="common/page.jsp">
					<c:param name="currentPage" value="${operatorLogParam.page}" />
					<c:param name="totalPage" value="${totalPage }" />
					<c:param name="totalCount" value="${totalCount }" />
					<c:param name="url" value="./operatorLog?" />
				</c:import>

			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>