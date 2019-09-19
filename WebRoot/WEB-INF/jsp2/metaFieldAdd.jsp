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
                        <h1 class="page-title">字段信息  ${metaTable.name } (${metaTable.alias})
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" action="./metaFieldSave" method="post"
								id="form">
							<input
									type="hidden" name="id" id="id" value="${metaField.id }" />
							<input
									type="hidden" name="tableId" id="tableId" value="${metaTable.id }" />
                        <div class="portlet light bordered">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                        
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">字段名称: </label>
                                                               <div class="col-md-9">
                                                        	 <input type="text" name="name" id="name"
														class="form-control" value="${metaField.name }"/>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                              <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">中文名: </label>
                                                               <div class="col-md-9">
                                                       <input type="text"
											name="alias"  				class="form-control"
											value="${metaField.alias }">
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">原始类型: </label>
                                                               <div class="col-md-9">
                                                        <input type="text"
											name="type" class="form-control"
											value="${metaField.type}"/>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                                <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">数据类型: </label>
                                                               <div class="col-md-9">
                                                            	<select name="dataType" class="form-control  ">
					<option value="-1">请选择</option>
					<option value="0" <c:if test ="${metaField.dataType eq 0 }"> selected="selected"</c:if>>文本</option>
					<option value="1" <c:if test ="${metaField.dataType eq 1 }"> selected="selected"</c:if>>数字</option>
					<option value="2" <c:if test ="${metaField.dataType eq 2 }"> selected="selected"</c:if>>日期</option>
					</select>
											</div>
                                                            </div>
                                                              
                                                          
                                                            </div>
                                                            </div>
                                                          <div class="row">
                                                  
                                                              <div class="col-md-6">
                                                                <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">是否日期: </label>
                                                               <div class="col-md-9">
                                                            	<select  name="isDate"   class="form-control">
												<option <c:if test="${metaField.isDate == 0}"> selected="selected" </c:if> value="0">否</option>
												<option <c:if test="${metaField.isDate == 1}"> selected="selected" </c:if> value="1">是</option>
											</select>
											</div>
                                                            </div>
                                                              
                                                          
                                                            </div>
                                                            
                                                             <div class="col-md-6">
                                                                <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">维度: </label>
                                                               <div class="col-md-9">
                                                               
                                                               
                                                               <select  name="isDim"   class="form-control">
												<option <c:if test="${metaField.isDim == 0}"> selected="selected" </c:if> value="0">否</option>
												<option <c:if test="${metaField.isDim == 1}"> selected="selected" </c:if> value="1">是</option>
											</select>
                                                               

											</div>
                                                            </div>
                                                              
                                                          
                                                            </div>
                                                            
                                                            </div>
                                                                    
                                                                           <div class="row">
                                                  
                                                              <div class="col-md-6">
                                                                <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">过滤: </label>
                                                               <div class="col-md-9">
                                                            	<select  name="isFilter"   class="form-control">
												<option <c:if test="${metaField.isFilter == 0}"> selected="selected" </c:if> value="0">否</option>
												<option <c:if test="${metaField.isFilter == 1}"> selected="selected" </c:if> value="1">是</option>
											</select>
											</div>
                                                            </div>
                                                              
                                                          
                                                            </div>
                                                            
                                                             <div class="col-md-6">
                                                                <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">指标: </label>
                                                               <div class="col-md-9">
                                                               
                                                               
                                                               <select  name="isMetric"   class="form-control">
												<option <c:if test="${metaField.isMetric == 0}"> selected="selected" </c:if> value="0">否</option>
												<option <c:if test="${metaField.isMetric == 1}"> selected="selected" </c:if> value="1">是</option>
											</select>
                                                               

											</div>
                                                            </div>
                                                              
                                                          
                                                            </div>
                                                            
                                                            </div>
                                                                           <div class="row">
                                                  
                                                              <div class="col-md-6">
                                                                <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">虚拟字段: </label>
                                                               <div class="col-md-9">
                                                            	<select  name="isVirtual"   class="form-control">
												<option <c:if test="${metaField.isVirtual == 0}"> selected="selected" </c:if> value="0">否</option>
												<option <c:if test="${metaField.isVirtual == 1}"> selected="selected" </c:if> value="1">是</option>
											</select>
											</div>
                                                            </div>
                                                              
                                                          
                                                            </div>
                                                            
                                                            
                                                            </div>
                                                                  
                                                              <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">描述: </label>
                                                               <div class="col-md-9">
                                                        <textarea 
											name="description" class="form-control" rows="5"  
											>${metaField.description }</textarea>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                              <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">字段来源: </label>
                                                               <div class="col-md-9">
                                                        <select id="sourceTables"  name="sourceTables" style="width:auto;"
	multiple="multiple" 	 class="form-control select2-multiple">



		<c:forEach items="${allMetaTables}" var="metaTable" varStatus="vaStatus">

				<option value="${metaTable.id }" <c:if test="${fn:contains(metaField.sourceTables, metaTable.id)}">selected="selected"</c:if> >${metaTable.name } (${metaTable.alias })</option>
		</c:forEach>
</select>
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

<script type="text/javascript">
$('#sourceTables').select2();

</script>       
    </body>
</html>