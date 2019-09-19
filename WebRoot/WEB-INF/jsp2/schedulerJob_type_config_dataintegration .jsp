
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

                        <div id="job_type_config_dataintegration"  class="job_type_config">
                            <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">数据集成作业配置
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" 
								id="form2">
						
                        <div class="portlet light bordered">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                        
                                                          
                                                            
                                                              <div class="row">
                                                          <div class="col-md-12">
                                                          <div class="form-group">
                                                           <label class="col-md-2 control-label ">数据源: </label>
                                                               <div class="col-md-9">
                                                                   <select id="di_sourcedb"   class="form-control select2 " style="width:100%;" >
                                                                       <option value ="">请选择</option>
                                                                       <c:forEach items="${dbConfigList}" var="item">
                                                                           <option value ="${item.id}">${item.configKey}</option>
                                                                       </c:forEach>
                                                                   </select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                                     <div class="row">
                                                          <div class="col-md-12">
                                                          <div class="form-group">
                                                           <label class="col-md-2 control-label">数据获取SQL: </label>
                                                               <div class="col-md-9">
                                                         <textarea 
											id="di_sql"    class="form-control" rows="5" cols="100" style="margin: 10px; width: 100%; height: 180px;"
											></textarea>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                     
<div class="row">
                                                          <div class="col-md-12">
                                                          <div class="form-group">
                                                           <label class="col-md-2 control-label ">目标表: </label>
                                                               <div class="col-md-9">
                                                         <select id="di_targetTable" 	 class="form-control select2"  style="width:100%;" >
  <option value ="">请选择</option>


		<c:forEach items="${allMetaTables}" var="metaTable" varStatus="vaStatus">

				<option value="${metaTable.id }">${metaTable.type }.${metaTable.name } (${metaTable.alias })</option>
		</c:forEach>
</select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                          <div class="form-group">
                                                           <label class="col-md-2 control-label ">清空目标表: </label>
                                                               <div class="col-md-9">
                                                                <select id="delTargetTable" 	 class="form-control"  style="width:100%;" >
  <option value ="1">是</option>
  <option value ="0">否</option>
  
  </select>
                                                               </div></div>
                                                            </div>
                                                            </div>

                                                        </div>
                                              
                                                </div>
                                                
                                            </div>      </form>
                                                    <!-- END FORM-->
                            </div>
                           
                        </div>
                 </div>