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
<script type="text/javascript">
$(function(){
	
	$('#syncFieldMeta').click(function(){
		$(this).html('字段同步中...');
		$(this).attr("disabled",true); 
		
		$.post('./syncFieldMeta',{id:"${metaFieldParam.tableId}",
		name:"${metaTable.name}"	,
		type:"${metaTable.type}"	
		},   function(data){
		
			gourl('./metaFieldList?tableId=${metaFieldParam.tableId}');
		});
	});
	
	
});
</script>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">
					<a href="metaTableList">数据仓库</a>->${metaTable.name } (${metaTable.alias})
									<a href="metaTableManage?id=${metaTable.id}">查看与修改 </a>|	<a href="metaFieldList?tableId=${metaTable.id}">查看字段 </a>|	<a href="etlJobQueue?etlJobId=${metaTable.id}">调度队列 </a> 
					
					</h1>
				</div>
			</div>
			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>


			<form action="./metaFieldList" method="get" >
				<div>
					<button id="addBtn" type="button" class="btn btn-success"
						onclick="javascript:gourl('./metaFieldAdd?tableId=${metaFieldParam.tableId}');">添加</button>
						<button id="syncFieldMeta" type="button" class="btn btn-success">同步字段</button>
				</div>
			</form>
			<div class="section" id="Tabs">
				<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th style="width: 150px;">名称</th>
						<th style="width:140px;">中文名</th>
						<th style="width: 50px;">类型</th>
							 <th>描述</th>
							 <th>字段来源</th>
							<th style="width: 60px;">是否日期</th>
							<th style="width: 130px;">创建时间</th>
							<th style="width: 130px;">更新时间</th>
							<th style="width: 100px;">管理</th>
						</tr>
					</thead>

					<c:forEach items="${metaFieldList}" var="metaField">
						<tr>
							<td>${metaField.name}</td>
							<td>${metaField.alias}</td>
					<td>${metaField.type}</td>
								<td>${metaField.description}</td>
								<td>		<c:forEach items="${metaField.sourceTablesObj}" var="sto">
							${sto.type}.${sto.name }</br>
								</c:forEach></td>
							<td><c:choose>
								<c:when test="${metaField.isDate == 1}">
									是
								</c:when>
								<c:otherwise>
									否
								</c:otherwise>
							</c:choose></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            value="${metaField.createTime}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            value="${metaField.updateTime}" /></td>
							<td>  <a href="./metaFieldManage?id=${metaField.id}">修改</a> |
							 <a
								href="javascript:void(0)"
								onclick="deleteItem('./metaFieldDelete?id=${metaField.id}&tableId=${metaField.tableId}')">删除</a></td>
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