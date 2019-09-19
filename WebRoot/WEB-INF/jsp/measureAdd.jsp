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
					<h1 class="l">数据指标库管理</h1>
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

							<form class="form-inline" action="./measureSave" method="post"
								id="form">
							<input
									type="hidden" name="id" id="id" value="${measure.id }" />
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
									  <label class="span4">
											指标名称: 
													<input type="text" name="name" id="name"
														class="input-medium" value="${measure.name }">
											 
										</label> <label class="span4"> 指标编码: <input type="text"
											name="code" class="input-medium"
											value="${measure.code }"></label> 


										<label class="span4">是否有效:
											<select id="type" name="status">
												<c:forEach items="${measureStatus}" var="status">
													<option value='${ status}'
														<c:if test="${ measure.status eq status }"> selected=selected </c:if>>
														<c:if test="${ status == '1' }">是 </c:if><c:if test="${ status == '0' }">否 </c:if></option>
												</c:forEach>
										</select>
										</label>


									</div>
	<div class="group clearfix">
							 <label class="span12">指标说明: <textarea 
											name="description" class="input-medium" rows="5" cols="16" style="margin: 0px; width: 571px; height: 59px;"
											>${measure.description}</textarea>
										</label> 

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