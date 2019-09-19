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
    <c:import url="common/global_js.jsp"></c:import>
<script type="text/javascript" src="./assets/global/plugins/select2/js/select2.min.js"></script>
<script type="text/javascript" src="./assets/global/plugins/select2/js/select2.full.min.js"></script>
<c:import url="common/global_style.jsp"></c:import>
<link  href="./assets/global/plugins/select2/css/select2.min.css"
   rel="stylesheet" type="text/css" />
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
                                    <span>业务库</span>
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
                                                    <form class="form-horizontal"
								id="form">
                        <div class="portlet light bordered">


                                                <div class="portlet-body form">
                                                        <div class="form-body">

                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">表名: </label>
                                                               <div class="col-md-9">
                                                        	    <input type="text" id="tableName"
											name="tableName" class="form-control"
											value="${info.tableName }"/>
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
                                                          <div class="col-md-6" style="display: none">

                                                             <div class="form-group">

                                                           <label class="col-md-3 control-label">服务器: </label>
                                                               <div class="col-md-9">
                                                                <input type="password"  id="ip"
											name="ip" class="form-control"
											value="${info.ip }"/>
											</div>
                                                            </div>

                                                            </div>
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">数据库: </label>
                                                               <div class="col-md-9">
                                                                   <input type="hidden" readonly="readonly" <%--<c:choose><c:when test="${add == true}"> type="hidden" </c:when> <c:otherwise>type="text"</c:otherwise></c:choose>--%> id="dbName"
											name="dbName" class="form-control" value="${info.dbName }">
                                                                   <select id="dbNameSelect" name="dbNameSelect" class="form-control">
                                                                       <option value ="">请选择</option>
                                                                       <c:forEach items="${dataBaseMap}" var="item">
                                                                           <option value ="${item.key}"}>${item.key}</option>
                                                                       </c:forEach>
                                                                   </select>
											</div>
                                                            </div>
                                                            </div>

                                                            </div>


                                                         <div class="row">
                                                                    <div class="col-md-6">
                                                             <div class="form-group" style="display: none">

                                                           <label class="col-md-3 control-label">用户名: </label>
                                                               <div class="col-md-9">
                                                          	<input type="password"  id="user"
											name="user" class="form-control" value="${info.user }">
											</div>
                                                            </div>
                                                            </div>
                                                                    <div class="col-md-6">
                                                             <div class="form-group" style="display:none;">

                                                           <label class="col-md-3 control-label">密码: </label>
                                                               <div class="col-md-9">
                                                          	<input type="password"  id="password"
											name="password" class="form-control" value="${info.password }">
											</div>
                                                            </div>
                                                            </div>
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">同步模式: </label>
                                                               <div class="col-md-9">
                                                         <select id="updateType" class="form-control"
											name="updateType">
                                             <option value='2'
                                                     <c:if test="${ info.updateType eq  2 }"> selected=selected </c:if>>全量</option>
											<option value='1'
													<c:if test="${ info.updateType eq 1}"> selected=selected </c:if>>增量</option>

										</select>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                             <div class="form-group">

                                                           <label class="col-md-3 control-label">负责人:  </label>
                                                               <div class="col-md-9">
                                                           	<input type="text"  id="owner"
											name="owner" class="form-control" value="${info.owner}">
											</div>
                                                            </div>
                                                            </div>
                                                            </div>

                                                            <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                       <button id="submitBtn" type="button" class="btn btn-success">保存</button>
                                                                       <button id="submitAnsSyncBtn" type="button" onclick="syncDataAndStruct()" class="btn btn-success">保存并同步结构</button>
                                                                        <c:if test="${info != null}">
                                                                            <button id="syncDataBtn" type="button" class="btn btn-success">同步数据</button>
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

        <script type='text/javascript'>
            function syncDataAndStruct(url, flag) {
                    flag = flag || false;
                    url = url || './saveAndSynScheme';
                    $.post(url,{
                        id:'${info.id}',
                        user:$('#user').val(),
                        password:$('#password').val(),
                        ip:$('#ip').val(),
                        dbName:$('#dbName').val(),
                        tableName:$('#tableName').val(),
                        alias:$('#alias').val(),
                        owner:$('#owner').val(),
                        updateType:$('#updateType').val(),
                        flag:flag

                    },function(data){
                        if(data.code==1){
                            swal("提示",data.errorMsg, "success");
                            window.location.href='./bizSourceMeta';
                        }else if(data.code == 2){
                            swal({
                                    title: "同步表结构",
                                    text: "该表结构已经通步过了，是否更新?",
                                    type: "warning",
                                    showCancelButton: true,
                                    confirmButtonColor: "#DD6B55",
                                    confirmButtonText: "同步结构",
                                    closeOnConfirm: false
                                },
                                function(){
                                    syncDataAndStruct('./updateGpScheme', true);
                                });
                        }else{
                            swal("提示",data.errMessage, "warning");
                        }
                    });

            }
       $(function(){
           $('#dbNameSelect').select2();
    	   $('#submitBtn').click(function(){
    		   $.post('saveOrUpdateScheme',{
    		   id:'${info.id}',
    			   user:$('#user').val(),
    			   password:$('#password').val(),
    			   ip:$('#ip').val(),
    			   dbName:$('#dbName').val(),
    			   tableName:$('#tableName').val(),
    			   alias:$('#alias').val(),
    			   owner:$('#owner').val(),
    			   updateType:$('#updateType').val()

    		   },function(data){
    			   if(data.code==1){
    					  swal("提示",data.errorMsg, "success");
    				 window.location.href='./bizSourceMeta';
    			   }
    				  swal("提示",data.errMessage, "warning");
    		   });


    	   });
    	   //$('#submitAnsSyncBtn').click(syncDataAndStruct());
           $('#syncDataBtn').click(function(){
               $.post('syncData',{
                   id:'${info.id}'

               },function(data){
                   if(data.code==1){
                       swal("提示","同步成功", "success");
                       window.location.href='./bizSourceMeta';
                   }
                   swal("提示",data.errMessage, "warning");
               });


           });
    	   $('#deleteBtn').click(function(){
    		   swal({
                   title: "确认吗?",
                   text: "确认删除吗？该操作不可逆。",
                   type: "warning",
                   showCancelButton: true,
                   confirmButtonText: "确认!",
                   cancelButtonText: "取消",
                   closeOnConfirm: true,
                   closeOnCancel: true },
               function (isConfirm) {
                   if (isConfirm) {
                	   $.post('dataApiDelete',{
            			   commonDataSummaryId:$('#commonDataSummaryId').val()

            		   },function(data){
            			   swal("提示!", "删除成功.", "success");
                           window.location.href='./bizSourceMeta';
            		   });


                   }
               });


    	   });
           var dataBases = ${dataBaseList} || {};
           var dbName = $("#dbName").val();
           if(dbName != null && dbName != '') {
               $.each(dataBases, function (key, value) {
                   if(dbName==value.db){
                       $("#dbNameSelect").val(key);
                       $('#dbNameSelect').select2();
                       //$('#dbNameSelect').val(key).trigger('change');
                       return false;
                   }
               });
           }
           $("#dbNameSelect").change(function () {
               var dbName = $("#dbNameSelect").val();
               var database = dataBases[dbName];
               $("#dbName").removeAttr("readonly");
               $("#dbName").val(database.db);
               $("#dbName").attr("readonly","readonly");
               $("#user").val(database.user);
               $("#password").val(database.password);
               $("#ip").val(database.url);
           });
       });
       </script>
    </body>
</html>