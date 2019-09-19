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
                                    <span>数据接口</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">数据接口
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
                                               <input
									type="hidden" name="commonDataSummaryId" id="commonDataSummaryId" value="${commonDataDetail.commonDataSummaryId }" />
                                                        <div class="form-body">
                                                        
                                                   
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">接口标识: </label>
                                                               <div class="col-md-4">
													<input type="text" name="name" id="name"
														class="form-control" value="${commonDataDetail.name }">
											</div>
                                                            </div>
                                                                 <div class="form-group">
                                                           <label class="col-md-3 control-label">接口名称: </label>
                                                               <div class="col-md-4">
                                                                <input type="text" id="alias"
											name="alias" class="form-control"
											value="${commonDataDetail.alias }"/>
											</div>
                                                            </div>
                                                                    
                                                                            <div class="portlet light bordered">
                                                                        <div class="form-group">
                                                           <label class="col-md-3 control-label">数据源类型: </label>
                                                               <div class="col-md-4">
                                                       <select class="form-control" data-placeholder="请选择"  name="dataSource" id="dataSource">
                                                                <option value="SQL" <c:if test="${'SQL' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >SQL</option>
                                                                <option value="SQL116" <c:if test="${'SQL116' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >SQL116</option>
                                                                <option value="SQL242" <c:if test="${'SQL242' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >SQL242</option>
                                                                <option value="IMPALA" <c:if test="${'IMPALA' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >IMPALA</option>
                                                                <option value="PRESTO" <c:if test="${'PRESTO' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >PRESTO</option>
                                                                <option value="MYSQL" <c:if test="${'MYSQL' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >MYSQL</option>
                                                                <option value="DRUID" <c:if test="${'DRUID' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >DRUID</option>
                                                                <option value="REDIS" <c:if test="${'REDIS' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >REDIS</option>
                                                                <option value="ES" <c:if test="${'ES' eq commonDataDetail.dataSource  }"> selected=" selected"</c:if>  >ES</option>
                                                        </select>
											</div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">项目名称: </label>
                                                                <div class="col-md-4">
                                                                    <input type="text" id="projectName"
                                                                           name="projectName" class="form-control"
                                                                           value="${commonDataDetail.projectName }"/>
                                                                </div>
                                                            </div>
 
                                                                <div id="sqlFields" style="display: none">
                                                      <div class="form-group">
                                                           <label class="col-md-3 control-label">SQL语句：</label>
                                                               <div class="col-md-4">
                                                                    <textarea class="form-control" rows="3" id="queryContent" name="queryContent">${ commonDataDetail.queryContent}</textarea>
											                    </div>
                                                            </div>
                                                                </div>
                                                                <div id="redisFields" style="display: none">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">数据类型: </label>
                                                            <div class="col-md-4">
                                                                <select class="form-control" data-placeholder="请选择"  name="dataType" id="dataType">
                                                                    <c:forEach items="${redisDataTypes}" var="item">
                                                                    <option value="${item}">${item}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            </div>
                                                                <div class="form-group">
                                                                    <label class="col-md-3 control-label">查询key: </label>
                                                                    <div class="col-md-4">
                                                                        <input type="text" id="key"
                                                                               name="key" class="form-control"
                                                                               value="${commonDataDetail.key }"/>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-md-3 control-label">查询字段: </label>
                                                                    <div class="col-md-4">
                                                                        <input type="text" id="fields"
                                                                               name="fields" class="form-control"
                                                                               value="${commonDataDetail.fields }"/>
                                                                    </div>
                                                                </div>
                                                                </div>
                                                                </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">缓存时间(分钟): </label>
                                                                <div class="col-md-4">
                                                                    <input type="text" name="cacheTime" id="cacheTime"
                                                                           class="form-control" value="${commonDataDetail.cacheTime }">
                                                                </div>
                                                            </div>
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">负责人: </label>
                                                               <div class="col-md-4">
													<input type="text" name="owner" id="owner"
														class="form-control" value="${commonDataDetail.owner }">
											</div>
                                                            </div>
                                                               <div class="form-group">
                                                           <label class="col-md-3 control-label">备注：</label>
                                                               <div class="col-md-4">
                                                            <textarea class="form-control" rows="3" name="description" id="description">${commonDataDetail.description }</textarea>
											</div>
                                                            </div>
                                                        </div>
                                              
                                                </div>
                                                 <div class="portlet-body form">
					
					   <div class="form-actions">
                                                            <div class="row">
                                                                <div class="col-md-offset-3 col-md-4">
                                                                    <button type="button" class="btn btn-success" id="submitBtn">保存</button>
                                                                    <button type="button" class="btn btn-warning" id="deleteBtn">删除</button>
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
       <script type='text/javascript'>
       $(function(){
           <c:if test="${'SQL' eq commonDataDetail.dataSource or  'IMPALA' eq commonDataDetail.dataSource or  'ES' eq commonDataDetail.dataSource or 'SQL116' eq commonDataDetail.dataSource or 'SQL242' eq commonDataDetail.dataSource or 'PRESTO' eq commonDataDetail.dataSource or 'MYSQL' eq commonDataDetail.dataSource or 'MYSQL111' eq commonDataDetail.dataSource }">
            $("#sqlFields").show();
           </c:if>
           <c:if test="${'DRUID' eq commonDataDetail.dataSource }">
           $("#sqlFields").show();
           </c:if>
           <c:if test="${'REDIS' eq commonDataDetail.dataSource }">
           $("#redisFields").show();
           </c:if>
           <c:if test="${commonDataDetail.dataSource == null}">
           $("#sqlFields").show();
           </c:if>
    	   $('#submitBtn').click(function(){
    		   $.post('dataApiSave',{
    			   commonDataSummaryId:$('#commonDataSummaryId').val(),
    			   name:$('#name').val(),
    			   alias:$('#alias').val(),
    			   dataSource:$('#dataSource').val(),
    			   queryContent:$('#queryContent').val(),
                   projectName: $('#projectName').val(),
    			   description:$('#description').val(),
                   dataType:$('#dataType').val(),
                   key:$('#key').val(),
                   fields:$('#fields').val(),
    			   owner:$('#owner').val(),
                   cacheTime:$('#cacheTime').val()
    			   
    		   },function(data){
    			   if(data.code==0){
    					  swal("提示",data.errorMsg, "success");  
    					window.location.href='./dataApi';
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
                	   $.post('dataApiDelete',{
            			   commonDataSummaryId:$('#commonDataSummaryId').val()
            			   
            		   },function(data){
            			   swal("提示!", "删除成功.", "success");  
                           window.location.href='./dataApi';
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
               if($("#dataSource").val() == 'IMPALA' || $("#dataSource").val() == 'SQL'||$("#dataSource").val() == 'ES' || $("#dataSource").val() == 'SQL116' || $("#dataSource").val() == 'SQL242' || $("#dataSource").val() == 'PRESTO' || $("#dataSource").val() == 'MYSQL'){
                   $("#sqlFields").show();
               }

               if($("#dataSource").val() == 'DRUID'){
                   $("#sqlFields").show();
               }
           })
    	   
       });
       
       </script>
       
    </body>
</html>