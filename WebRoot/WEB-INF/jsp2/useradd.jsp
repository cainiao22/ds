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
                                    <span>用户管理</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">用户信息
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" action="./usersave" method="post"
								id="form">
                        <div class="portlet light bordered">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="font-red-sunglo"></i>
                                                        <span class="caption-subject font-red-sunglo bold uppercase">基本信息</span>
                                                    </div>
                                                </div>
                                                 
                                              
                                                <div class="portlet-body form">
                                                 <input type="hidden" name="rolesStr" id="rolesStr" /> <input
									type="hidden" name="id" id="id" value="${user.id }" />
                                                        <div class="form-body">
                                                        
                                                        
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">用户名: </label>
                                                               <div class="col-md-4">
                                                        	<c:choose>
												<c:when test="${ !empty  user}">
												  <p class="form-control-static">${user.userName }</p></c:when>
												<c:otherwise>
													<input type="text" name="userName" id="userName"
														class="form-control" value="${user.userName }">
												</c:otherwise>
											</c:choose>
											</div>
                                                            </div>
                                                                 <div class="form-group">
                                                           <label class="col-md-3 control-label">姓名: </label>
                                                               <div class="col-md-4">
                                                                <input type="text"
											name="realName" class="form-control"
											value="${user.realName }"/>
											</div>
                                                            </div>
                                                                    
                                                                        <div class="form-group">
                                                           <label class="col-md-3 control-label">密码: </label>
                                                               <div class="col-md-4">
                                                           <c:choose>
												<c:when test="${ !empty  user}">
													<input type="text" name="password" class="form-control"
														value="">
												</c:when>
												<c:otherwise>
													<input type="text" name="password" id="password"
														class="form-control" value="123456">
												</c:otherwise>
											</c:choose>
											</div>
                                                            </div>
                                                                        <div class="form-group">
                                                           <label class="col-md-3 control-label">状态: </label>
                                                               <div class="col-md-4">
                                                       <select class="form-control" data-placeholder="请选择状态"  name="status">
                                                                            <option value="0" <c:if test="${0 eq user.status  }"> selected=" selected"</c:if>  >正常</option>
                                                                            <option value="1" <c:if test="${not (0  eq  user.status) }"> selected=" selected"</c:if> >禁用</option>
                                                                        </select>
											</div>
                                                            </div>
                                                     
                                                        </div>
                                              
                                                </div>
                                                   <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class="font-red-sunglo"></i>
                                                        <span class="caption-subject font-red-sunglo bold uppercase">角色信息</span>
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
								<td><a id="role_${role.id}" href="javascript:void(0)">折叠</a>
									<a id="NoSelect_${role.id}" href="javascript:void(0)">不选</a> <%-- <input type="checkbox" id="role_${role.id}"
									name="roles" value="${role.id}"
									<c:if test="${userRolesSet.contains(role.id)}"> checked=true </c:if>> --%>
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
													${roleLevel.enName}</td>
												<td width="33%">${roleLevel.enName}</td>
												<td width="33%"><input type="radio"
													id="roleLevel_${roleLevel.id}" name="roleLevels_${role.id}"
													<c:if test="${userRoleLevelsSet.contains(roleLevel.id)}"> checked=true </c:if>
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
                                                                    <button type="button" class="btn green" id="submitBtn">确定</button>
                                                                   <a href="./userlist"> <button type="button" class="btn default">取消</button></a>
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
       <script type='text/javascript' src="js/roleTableManage.js"></script>
<script type='text/javascript' src="js/usermanage.js"></script>
       
    </body>
</html>