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
<script type='text/javascript' src="js/report.js"></script>

</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">${report.title }</h1>
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
							<form id="form" class="form-inline" target="framemain" action="report" method="post" enctype="application/x-www-form-urlencoded">
							<input name="reportId" value="${report.id}" type="hidden" />
							<div class="filter table-indicator" id="TableIndicator">
							<label class="groupName">过滤条件: </label>
							<div class="group clearfix">
							
							<c:forEach items="${report.queryFieldList }" var="queryField">
								
								
								<c:if test="${queryField.type eq 1}">
								<div class="span12"><span class="span1">${queryField.displayName }:</span>
		<input type="text" value="" name="param_${queryField.id }_1" class="input-medium date" />
 至<input type="text" value="" name="param_${queryField.id }_2" 
		class="input-medium date" /></div>
								
								</c:if>
							<c:if test="${queryField.type eq 0}">
								<div class="span4"><span class="span1">${queryField.displayName }:</span>
		<input type="text" value="" name="param_${queryField.id }" class="input-medium" /></div>
								</c:if>
								<c:if test="${queryField.type eq 2}">
								<div class="span4"><span class="span1">${queryField.displayName }:</span>
		<select name="param_${queryField.id }" class="input-medium" >
		
		<option value="">默认</option>
		<c:forEach items="${queryField.dimension.mapData }" var="mapData">
		<option value="${mapData.key}">${mapData.value}</option>
		</c:forEach>
		
		</select></div>
								</c:if>
								</c:forEach>
									</div>
									
								<label class="groupName">显示字段: </label>
							<div class="group clearfix">
							
							<c:forEach items="${report.groupFieldList }" var="groupField">
								
								<span class="span2" style="width: auto;"><span class="span1">${groupField.displayName }:</span>
		<input type="checkbox" value="1" name="group_${groupField.id }"  class="input-medium" /></span>
								</c:forEach>
									</div>		
									
										<label class="groupName">数据排序: </label>
							<div class="group clearfix">
							
							<c:forEach items="${report.sortFieldList }" var="sortField">
								
								<span class="span2" style="width: auto;"><span class="span1">${sortField.displayName }:</span>
		<select name="sort_${sortField.id }" class="input-mini">
		<option value="">默认</option>
		<option value="desc">降序</option>
		<option value="asc">升序</option>
		</select>
		
		</span>
								</c:forEach>
									</div>		
									
									
									
								</div>
								<div class="buttons" style="text-align: center;">
									<button id="submitBtn" type="button" class="btn btn-success">确定</button>
								</div>
							</form>
						</li>
					</ul>
				</div>
				<c:import url="common/mainframe.jsp"></c:import>


			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>