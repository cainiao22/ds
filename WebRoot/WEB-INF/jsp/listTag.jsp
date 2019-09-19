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

<script type="text/javascript" src="js/jquery.ztree.core-3.5.min.js"></script>
<SCRIPT type="text/javascript">
	
	var zNodes =[
		
	
	];

	<c:forEach items="${tagList}" var="tag">
	zNodes.push({id:"${tag.id}", pId:"${tag.pid}", name:"(${tag.sortNo})${tag.name}", open:false,url:"./manageTag?id=${tag.id}",target:"_self"});
	</c:forEach>
		
		

  </SCRIPT>
<script type="text/javascript" src="js/moduleTree.js"></script>
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


			<div>
				<button id="addBtn" type="button" class="btn btn-success"
					onclick="javascript:gourl('./addTag');">添加标签</button>
			</div>
			<div class="zTreeDemoBackground" style="padding-left: 50px;">
				<ul id="treeItem" class="ztree"></ul>
			</div>

		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>