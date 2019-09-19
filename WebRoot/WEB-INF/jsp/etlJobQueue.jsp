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
<script type="text/javascript">

$(function(){
	
	$('a[name=showEtljobExecuteLog]').click(function(){
		var jobId=$(this).attr('id').replace('showEtljobExecuteLog_',"");
		$('#showEtljobExecuteLogDiv').html("加载中...");
		var s="";
		$.post('./listExecuteLog',{id:jobId},function(data){
			$('#showEtljobExecuteLogDiv').empty();
			$.each(data, function(index, value) {
				s+="<p>"+value.createTimeText+"            "+value.etlLog+"</p>";
				});
			$('#showEtljobExecuteLogDiv').append(s);
		});
		
	});
	$('a[name=expandSql]').click(function(){
		if($(this).prev().is(":hidden")){
			$(this).prev().prev().hide();
			$(this).prev().show();
			$(this).text("收起");
		}else{
			$(this).prev().prev().show();
			$(this).prev().hide();
			$(this).text("展开");
		}
	
	});
	
	
});
</script>
</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">
					<a href="metaTableList">数据仓库</a>->${metaTable.name } (${metaTable.alias}) 
					</h1>
				
					<h1 class="l">
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

			<div class="section" id="Tabs">
				<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
										<th style="width: 150px;">创建时间</th>
									 <th style="width: 150px;">更新时间</th>
							<th style="width: 100px;">表信息</th>
						<th style="width: 100px;">作业类型</th>
							 <th>SQL脚本</th>
							<th style="width: 100px;">当前状态</th>
							<th style="width: 50px;">日志</th>
			
						</tr>
					</thead>
		<tbody>
					<c:forEach items="${etlJobQueueList}" var="etlJobQueue">
						<tr>
						
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            value="${etlJobQueue.scheduleTime}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            value="${etlJobQueue.updateTime}" /></td>
						
							<td>${etlJobQueue.type}.${etlJobQueue.tableName}</td>
							<td>${etlJobQueue.jobType}</td>
					<td><c:choose>  
    <c:when test="${fn:length(etlJobQueue.sql) > 200}"><span>
        <c:out value="${fn:substring(etlJobQueue.sql, 0, 200)} ....." /></span><span style="display: none;">${etlJobQueue.sql}</span><a href="javascript:void" name="expandSql">展开</a>  
    </c:when>  
   <c:otherwise>  
      <c:out value="${etlJobQueue.sql}" />  
    </c:otherwise>  
</c:choose> </td>
						
					<td><span class="label label_${etlJobQueue.statusText}">${etlJobQueue.statusText}</span></td>
						<td><a  hreaf="javascript:void(0)" id="showEtljobExecuteLog_${etlJobQueue.id}" name="showEtljobExecuteLog"  data-toggle="modal" data-target="#myModal">日志</a> </td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
	<c:import url="common/page.jsp">
					<c:param name="currentPage" value="${etlJobQueueParam.page}" />
					<c:param name="totalPage" value="${totalPage }" />
					<c:param name="totalCount" value="${totalCount }" />
					<c:param name="url"
						value="?etlJobId=${metaTable.id}&" />
				</c:import>

			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
	<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					调度日志
				</h4>
			</div>
			<div class="modal-body" ID="showEtljobExecuteLogDiv">
				加载中...
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</body>
</html>