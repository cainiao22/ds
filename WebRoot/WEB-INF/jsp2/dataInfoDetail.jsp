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
                                    <span>元数据</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>数据同步列表</span>
                                </li>
                            </ul>

                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">源数据信息
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                <div class="col-md-12">
                               <!-- BEGIN FORM-->
                    <form class="form-horizontal"id="form">
                        <div class="portlet light bordered">
                            <div class="portlet-body form">
                                <div class="form-body">
                                  <div class="row">
                                      <div class="col-md-6">
                                        <div class="form-group">
                                          <label class="col-md-3 control-label">源表名: </label>
                                            <div class="col-md-9">
                                              <input type="text" id="tableName"name="tableName" class="form-control"
                                                       value="${info.tableName }"/>
											</div>
                                        </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="form-group">
                                              <label class="col-md-3 control-label">目标表名: </label>
                                              <div class="col-md-9">
                                                <input type="text"  id="targetTableName"
											name="targetTableName" class="form-control" value="${info.targetTableName }">
											  </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="row">
                                      <div class="col-md-6">
                                          <div class="form-group">
                                              <label class="col-md-3 control-label">负责人:  </label>
                                              <div class="col-md-9">
                                                  <input type="text"  id="owner"
                                                         name="owner" class="form-control" value="${info.ownerd}">
											</div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="form-group">
                                              <label class="col-md-3 control-label">中文名: </label>
                                              <div class="col-md-9">
                                                  <input type="text"  id="alias"
                                                         name="alias" class="form-control" value="${info.alias }">
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="row">
                                      <div class="col-md-6">
                                          <div class="form-group" >
                                              <label class="col-md-3 control-label">源数据库类型: </label>
                                              <div class="col-md-9">
                                                  <input type="text"  id="metaDataType"
											      name="metaDataType" class="form-control" value="${info.metaDataType }">
											  </div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="form-group" >

                                              <label class="col-md-3 control-label">源数据库: </label>
                                              <div class="col-md-9">
                                                  <input type="text"  id="metaConfigkey"
											name="metaConfigkey" class="form-control"   value="${info.metaConfigkey }">
											  </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="row">
                                      <div class="col-md-6">
                                          <div class="form-group">
                                              <label class="col-md-3 control-label">目标数据库类型: </label>
                                              <div class="col-md-9">
                                                  <input name="targetDataType" class="form-control" id="targetDataType" type="text"
                                                         value="${info.targetDataType }">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="form-group">
                                              <label class="col-md-3 control-label">目标数据库:  </label>
                                              <div class="col-md-9">
                                                  <input type="text"  id="targetConfigkey"
											name="targetConfigkey" class="form-control" value="${info.targetConfigkey}">
											  </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="row">
                                      <div class="col-md-6">
                                          <div class="form-group">
                                              <label class="col-md-3 control-label">创建时间: </label>
                                              <div class="col-md-9">
                                                  <input type="text"  id="createTime"
                                                         name="createTime" class="form-control" value="<fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="form-group">
                                            <label class="col-md-3 control-label">SQL语句:</label>
                                            <div class="col-md-9">
                                              <textarea class="form-control" rows="4"    id="sqlStatement" name="sqlStatement">${ info.sqlStatement}</textarea>
                                            </div>
                                          </div>
                                      </div>
                                  </div>
                                  <%--<div class="row">
                                      <div class="col-md-offset-3 col-md-9">
                                          <button id="submitBtn" type="button" class="btn btn-success">保存</button>
                                          <button id="submitAnsSyncBtn" type="button" onclick="syncDataAndStruct()" class="btn btn-success">保存并同步结构</button>
                                          <c:if test="${info != null}">
                                              <button id="syncDataBtn" type="button" class="btn btn-success">同步数据</button>
                                          </c:if>

                                      </div>
                                  </div>--%>
                                </div>
                            </div>
                        </div>
                    </form>
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

<script type='text/javascript'>

</script>
    </body>
</html>