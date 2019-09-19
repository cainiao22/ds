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
					<h1 class="l"><a href="metaTableList">数据仓库</a>-><a href="metaFieldList?tableId=${metaTable.id}">${metaTable.name } (${metaTable.alias})</a></h1>
					
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

							<form class="form-inline" action="./metaFieldSave" method="post"
								id="form">
							<input
									type="hidden" name="id" id="id" value="${metaField.id }" />
							<input
									type="hidden" name="tableId" id="tableId" value="${metaTable.id }" />
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
									  <label class="span12">
											<span class="labelSpan">表名:</span> ${metaTable.name }
										</label>
										  <label class="span6">
										<span class="labelSpan">名称:</span> <input type="text" name="name" id="name"
														class="input-large" value="${metaField.name }">
											 
										</label> <label class="span6"> <span class="labelSpan">中文名: </span><input type="text"
											name="alias" class="input-large"
											value="${metaField.alias }"></label> 


<label class="span6"><span class="labelSpan">类型:</span>
										 <input type="text"
											name="type" class="input-large"
											value="${metaField.type }">
										</select>
										</label>
										<label class="span6"><span class="labelSpan">是否日期:</span>
											<select  name="isDate"  class="input-large">
												<option <c:if test="${metaField.isDate == 0}"> selected="selected" </c:if> value="0">否</option>
												<option <c:if test="${metaField.isDate == 1}"> selected="selected" </c:if> value="1">是</option>
											</select>
										</label>
									</div>
	<div class="group clearfix">
							 <label class="span12"><span class="labelSpan">描述:</span> <textarea 
											name="description" class="input-large" rows="5" cols="16" style="margin: 0px; width: 571px; height: 59px;"
											>${metaField.description}</textarea>
										</label> 
<label class="span12"><span class="labelSpan">来源:</span> <select id="sourceTables"  name="sourceTables" style="width:auto;"
	multiple="multiple">



		<c:forEach items="${allMetaTables}" var="metaTable" varStatus="vaStatus">

				<option value="${metaTable.id }" <c:if test="${fn:contains(metaField.sourceTables, metaTable.id)}">selected="selected"</c:if> >${metaTable.name } (${metaTable.alias })</option>
		</c:forEach>
</select></label>
									</div>
									<div class="separator"></div>
								</div>



							</form>
						</li>
					</ul>
				</div>
			</div>
		
			<div class="buttons" style="text-align: center;">

				<button id="submitBtn" type="button" class="btn btn-success">确定</button>
			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>