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
                        <h1 class="page-title"> 用户管理
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                    
                                   
                                         <form action="./userlist" method="get"  class="form-inline">
                                     
										      <div class="form-group">
								<label class=" control-label">用户名:</label>
										<input class="form-control input-inline input-medium" placeholder="请输入用户名" type="text"  name="userName" id="queryByUserName"   value="${userParam.userName }" />
										</div>
										      <div class="form-group">
								<label class=" control-label">姓名:</label>
										<input class="form-control input-inline input-medium" placeholder="请输入姓名" type="text"  name="realName" id="queryByRealName"   value="${userParam.realName }" />
										</div>
										    
					     <div class="form-group">
					<button id="queryBtn" type="submit" class="btn btn-info">搜索</button>
				<a href="./useradd">	<button id="addBtn" type="button" class="btn btn-success" >添加</button></a>
						</div>
				</div>
			</form> 
                                       
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-light">
                                                <thead>
                                             	<tr>
							<th>用户名</th>
							<th>姓名</th>
                             <th>创建时间</th>
                             <th>更新时间</th>
							<th>状态</th>
							<th>管理</th>
		
						</tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach items="${userList}" var="user">
						<tr>
							<td>${user.userName}</td>
							<td>${user.realName}</td>
                            <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <c:choose>
								<c:when test="${user.status eq 0 }">
									<td><span class="label label-success">正常</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="label label-warning">禁用</span></td>
								</c:otherwise>
							</c:choose>
							<td><a href="./usermanage?id=${user.id}">修改</a> | <a
								href="userdelete?id=${user.id}">删除</a></td>
						</tr>
					</c:forEach>
                                                </tbody>
                                            </table>
                                            
                                            </div>
                                            
                                            <div>
                                            	<c:import url="common/pagination.jsp">
						<c:param name="currentPage" value="${userParam.page}" />
					<c:param name="totalPage" value="${totalPage }" />
					<c:param name="totalCount" value="${totalCount }" />
					<c:param name="url"
						value="./userlist?username=${userParam.userName}&realname=${userParam.realName}&" />
				</c:import>
                                          
                                        </div>
                                    </div>
                                </div>
                                <!-- END SAMPLE TABLE PORTLET-->
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
       
    </body>
</html>