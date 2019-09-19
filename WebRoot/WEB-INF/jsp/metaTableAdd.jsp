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
<script type="text/javascript">
$(function(){
	$('#enableEtl').change(function(){
		var v=$(this).val();
	if(v==1){
		$('#etlJobType').parent().parent().show();
	}else{
		$('#etlJobType').parent().parent().hide();
	}
		
	}).change();;
	$('#etlJobType').change(function(){
		var v=$(this).val();
	if(v=='SQL'){
		$('#etlJobSql').parent().show();
	}else{
		$('#etlJobSql').parent().hide();
	}
		
	}).change();
	
});
</script>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
												<h1><a href="metaTableList">数据仓库</a>
												<c:if test="${ not  empty metaTable }">
												->${metaTable.name } (${metaTable.alias}) 
												
									 
				<a href="metaTableManage?id=${metaTable.id}">查看与修改 </a>|	<a href="metaFieldList?tableId=${metaTable.id}">查看字段 </a>|	<a href="etlJobQueue?etlJobId=${metaTable.id}">调度队列 </a> 
				 
												</c:if>
												</h1>

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

							<form class="form-inline" action="./metaTableSave" method="post"
								id="form">
							<input
									type="hidden" name="id" id="id" value="${metaTable.id }" />
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
									  <label class="span6">
											<span  class="labelSpan">表名: </span>
													<input type="text" name="name" id="name"
														class="input-large" value="${metaTable.name }">
											 
										</label> <label class="span6"><span  class="labelSpan">中文名:</span> <input type="text"
											name="alias" class="input-large"
											value="${metaTable.alias }"></label> 





									</div>
										<div class="group clearfix">
										<label class="span6"><span  class="labelSpan">类型:</span>
											<select id="type" name="type">
												<c:forEach items="${metaTableTypes}" var="metaTableType">

													<option value='${ metaTableType}'
														<c:if test="${ metaTable.type eq metaTableType }"> selected=selected </c:if>>
														${ metaTableType}</option>
												</c:forEach>
										</select>
										</label>
							 <label class="span6"><span  class="labelSpan">负责人:</span>	<input type="text" name="owner" id="owner"
														class="input-large" value="${metaTable.owner }">
										</label> 

									</div>
	<div class="group clearfix">
							 <label class="span12"><span  class="labelSpan">描述: </span><textarea 
											name="description" class="input-large" rows="5" cols="16" style="width: 571px; height: 59px;"
											>${metaTable.description}</textarea>
										</label> 

									</div>

									<div class="separator"></div>
										<div class="group clearfix">
							 <label class="span12">	<span class="labelSpan">启用 ETL:</span><select id="enableEtl" name="enableEtl">
												<option value="0" <c:if test="${ metaTable.enableEtl eq 0 }"> selected=selected </c:if>>关闭</option>
												<option value="1" <c:if test="${ metaTable.enableEtl eq 1 }"> selected=selected </c:if>>开启</option>
										</select>
										</label> 
	、
									</div>
									<div class="group clearfix">
							 <label class="span12">	<span  class="labelSpan">定时调度:</span>
										<select id="etlJobScheduleHour" name="etlJobScheduleHour">
										<option value='-1'>小时</option>
											<c:forEach begin="0" end="23"  var="etlJobScheduleHour">
													<option value='${ etlJobScheduleHour}'
														<c:if test="${ metaTable.etlJobScheduleHour eq etlJobScheduleHour }"> selected=selected </c:if>>
														${ etlJobScheduleHour}点</option>
												</c:forEach>
										</select>
										<select id="etlJobScheduleMinute" name="etlJobScheduleMinute">
										<option value='-1'>分钟</option>
												<c:forEach begin="0" end="59" var="etlJobScheduleMinute">

													<option value='${ etlJobScheduleMinute}'
														<c:if test="${ metaTable.etlJobScheduleMinute eq etlJobScheduleMinute }"> selected=selected </c:if>>
														${ etlJobScheduleMinute}分</option>
												</c:forEach>
										</select><span style="color:red;">(目前支持每天定时执行)</span>
										</label> 
											 <label class="span6">	<span  class="labelSpan">ETL 类型:</span><select id="etlJobType" name="etlJobType">
												<c:forEach items="${etl_job_types}" var="etl_job_type">

													<option value='${ etl_job_type}'
														<c:if test="${ metaTable.etlJobType eq etl_job_type }"> selected=selected </c:if>>
														${ etl_job_type}</option>
												</c:forEach>
										</select>
										</label> 
											 <label class="span12">	<span  class="labelSpan">优先级:</span><select id="priority" name="priority" style="width: 100px">
												<c:forEach  var="priority"  begin="1" end="10">

													<option value='${ priority}'
														<c:if test="${ metaTable.priority eq priority }"> selected=selected </c:if>>
														${ priority}</option>
												</c:forEach>
										</select><span style="color:red;">(数字越大，优先级越高，默认推荐5)</span>
										</label> 
	 <label class="span12">	<span  class="labelSpan">SQL内容:</span>
	 
<textarea id="etlJobSql"
											name="etlJobSql" class="input-large" rows="5" cols="16" style="width: 571px; height: 180px;"
											> ${metaTable.etlJobSql }</textarea>
										</label> 
									</div>
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