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
                                    <span>数据管理</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>数据字典</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">数据字典
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                 <div class="col-md-12">
                               <!-- BEGIN FORM-->
                    <form class="form-horizontal" id="form">
                        <div class="portlet light bordered">
                           <div class="portlet-title">
                              <div class="caption">
                                 <i class="font-red-sunglo"></i>
                                    <span class="caption-subject font-red-sunglo bold uppercase">基本信息</span>
                              </div>
                           </div>
                           <div class="portlet-body form">
                               <div class="form-body">
                                   <div class="form-group" style="display: none">
                                       <label class="col-md-3 control-label">id: </label>
                                       <div class="col-md-4">
                                           <input type="text" name="id" id="id"
														class="form-control" value="${config.id }">
                                       </div>
                                   </div>
                                   <div class="row" style="display: none">
                                       <div class="col-md-6">
                                           <div class="form-group">
                                              <label class="col-md-3 control-label">类型: </label>
                                              <div class="col-md-9">
                                                      <input type="text" id="configType" name="configType"
                                                             class="form-control"value="DATABASE_PARAM_TYPE_" readonly="readonly"/>
                                              </div>
                                           </div>
                                       </div>
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">排序：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="configOrder" id="configOrder" value="${config.configOrder }">
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="row">
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">key值：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="configKey" id="configKey" value="${config.configKey }">
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">数据库类型：</label>
                                               <div class="col-md-9">
                                                   <select id="dbtype"class="form-control">
                                                       <option value="">请选择</option>
                                                       <option ${config.dbtype eq 'mysql'?'selected':'' }>mysql</option>
                                                       <option ${config.dbtype eq 'postgresql'?'selected':'' }>postgresql</option>
                                                       <option ${config.dbtype eq 'hive'?'selected':'' }>hive</option>
                                                   </select>
                                               </div>
                                           </div>
                                       </div>
                                   </div>

                                   <div class="row">
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">数据库名：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="db" id="db" value='${config.db }'>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">数据库地址：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="url" id="url" value='${config.url }'>
                                               </div>
                                           </div>
                                       </div>
                                   </div>

                                   <div class="row">
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">用户名：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="user" id="user" value="${config.user }">
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">密码：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="password" id="password" value='${config.password }'>
                                               </div>
                                           </div>
                                       </div>
                                   </div>

                                   <div class="row">
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">数据库描述：</label>
                                               <div class="col-md-9">
                                                   <textarea class="form-control" rows="3" name="name" id="name">${config.name }</textarea>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">描述：</label>
                                               <div class="col-md-9">
                                                   <textarea class="form-control" rows="3" id="description" name="description">${ config.description}</textarea>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="row">
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">schema：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="schema1" id="schema1" value="${config.schema }">
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-md-6"  style="display: none">
                                           <div class="form-group">
                                               <label class="col-md-3 control-label">父ID：</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" name="configParent" id="configParent" value="${config.configParent }">
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>

                               <div class="portlet-body form">
                                   <div class="form-actions">
                                       <div class="row">
                                          <div class="col-md-offset-3 col-md-4">
                                             <button type="button" class="btn btn-success" id="submitBtn">确定</button>
                                                <button type="button" class="btn btn-warning" id="deleteBtn">删除</button>
                                          </div>
                                       </div>
                                   </div>
                               </div>
                                                
                           </div>

                        </div>

                    </form><!-- END FORM-->
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
       $(function(){
    	   $('#submitBtn').click(function(){
    		   $.post('tableConfigSave',{
    			   id:$('#id').val(),
                   configType:$('#configType').val(),
                   configKey:$('#configKey').val(),
                   description:$('#description').val(),
                   configParent:$('#configParent').val(),
                   configOrder:$('#configOrder').val(),
    			   db:$('#db').val(),
                   name:$('#name').val(),
                   user:$('#user').val(),
                   password:$('#password').val(),
                   url:$('#url').val(),
                   dbtype:$('#dbtype').val(),
                   schema:$('#schema1').val()
    		   },function(data){
    			   if(data.code==0){
    					  swal("提示",data.errorMsg, "success");  
    					window.location.href='./tableConfigIndex';
    			   }
    				  swal("提示",data.errorMsg, "warning");  
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
                	   $.post('configDelete',{
            			   id:$('#id').val()
            			   
            		   },function(data){
            			   swal("提示!", "删除成功.", "success");  
                           window.location.href='./tableConfigIndex';
            		   });
                       
                       
                   }
               });  
    		   
    		   
    	   });

    	   $("#dataSource").change(function () {
               $("#sqlFields").hide();
               $("#redisFields").hide();
               if($("#dataSource").val() == 'REDIS'){
                   $("#redisFields").show();
               }
               if($("#dataSource").val() == 'SQL'){
                   $("#sqlFields").show();
               }
           })
    	   
       });
       
       </script>
       
    </body>
</html>