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
                                    <span>数仓元数据</span>
                                </li>
                            </ul>
                           <c:import url="common/metaTableRightBar.jsp"></c:import>
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">预警规则信息  ${metaTable.name } (${metaTable.alias})
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" action="./metaTableMonitorSave" method="post"
								id="form">
						   <input type="hidden" name="id" id="id" value="${metaTableMonitor.id }"/>
                            <input type="hidden" name="metaTableId" id="metaTableId" value="${metaTable.id }"/>
                        <div class="portlet light bordered">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                        
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">规则名称: </label>
                                                               <div class="col-md-9">
                                                        	 <input type="text" name="monitorName" id="monitorName"
														class="form-control" value="${metaTableMonitor.monitorName }"/>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                              <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">是否启用: </label>
                                                               <div class="col-md-9">
                                                         <select id="enableMonitor" class="form-control"
                                                                                                       name="enableMonitor">
                                        <option value="0" <c:if
                                                test="${ metaTableMonitor.enableMonitor eq 0 }"> selected=selected </c:if>>关闭
                                        </option>
                                        <option value="1" <c:if
                                                test="${ metaTableMonitor.enableMonitor eq 1 }"> selected=selected </c:if>>开启
                                        </option>
                                    </select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">最小值: </label>
                                                               <div class="col-md-9">
                                                        <input type="text"
											name="valueMin" class="form-control"
											value="${metaTableMonitor.valueMin}"/>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                                <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">最大值: </label>
                                                               <div class="col-md-9">
                                                                <input type="text"
											name="valueMax" class="form-control"
											value="${metaTableMonitor.valueMax}"/>
											</div>
                                                            </div>
                                                              
                                                          
                                                            </div>
                                                            </div>
                                                                    
                                                                      
                                                            
                                                              <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">定时调度: </label>
                                                               <div class="col-md-4">
                                                         <select id="monitorjobScheduleHour" name="monitorjobScheduleHour" class="form-control">
                                            <option value='-1'>小时</option>
                                            <c:forEach begin="0" end="23" var="etlJobScheduleHour">
                                                <option value='${ etlJobScheduleHour}'
                                                        <c:if test="${ metaTableMonitor.monitorjobScheduleHour eq etlJobScheduleHour }"> selected=selected </c:if>>
                                                        ${ etlJobScheduleHour}点
                                                </option>
                                            </c:forEach>
                                        
                                        </select>
                                            </div>
                                                <div class="col-md-4">
                                        <select id="monitorjobScheduleMinute" name="monitorjobScheduleMinute" class="form-control">
                                            <option value='-1'>分钟</option>
                                            <c:forEach begin="0" end="59" var="etlJobScheduleMinute">

                                                <option value='${ etlJobScheduleMinute}'
                                                        <c:if test="${ metaTableMonitor.monitorjobScheduleMinute eq etlJobScheduleMinute }"> selected=selected </c:if>>
                                                        ${ etlJobScheduleMinute}分
                                                </option>
                                            </c:forEach>
                                        </select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            
                                                                  <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">优先级: </label>
                                                           
                                                              <div class="col-md-9">
                                                           <select id="priority"
                                                                                                      name="priority" class="form-control"
                                                                                                     >
                                        <c:forEach var="priority" begin="1" end="10">

                                            <option value='${ priority}'
                                                    <c:if test="${ metaTableMonitor.priority eq priority }"> selected=selected </c:if>>
                                                    ${ priority}</option>
                                        </c:forEach>
                                    </select>
                                                           </div>
                                                           
                                                           </div></div></div>
                                                                  
                                                              <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">SQL内容: </label>
                                                               <div class="col-md-9">
                                                        <textarea 
											name="monitorSql" class="form-control" rows="5"  
											>${metaTableMonitor.monitorSql }</textarea>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                       <button id="submitBtn" type="submit" class="btn btn-success">提交</button>

				<c:if test="${ !empty  metaTableMonitor}">
				<a href="./metaTableMonitorDelete?id=${metaTableMonitor.id}&metaTableId=${metaTableMonitor.metaTableId}">
					<button id="delBtn" type="button" class="btn btn-warning">删除</button></a>

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