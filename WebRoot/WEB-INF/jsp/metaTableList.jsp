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
								<h1 class="l"><a href="metaTableList">数据仓库</a></h1>

				</div>
			</div>
			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>


			<form action="./metaTableList" method="get" >
				<div>类型：
				<select id="type" name="type">
					<option value=''>全部
	</option>
												<c:forEach items="${metaTableTypes}" var="metaTableType">

													<option value='${ metaTableType}'
														<c:if test="${ metaTable.type eq metaTableType }"> selected=selected </c:if>>
														${ metaTableType}</option>
												</c:forEach>
										</select>
					关键字:<input type="text" class="input-medium" name="keyword" id="query" value="${metaTableParam.keyword }">
					负责人:<input type="text" class="input-medium" name="owner" id="query" value="${metaTableParam.owner }">
					<button id="queryBtn" type="submit" class="btn btn-info">搜索</button>
					<button id="addBtn" type="button" class="btn btn-success"
						onclick="javascript:gourl('./metaTableAdd');">添加</button>
				</div>
			</form>
			<div class="section" id="Tabs">
				<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th style="width: 150px;">表名</th>
						<th style="width:140px;">中文名</th>
						<th style="width: 50px;">类型</th>
						<th style="width:50px;">负责人</th>
							<th style="width: 40px;">调度</th>
							<th style="width: 100px;">创建时间</th>
							<th style="width: 100px;">更新时间</th>
							<th style="width: 150px;">管理</th>
						</tr>
					</thead>

					<c:forEach items="${metaTableList}" var="metaTable">
						<tr>
							<td><a href="./metaTableManage?id=${metaTable.id}">${metaTable.name}</a></td>
							<td>${metaTable.alias}</td>
					<td>${metaTable.type}</td>
								<td>${metaTable.owner}</td>
									<td>
									<c:choose><c:when test="${metaTable.enableEtl eq 1}"><fmt:formatNumber value="${metaTable.etlJobScheduleHour}" minIntegerDigits="2"/>:<fmt:formatNumber value="${metaTable.etlJobScheduleMinute}" minIntegerDigits="2"/></c:when>
									<c:otherwise>关闭</c:otherwise>
									</c:choose>
									</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            value="${metaTable.createTime}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            value="${metaTable.updateTime}" /></td>
							<td> <a href="./metaFieldList?tableId=${metaTable.id}">字段</a> | <a href="./metaTableManage?id=${metaTable.id}">修改</a> | <a href="./etlJobQueue?etlJobId=${metaTable.id}">调度队列</a> | <a href="./metaTableMonitorList?id=${metaTable.id}">规则</a> |
							 <a
								href="javascript:void(0)"
								onclick="deleteItem('./metaTableDelete?id=${metaTable.id}')">删除</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<c:import url="common/page.jsp">
					<c:param name="currentPage" value="${metaTableParam.page}" />
					<c:param name="totalPage" value="${totalPage }" />
					<c:param name="totalCount" value="${totalCount }" />
					<c:param name="url"
						value="./metaTableList?keyword=${metaTableParam.keyword}&type=${ metaTableParam.type}&owner=${ metaTableParam.owner}" />
				</c:import>

			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>