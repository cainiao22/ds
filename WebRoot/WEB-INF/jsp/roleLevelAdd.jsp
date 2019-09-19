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
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.min.js"></script>
<SCRIPT type="text/javascript">
var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
setting.check.chkboxType = { "Y" : "p", "N" : "s" };
	var zNodes =[
		
	
	];
	<c:forEach items="${moduleList}" var="module">
	zNodes.push({id:"${module.id}", pId:"${module.pid}", name:"${module.moduleName}", open:true
		<c:if test="${roleModulesSet.contains(module.id)}"> ,checked:true </c:if>    });
	</c:forEach>
		
	$(document).ready(function(){
		$.fn.zTree.init($("#tree"), setting, zNodes);
	});
		

  </SCRIPT>
<script type='text/javascript' src="js/rolelevelmanage.js?v=20131106"></script>
</head>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">角色层级管理</h1>
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

							<form class="form-inline" action="./roleLevelSave" method="post"
								id="form">
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="groupName">层级信息: </label> <label class="span4">所属角色:
											<select id="p_role" name="roleId">
												<c:forEach items="${roleAllList}" var="role">

													<option value='${ role.id}'
														<c:if test="${ role.id eq  roleLevel.roleId }"> selected=selected </c:if>>
														${role.cnName}</option>
												</c:forEach>
										</select>
										</label>

									</div>
									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">层级信息:
										</label> <label class="span4">中文名称: <input type="text"
											name="cnName" class="input-medium"
											value="${roleLevel.cnName}">
										</label> <label class="span4">英文名称: <input type="text"
											name="enName" class="input-medium"
											value="${roleLevel.enName }">
										</label>

									</div>
									<div class="group clearfix">
										<label class="groupName" style="visibility: hidden;">层级信息:
										</label> <label class="span4">层级编码: <input type="text"
											name="level" class="input-medium" id='level'
											value="${roleLevel.level }"><span style="color: red">(数字)</span>
										</label> 

									</div>
									<c:if test="${ !empty  roleLevel}">
										<div class="group clearfix">
											<label class="groupName">配置用户: </label> <label class="span12">用户查找：<input
												type="text" class="input-medium" id="query">

											</label> <label class="span4">所有用户: <select id="itemall2"  multipleOri="true"
												multiple="multiple" size="10" style="width: 220px">
													<c:forEach items="${userListAll }" var="user">
														<option value="${user.id }">${user.realName }</option>
													</c:forEach>
											</select>
											</label> <label style="margin-top: 50px"><input type="button"
												value="选择" id="selbtn2" class="btn btn-info" /> </label> <label
												style="margin-top: 90px; margin-left: -50px"><input
												type="button" value="全选" id="allbtn2" class="btn btn-info" /></label>
											<label class="span4">已选用户: <select id="itemsel2"  multipleOri="true"
												multiple="multiple" size="10" style="width: 220px">
													<c:forEach items="${userListInRole }" var="user">
														<option value="${user.id }">${user.realName }</option>
													</c:forEach>


											</select></label> <label style="margin-top: 50px;"><input
												type="button" value="删除" id="delbtn2" class="btn btn-info" /></label>
											<label style="margin-top: 90px;; margin-left: -50px"><input
												type="button" value="清空" id="emptybtn2" class="btn btn-info" /></label>
										</div>
										<div class="group clearfix"></div>
										<label class="groupName">模块权限: </label>
										<div class="zTreeDemoBackground" style="padding-left: 100px;">
											<ul id="tree" class="ztree"></ul>
										</div>

									</c:if>
									<div class="separator"></div>
								</div>
								<div class="buttons" style="text-align: center;">
									<input type="hidden" name="id" id="id" value="${roleLevel.id }" />
									<input type="hidden" name="modulesStr" id="modules" /> <input
										type="hidden" name="usersStr" id="users" />
									<button id="submitBtn" type="button" class="btn btn-success">确定</button>
								</div>
							</form>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>