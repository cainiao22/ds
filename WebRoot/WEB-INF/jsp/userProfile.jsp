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
<link rel='stylesheet' type='text/css'
	href='css/zTreeStyle/zTreeStyle.css' />
	<link rel='stylesheet' type='text/css'
	href='css/jquery.dataTables.min.css' />
<style >

.left{
	position: relative;
	float:left;
	width: auto;
	height: 80%;
	border-right: 1px solid #A0C5E8;
}
ul.ztree{
	overflow-y: hidden;
	overflow-x: auto;
	margin:5px;
}

.right{
	position: relative;
	float: left;
	height: 80%;
}

.closeQuery {
	position: relative;
	float: left;
	height: 30px;
	margin-left: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
	padding-left: 15px;
	padding-right: 0px;
	border:0px;
	line-height:30px;
	background: url('./img/close.gif') no-repeat center left;
	cursor: pointer;
	text-overflow:ellipsis;
	overflow:hidden;
}

.closeQuery_over {
	background-color: #E1E1E1;
}

.bottom{
padding:10px;
	height:auto;
	width: 95%;

	bottom: 0px;
	border-top: 1px solid #A0C5E8;

}
.conditionLabel{
		font-size: 16px;
		margin: 5px;

}
.dataTables_wrapper{
width:auto;
min-width:250px;
margin:20px;
height:400px;
float: left;
clear: none;
border: 1px solid;
}
</style>
	<script type="text/javascript" src="js/condition.js"></script>
		<script type="text/javascript" src="js/ui.combox.js"></script>
		<script type="text/javascript" src="js/search.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<SCRIPT type="text/javascript">
	
	
		$(document).ready(function(){
			var zNodes =[
				
				
				];

			$.post('getAllTags',{},function(data){
				for(var i=0;i<data.length;i++)
				{
					var current=data[i];
					zNodes.push({id: current.id, name:current.name,tag:current.tag,dataType:current.dataType,pId:current.pid});
					
				
				}
				var setting = {
						check: {
							enable: true
						},
						data: {
							simpleData: {
								enable: true
							}
						},
						callback: {
							onDblClick: OnDblClick
						}
					};
				zTreeObj =	$.fn.zTree.init($("#treeItem"), setting, zNodes);
			
			
			//ztree双击
			function OnDblClick(event, treeId, treeNode) {
				//只有双击的节点才拼装sql
				if(!treeNode.isParent){
					addCondition(treeNode);
				}
			};
			});
					
			
		});

  </SCRIPT>
</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">用户画像</h1>
				</div>
			</div>
			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>

		<div class="left">
			<ul id="treeItem" class="ztree"></ul>
		</div>
		<div class="right">
			<table id="queryTable"></table>
		</div>
		<div class="bottom"  style="text-align: center;clear: both;">
			<input type="button" value="查询"  id="query" />
			<input type="hidden"  id="condition"/>
			<div id="totalHit" style=""color:red;"></div>
			<div id="tables"></div>
		</div>
	
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>