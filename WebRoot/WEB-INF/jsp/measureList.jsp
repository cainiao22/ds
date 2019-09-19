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
					<h1 class="l">数据指标库管理</h1>
				</div>
			</div>
			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>


			<form action="./measureList" method="get">
				<div>有效状态：
					<select id="status" name="status">
						<option value=''>全部</option>
						<c:forEach items="${measureStatus}" var="status">

							<option value='${ status}'
								<c:if test="${ measure.status eq status }"> selected=selected </c:if>>
								<c:if test="${ status == '1' }">是 </c:if><c:if test="${ status == '0' }">否 </c:if></option>
						</c:forEach>
					</select> <input type="text" class="input-medium" name="keyword" id="query"
						value="${measureParam.keyword }">
					<button id="queryBtn" type="submit" class="btn btn-info">搜索</button>
					<button id="addBtn" type="button" class="btn btn-success"
						onclick="javascript:gourl('./measureAdd');">添加</button>
				</div>
			</form>
			<div class="section" id="Tabs">
				<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th style="width: 150px;">指标名称</th>
							<th style="width: 50px;">指标编码</th>
							<th style="width: 150px;">指标说明</th>
							<th style="width: 50px;">是否有效</th>
							<th style="width: 130px;">创建时间</th>
							<th style="width: 130px;">更新时间</th>
							<th style="width: 140px;">管理</th>
						</tr>
					</thead>

					<c:forEach items="${measureList}" var="measure">
						<tr>
							<td>${measure.name}</td>
							<td>${measure.code}</td>
							<td>${measure.description}</td>
							<td><c:if test="${ measure.status == '1' }">是 </c:if><c:if test="${ measure.status == '0' }">否 </c:if></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${measure.createTime}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${measure.updateTime}" /></td>
							<td><a href="./measureManage?id=${measure.id}">修改</a> | <a
								href="javascript:void(0)"
								onclick="deleteItem('./measureDelete?id=${measure.id}')">删除</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<c:import url="common/page.jsp">
					<c:param name="currentPage" value="${measureParam.page}" />
					<c:param name="totalPage" value="${totalPage }" />
					<c:param name="totalCount" value="${totalCount }" />
					<c:param name="url"
						value="./measureList?keyword=${measureParam.keyword}&status=${measureParam.status}" />
				</c:import>

			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>