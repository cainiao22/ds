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
                                                    <form class="form-horizontal" 
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
                                                        
                                                        
                                                          <div class="form-group" style="display: none">
                                                           <label class="col-md-3 control-label">id: </label>
                                                               <div class="col-md-4">
													<input type="text" name="id" id="id"
														class="form-control" value="${config.id }">
											</div>
                                                            </div>
                                                                 <div class="form-group">
                                                           <label class="col-md-3 control-label">类型: </label>
                                                               <div class="col-md-4">
                                                                <input type="text" id="configType"
											name="configType" class="form-control"
											value="${config.configType }"/>
											</div>
                                                            </div>

                                                      <div class="form-group">
                                                           <label class="col-md-3 control-label">key值：</label>
                                                               <div class="col-md-4">
                                                            <input class="form-control" name="configKey" id="configKey" value="${config.configKey }">
											</div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">value值：</label>
                                                                <div class="col-md-4">
                                                                    <input class="form-control" name="configValue" id="configValue" value='${config.configValue }'>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">排序：</label>
                                                                <div class="col-md-4">
                                                                    <input class="form-control" name="configOrder" id="configOrder" value="${config.configOrder }">
                                                                </div>
                                                            </div>
                                                      <div class="form-group">
                                                           <label class="col-md-3 control-label">描述：</label>
                                                               <div class="col-md-4">
                                                                    <textarea class="form-control" rows="3" id="description" name="description">${ config.description}</textarea>
											                    </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">父ID：</label>
                                                                <div class="col-md-4">
                                                                    <input class="form-control" name="configParent" id="configParent" value="${config.configParent }">
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
       $(function(){
    	   $('#submitBtn').click(function(){
    		   $.post('configSave',{
    			   id:$('#id').val(),
                   configType:$('#configType').val(),
                   configKey:$('#configKey').val(),
                   configValue:$('#configValue').val(),
                   description:$('#description').val(),
                   configParent:$('#configParent').val(),
                   configOrder:$('#configOrder').val(),
    			   
    		   },function(data){
    			   if(data.code==0){
    					  swal("提示",data.errorMsg, "success");  
    					window.location.href='./configIndex';
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
                           window.location.href='./configIndex';
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