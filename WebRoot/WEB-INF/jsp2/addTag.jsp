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
                                    <span>用户画像</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>标签管理</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">标签信息
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" action="./saveTag" method="post"
								id="form">
                        <div class="portlet light bordered">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                        
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">父级标签: </label>
                                                               <div class="col-md-9">
                                                        	<select id="p_module" name="pid"  class="form-control">
												<option value='-1'>系统顶级</option>
												<c:forEach items="${allTreeTags}" var="tagTemp">

													<option value='${ tagTemp.id}'
														<c:if test="${ tagTemp.id eq  tag.pid }"> selected=selected </c:if>>
														<c:forEach begin="1" end="${tagTemp.level}">------</c:forEach>
														${tagTemp.name}
													</option>
												</c:forEach>
										</select>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                             <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">标签名称: </label>
                                                               <div class="col-md-9">
                                                                <input type="text"
											name="name" class="form-control"
											value="${tag.name }"/>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                             <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">标签标识: </label>
                                                               <div class="col-md-9">
                                                                <input type="text"
											name="tag" class="form-control"
											value="${tag.tag }"/>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">顺序编码: </label>
                                                               <div class="col-md-9">
                                                        	<input type="text"
											name="sortNo" class="form-control" value="${tag.sortNo }">
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                             <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">标签类型: </label>
                                                               <div class="col-md-9">
                                                             <select id="dataType"  class="form-control"
											name="dataType">
											<option value='0'
													<c:if test="${ tag.dataType eq 0 }"> selected=selected </c:if>>虚拟</option>
												<option value='1'
													<c:if test="${ tag.dataType eq  1 }"> selected=selected </c:if>>数值</option>
												<option value='2'
													<c:if test="${ tag.dataType eq 2 }"> selected=selected </c:if>>列表</option>
												<option value='3'
													<c:if test="${ tag.dataType eq 3 }"> selected=selected </c:if>>日期</option>
												<option value='4'
													<c:if test="${ tag.dataType eq 4 }"> selected=selected </c:if>>字典</option>
												
										</select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                                    
                                                                      
                                                         <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">简单模式: </label>
                                                               <div class="col-md-9">
                                                         <select id="simpleModle" class="form-control"
											name="simpleModle">
											<option value='0'
													<c:if test="${ tag.simpleModle eq 0 }"> selected=selected </c:if>>否</option>
												<option value='1'
													<c:if test="${ tag.simpleModle eq  1 }"> selected=selected </c:if>>是</option>
										</select>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                             <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">常用标签: </label>
                                                               <div class="col-md-9">
                                                             <select id="commonConditon"  class="form-control"
											name="commonConditon">
											<option value='0'
													<c:if test="${ tag.commonConditon eq 0 }"> selected=selected </c:if>>否</option>
												<option value='1'
													<c:if test="${ tag.commonConditon eq  1 }"> selected=selected </c:if>>是</option>
										</select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            
                                                              <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">标签描述: </label>
                                                               <div class="col-md-9">
                                                        <textarea 
											name="description" class="form-control" rows="5" cols="16" style="margin: 0px; width: 571px; height: 59px;"
											>${tag.description}</textarea>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                        <input name="id" value="${tag.id }" type="hidden" /> 
                                                                       <button id="submitBtn" type="submit" class="btn btn-success">提交</button>

				<c:if test="${ !empty  tag}">
				<a href="deleteTag?id=${tag.id}">
					<button id="delBtn" type="button" class="btn btn-warning">删除标签</button></a>

				</c:if>
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