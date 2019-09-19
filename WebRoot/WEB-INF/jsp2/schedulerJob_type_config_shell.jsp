
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

                        <div id="job_type_config_shell"  class="job_type_config">
                            <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">Shell命令作业配置
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
                                                          <div class="col-md-9">
                                                          <div class="form-group">
                                                           <label class="col-md-2 control-label">Shell命令: </label>
                                                               <div class="col-md-10">
                                                         <textarea 
											id="shell_input" name="shell_input"  class="form-control" rows="5"  style="margin: 10px; width: 100%; height: 180px;"
											></textarea>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                          <%--   <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                       <button id="submitBtn" type="submit" class="btn btn-success">提交</button>

				<c:if test="${ !empty  metaTable}">
				<a href="metaTableDelete?id=${metaTable.id}">
					<button id="delBtn" type="button" class="btn btn-warning">删除</button></a>

				</c:if>
                                                                        </div>
                                                                    </div>
                                                             --%>
                                                        </div>
                                              
                                                </div>
                                                
                                            </div>      </form>
                                                    <!-- END FORM-->
                            </div>
                           
                        </div>
                 </div>