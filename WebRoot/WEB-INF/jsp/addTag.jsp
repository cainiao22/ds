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
					<h1 class="l">标签管理</h1>
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

							<form class="form-inline" action="./saveTag" method="post"
								id="form">
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="groupName">标签信息: </label> <label class="span9">父级标签:
											<select id="p_module" name="pid" style="width: 300px;">
												<option value='-1'>系统顶级</option>
												<c:forEach items="${allTreeTags}" var="tagTemp">

													<option value='${ tagTemp.id}'
														<c:if test="${ tagTemp.id eq  tag.pid }"> selected=selected </c:if>>
														<c:forEach begin="1" end="${tagTemp.level}">------</c:forEach>
														${tagTemp.name}
													</option>
												</c:forEach>
										</select>
										</label>
									</div>


									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">标签信息:
										</label> <label class="span3">标签名称: <input type="text"
											name="name" class="input-medium"
											value="${tag.name }">
										</label> <label class="span6">标签标识: <input type="text"
											name="tag" class="input-xlarge"
											value="${tag.tag }"></label>

									</div>



									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">标签信息:
										</label> <label class="span3">顺序编码: <input type="text"
											name="sortNo" class="input-medium" value="${tag.sortNo }"></label>
										<label class="span6">数据类型: <select id="dataType"
											name="dataType">
											<option value='0'
													<c:if test="${ tag.dataType eq 0 }"> selected=selected </c:if>>虚拟</option>
												<option value='1'
													<c:if test="${ tag.dataType eq  1 }"> selected=selected </c:if>>数值</option>
												<option value='2'
													<c:if test="${ tag.dataType eq 2 }"> selected=selected </c:if>>列表</option>
												<option value='3'
													<c:if test="${ tag.dataType eq 3 }"> selected=selected </c:if>>日期</option>
												<option value='4'
													<c:if test="${ tag.dataType eq 4 }"> selected=selected </c:if>>字典</option>
												
										</select>
										</label>
									</div>
									
									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">标签信息:
										</label> <label class="span6">是否简单模式标签: <select id="simpleModle"
											name="simpleModle">
											<option value='0'
													<c:if test="${ tag.simpleModle eq 0 }"> selected=selected </c:if>>否</option>
												<option value='1'
													<c:if test="${ tag.simpleModle eq  1 }"> selected=selected </c:if>>是</option>
										</select>
										</label>
										<label class="span6">是否常用标签: <select id="commonConditon"
											name="commonConditon">
											<option value='0'
													<c:if test="${ tag.commonConditon eq 0 }"> selected=selected </c:if>>否</option>
												<option value='1'
													<c:if test="${ tag.commonConditon eq  1 }"> selected=selected </c:if>>是</option>
										</select>
										</label>
									</div>
									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">标签信息:
										</label> <label class="span3">标签说明: <textarea 
											name="description" class="input-medium" rows="5" cols="16" style="margin: 0px; width: 571px; height: 59px;"
											>${tag.description}</textarea>
										</label> 

									</div>
									
									<div class="separator"></div>
								</div>
								<input name="id" value="${tag.id }" type="hidden" /> 
							</form>
						</li>
					</ul>
				</div>
			</div>

			<div class="buttons" style="text-align: center;">
				<button id="submitBtn" type="submit" class="btn btn-success">确定</button>

				<c:if test="${ !empty  tag}">
					<button id="addBtn" type="button" class="btn btn-warning"
						onclick="deleteItem('./deleteTag?id=${tag.id}')">删除标签</button>

				</c:if>
			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>