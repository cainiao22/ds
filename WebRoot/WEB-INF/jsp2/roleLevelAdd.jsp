<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!-- BEGIN HEAD -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>千丁大数据平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />

<c:import url="common/global_style.jsp"></c:import>
</head>
<!-- END HEAD -->
 <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <div class="page-wrapper">
 <c:import url="common/header.jsp"></c:import>        

            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <!-- BEGIN SIDEBAR -->
                <div class="page-sidebar-wrapper">
                    <!-- BEGIN SIDEBAR -->
                    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                    <div class="page-sidebar navbar-collapse collapse">
                        <!-- BEGIN SIDEBAR MENU -->
                        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                        
                           <c:import url="common/sidebar.jsp"></c:import>
                               
                           
                        </ul>
                        <!-- END SIDEBAR MENU -->
                        <!-- END SIDEBAR MENU -->
                    </div>
                    <!-- END SIDEBAR -->
                </div>
                <!-- END SIDEBAR -->
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">
                        <!-- BEGIN PAGE HEADER-->
                    
                        <!-- BEGIN PAGE BAR -->
                        <div class="page-bar">
                            <ul class="page-breadcrumb">
                                <li>
                                    <a href="index">首页</a>
                                    <i class="fa fa-circle"></i>
                                </li>
                                <li>
                                    <span>系统管理</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>角色管理</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">角色层级信息
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" action="./roleLevelSave" method="post"
								id="form">
                        <div class="portlet light bordered">
                                                        <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="font-red-sunglo"></i>
                                                        <span class="caption-subject font-red-sunglo bold uppercase">基本信息</span>
                                                    </div>
                                                </div>
                                              
                                                <div class="portlet-body form">
                                            
                                                        <div class="form-body">
                                                        
                                                        
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">中文名称: </label>
                                                               <div class="col-md-4">
                                               
													<input type="text" name="cnName" id="cnName"
														class="form-control" value="${roleLevel.cnName }">
											</div>
                                                            </div>
                                                                 <div class="form-group">
                                                           <label class="col-md-3 control-label">英文名称: </label>
                                                               <div class="col-md-4">
                                                                <input type="text" id="enName"
											name="enName" class="form-control"
											value="${roleLevel.enName}"/>
											</div>
                                                            </div>
                                                                    
                                                                 <div class="form-group">
                                                           <label class="col-md-3 control-label">所属角色: </label>
                                                               <div class="col-md-4">
                                                          <select id="p_role" name="roleId" class="form-control" data-placeholder="请选择所属角色" >
												<c:forEach items="${roleAllList}" var="role">

													<option value='${ role.id}'
														<c:if test="${ role.id eq  roleLevel.roleId }"> selected=selected </c:if>>
														${role.cnName}</option>
												</c:forEach>
										</select>
											</div>
                                                            </div>
                                                                   <div class="form-group">
                                                           <label class="col-md-3 control-label">层级序号: </label>
                                                               <div class="col-md-4">
                                                          <select id="level" name="level"  class="form-control" data-placeholder="请选择层级序号" >
												<c:forEach  var="level" begin="1" end="5">

													<option value='${level}'
														<c:if test="${ roleLevel.level eq  level}"> selected=selected </c:if>>
														${level}</option>
												</c:forEach>
										</select>
											</div>
                                                            </div>
                                                                    
                                                     
                                                        </div>
                                              
                                                </div>
                                                	<c:if test="${ !empty  roleLevel}">
                                                
                                                       <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="font-red-sunglo"></i>
                                                        <span class="caption-subject font-red-sunglo bold uppercase">关联用户</span>
                                                    </div>
                                                </div>
                                                         
										    <div class="portlet-body form">
                                            
                                                        <div class="form-body">
                                                                  <div class="form-group">
                                                       <div class="col-md-3">
                              <select id="itemall2"  multipleOri="true" class="form-control"
												multiple="multiple" size="10" style="width: 220px">
													<c:forEach items="${userListAll }" var="user">
														<option value="${user.id }">${user.realName }</option>
													</c:forEach>
											</select>
											</div>
											    <div class="col-md-3">
                                                              <p><input type="button"
												value="选择" id="selbtn2" class="btn btn-info" /></p>
												<p>  <input
												type="button" value="全选" id="allbtn2" class="btn btn-info" />
												</p>
                                                                </div>
											   <div class="col-md-3">
											<select id="itemsel2"  multipleOri="true" class="form-control"
												multiple="multiple" size="10" style="width: 220px">
													<c:forEach items="${userListInRole }" var="user">
														<option value="${user.id }">${user.realName }</option>
													</c:forEach>


											</select>
</div>
	    <div class="col-md-3">
                                                              <p>
 <input
												type="button" value="删除" id="delbtn2" class="btn btn-info" /></p>
								<p><input
												type="button" value="清空" id="emptybtn2" class="btn btn-info" /></label>
										</div>
										</div>
										</div>
										</div>
										
										
										
										
										
						        
						        <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="font-red-sunglo"></i>
                                                        <span class="caption-subject font-red-sunglo bold uppercase">关联权限</span>
                                                    </div>
                                                </div>
                                                             <div class="portlet-body form">
                                            
                                                        <div class="form-body">				
										
										<div class="zTreeDemoBackground" style="padding-left: 100px;">
											<ul id="tree" class="ztree"></ul>
										</div>
										</div>
										</div>
										</c:if>
										
										
										
										
                                                
                                                
                                                 <div class="portlet-body form">
                                        
					
					   <div class="form-actions">
                                                            <div class="row">
                                                                <div class="col-md-offset-3 col-md-4">
                                                             <input type="hidden" name="id" id="id" value="${roleLevel.id }" />
									<input type="hidden" name="modulesStr" id="modules" /> <input
										type="hidden" name="usersStr" id="users" />
                                                                    <button type="button" class="btn green" id="submitBtn">确定</button>
                                                                   <a href="rolelist"> <button type="button" class="btn default">取消</button></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                
                                                </div>
                                                
                                            </div>      </form>
                                                    <!-- END FORM-->
                            </div>
                           
                        </div>
                   
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
                <!-- END CONTENT -->
              
            </div>
            <!-- END CONTAINER -->
      <c:import url="common/footer.jsp"></c:import>
        </div>
       <c:import url="common/global_js.jsp"></c:import>
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
<script type='text/javascript' src="js/rolelevelmanage.js"></script>
       
    </body>
</html>