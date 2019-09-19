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
                                    <span>模块管理</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">模块信息
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" action="./modulesave" method="post"
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
                                                           <label class="col-md-3 control-label">父级模块： </label>
                                                               <div class="col-md-4">
                                                    <select id="p_module" name="pid" style="width: 300px;" class="form-control"  >
												<option value='-1'>系统顶级</option>
												<c:forEach items="${allTreeModules}" var="moduleTemp">

													<option value='${ moduleTemp.id}'
														<c:if test="${ moduleTemp.id eq  module.pid }"> selected=selected </c:if>>
														<c:forEach begin="1" end="${moduleTemp.level}">------</c:forEach>
														${moduleTemp.moduleName}
													</option>
												</c:forEach>
										</select>
											</div>
                                                            </div>
                                                                 <div class="form-group">
                                                           <label class="col-md-3 control-label">模块名称: </label>
                                                               <div class="col-md-4">
                                                                <input type="text"
											name="moduleName" class="form-control"
											value="${module.moduleName }"/>
											</div>
                                                            </div>
                                                                    
                                                                        <div class="form-group">
                                                           <label class="col-md-3 control-label">模块标识: </label>
                                                               <div class="col-md-4">
                                                         <input type="text"
											name="moduleUrl" class="form-control"
											value="${module.moduleUrl }"/>
											</div>
                                                            </div>
                                                                        <div class="form-group">
                                                           <label class="col-md-3 control-label">顺序编码: </label>
                                                               <div class="col-md-4">
                                                         <input type="text"
											name="sortNo" class="form-control"
											value="${module.sortNo }"/>
											</div>
                                                            </div>
                                                     
                                                        </div>
                                              
                                                </div>
                                                   <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="font-red-sunglo"></i>
                                                        <span class="caption-subject font-red-sunglo bold uppercase">权限关联</span>
                                                    </div>
                                                </div>
                                                 <div class="portlet-body form">
                                         	<table
						class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr>
								<th width="33%">中文名称</th>
								<th width="33%">英文名称</th>
								<th width="33%">配置权限</th>
							</tr>
						</thead>

						<c:forEach items="${roleList}" var="role">
							<tr>
								<td><span style="color: blue">角色：</span>${role.cnName}</td>
								<td>${role.enName}</td>
								<td><a id="role_${role.id}" href="javascript:viod(0)">折叠</a>
									<a id="NoSelect_${role.id}" href="javascript:void(0)">不选</a>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<table
										class="table table-striped table-bordered table-condensed table-hover"
										id="roleLevelTab_${role.id}">
										<c:forEach items="${role.subRoleLevels}" var="roleLevel">
											<tr>
												<td width="33%"><span style="color: blue">角色层级：</span>${roleLevel.level}
													${roleLevel.cnName}</td>
												<td width="33%">${roleLevel.enName}</td>
												<td width="33%"><input type="radio"
													id="roleLevel_${roleLevel.id}" name="roleLevels_${role.id}"
													<c:if test="${moduleRoles.contains(roleLevel.id)}"> checked=true </c:if>
													value="${roleLevel.id}"></td>
											</tr>
										</c:forEach>

									</table>
								</td>



							</tr>
						</c:forEach>
						</tbody>
					</table>

					
					   <div class="form-actions">
                                                            <div class="row">
                                                                <div class="col-md-offset-3 col-md-4">
                                                                <input name="id" value="${module.id }" type="hidden" /> <input
									name="roleLevelsStr" id="roleLevelsStr" type="hidden" />
                                                                    <button type="button" class="btn green" id="submitBtn">确定</button>
                                                                    
                                                               <a href="moduledelete?id=${module.id}">    <button id="delBtn" type="button" class="btn btn-warning">删除模块</button>
</a>                                                                 </div>
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
       <script type='text/javascript' src="js/roleTableManage.js"></script>
<script type='text/javascript' src="js/modulemanage.js"></script>
       
    </body>
</html>