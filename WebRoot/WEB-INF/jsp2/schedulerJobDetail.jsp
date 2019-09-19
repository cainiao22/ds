
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
<link
	href="./assets/global/plugins/jqcron/jqCron.css"
	rel="stylesheet" type="text/css" />
	<style type="text/css">
	.job_type_config { 
	 display: none; 
	}
	</style>
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
                                    <span>调度系统</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>作业配置</span>
                                </li>
                            </ul>
                             <c:import url="common/metaTableRightBar.jsp"></c:import>
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">基本信息
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                                                    <form class="form-horizontal" 
								id="form1">
							<input
									type="hidden" name="jobId" id="jobId" value="${job.jobId }" />
                        <div class="portlet light bordered">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                        
                                                          <div class="row"><div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">类型: </label>
                                                               <div class="col-md-9">
                                                     <select id="jobType" name="jobType" class="form-control   input-small">
                                                               <option value=''>请选择
                                                               </option>
                                                               <c:forEach items="${schdJobTypes}" var="schdJobType">

                                                                   <option value='${schdJobType.handler}'
                                                                           <c:if test="${job.executorHandler eq schdJobType.handler }"> selected=selected </c:if>>${ schdJobType.name}</option>
                                                               </c:forEach>
                                                           </select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">作业名: </label>
                                                               <div class="col-md-9">
                                                        	 <input type="text" name="jobName" id="jobName"
														class="form-control" value="${job.jobName }"/>
											</div>
                                                            </div>
                                                            </div>
                                                              <div class="col-md-6">
                                                             <div class="form-group">
                                                         
                                                           <label class="col-md-3 control-label">负责人: </label>
                                                               <div class="col-md-9">
                                                              <input type="text"
											id="author" class="form-control"
											value="${job.author }"/>
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
											id="jobDesc" class="form-control" rows="5" cols="16" style="margin: 0px; width: 571px; height: 59px;">
${job.jobDesc }</textarea>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                        
                                                        </div>
                                              
                                                </div>
                                                
                                            </div>      </form>
                                                    <!-- END FORM-->
                            </div>
                           
                        </div>
                        
                     <c:import url="schedulerJob_type_config_dataintegration .jsp"></c:import>
                     <c:import url="schedulerJob_type_config_shell.jsp"></c:import>
                     <c:import url="schedulerJob_type_config_dwsql.jsp"></c:import>
                        
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">调度管理
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                                    <form class="form-horizontal"  
						>
						 
                        <div class="portlet light bordered">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                        
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">调度开关: </label>
                                                               <div class="col-md-9">
                                                     <select id="schdStatus" name="schdStatus" class="form-control   input-small">
                                                               <option value='1' <c:if test="${job.schdStatus eq 1}"> selected="selected" </c:if>>开
                                                               </option>
                                                               <option value='0' <c:if test="${job.schdStatus eq 0}"> selected="selected" </c:if>>关
                                                               </option>
                                                           </select>
											</div>
                                                            </div>
                                                            </div>
                                                           
                                                            </div>
                                                          <div class="row">
                                                          <div class="col-md-6">
                                                          <div class="form-group">
                                                           <label class="col-md-3 control-label">Cron表达式: </label>
                                                           <div class="col-md-9">
                                                        	 <input type="text" name="jobCron" id="jobCron" readonly="readonly"
														class="form-control" value="${job.jobCron }"/>
											</div>
                                                            </div>
                                                            </div>
                                                           
                                                            </div>
                                                         
                                                                      
                                             
                                                                    </div>
                                              
                                                </div>
                                                
                                            </div>      </form>
                                                    <!-- END FORM-->
                            </div>
                           
                        </div>
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">作业依赖
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                                    <form class="form-horizontal"  >
						
                        <div class="portlet light bordered">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                        
                                                          <div class="row">
                                                          <div class="col-md-10">
                                              <div class="form-group">
                                                           <label class="col-md-3 control-label">上游依赖: ${dependencyJobIds }</label>
                                                               <div class="col-md-9"  >
                                                        <select class="form-control select2"  id="dependency_jobs" multiple="multiple" >
                                                        <c:forEach items="${allJobs}" var="curJob">
                                                        <c:if test="${( empty job.jobId) or (curJob.jobId ne  job.jobId) }">
                                                       <option value="1_${curJob.jobId }" 
                                                            <c:if test="${(! empty dependencyJobIds)  and  (dependencyJobIds.contains('1_'.concat(curJob.jobId))) }">
                                                          selected='selected'
                                                            </c:if>
                                                              >${curJob.jobId }:${curJob.jobName }</option>
                                                       </c:if>
                                                       </c:forEach>
                                                        </select>
											</div>
                                                            </div>
                                                            </div>
                                                           
                                                            </div>
                                                         
                                                                      
                                                            
                                              
                                                
                                                             
                                                        </div>
                                              
                                                </div>
                                                
                                            </div>      </form>
                                                    <!-- END FORM-->
                            </div>
                           
                        </div>
                   
                   
                   
                       <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                       <button id="submitBtn" type="submit" class="btn btn-success">提交</button>

				<c:if test="${ !empty  job}">
					<button id="delBtn" type="button" class="btn btn-warning">删除</button>

				</c:if>
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
 <!--       <script src="./assets/global/plugins/jquery-cron-quartz-master/jquery-cron-quartz.js"
	type="text/javascript"></script> -->
 <script src="./assets/global/plugins/jqcron/jqCron.js"
	type="text/javascript"></script>
 <script src="./assets/global/plugins/jqcron/jqCron.cn.js"
	type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	 $('.select2').select2( {
	 }
	 );
    $('#jobCron').jqCron(
    		
    { lang: 'cn'});

   
	     
});
</script>

 <link href="./assets/global/plugins/codemirror/lib/codemirror.css" rel="stylesheet" type="text/css" />
<script src="./assets/global/plugins/codemirror/lib/codemirror.js" type="text/javascript"></script>
        <script src="./assets/global/plugins/codemirror/mode/sql/sql.js" type="text/javascript"></script>
        <script src="./assets/global/plugins/codemirror/mode/shell/shell.js" type="text/javascript"></script>
<link rel="stylesheet" href="./assets/global/plugins/codemirror/addon/hint/show-hint.css" />
<script src="./assets/global/plugins/codemirror/addon/hint/show-hint.js"></script>
<script src="./assets/global/plugins/codemirror/addon/hint/sql-hint.js"></script>
<script type="text/javascript">
	
		
		

$(function(){
	  window.shell_editor = CodeMirror.fromTextArea(document.getElementById('shell_input'), {
		    mode:  'shell',
		    indentWithTabs: true,
		    smartIndent: true,
		    lineNumbers: true,
		    matchBrackets : true,
		    autofocus: true,
		    extraKeys: {"Alt": "autocomplete"}
		
		  });
	  
	 //  var mime =;
	  window.sql_editor = CodeMirror.fromTextArea(document.getElementById('sql'), {
	    mode:  'text/x-pgsql',
 
	    indentWithTabs: true,
	    smartIndent: true,
	    lineNumbers: true,
	    matchBrackets : true,
	    autofocus: true,
	    extraKeys: {"Alt": "autocomplete"}
	
	  });
	  window.hint_tables={};
	  $.post('dataApiQuery/getDWMeta',{},function(res){
		if(res.code==0){
			for(var i=0;i<	res.data.length;i++){
			var table_name=	res.data[i].type+'.'+res.data[i].table_name;
				if (typeof(hint_tables[table_name]) == "undefined") { 
					hint_tables[table_name]=[];
				}
				hint_tables[table_name].push(res.data[i].field_name);
			}
		}
		window.sql_editor.setOption("hintOptions",{
				tables: hint_tables
				
		}
		);
	  }
	);
	 

	
	 //切换作业类型begin
	 $('#jobType').change(function(){
		 var sel=$(this).val();
		 if(sel=='DataIntegerationJobHandler'){ $('.job_type_config').hide();$('#job_type_config_dataintegration').show()}
		 else if(sel=='DWSqlJobHandler'){
			 $('.job_type_config').hide();
			 $('#job_type_config_dwsql').show()}
		 else if(sel=='ShellJobHandler'){ $('.job_type_config').hide();$('#job_type_config_shell').show()}
	 }).change();
	 //切换作业类型end
	
	 
	 function  checkInput(){
		if($('#jobType').val()==''){
		   swal("提示!", "请选择作业类型！", "warning");  
		   return false;
		 }
	
		if($('#jobName').val().length<1||$('#jobName').val().length>50){
		   swal("提示!", "请输入长度50以内的作业名！", "warning");  
		   return false;
		 }
		if($('#author').val()==''){
			   swal("提示!", "请输入负责人！", "warning");  
			   return false;
			 }
		   return true;
	 }
	    $('#submitBtn').click(function(){
	    	if(!checkInput()){
	    		return false;
	    	}
	    	var dependency_jobs_sel=$("#dependency_jobs").select2("data");
			var dependencyIds='';
			for(var i=0;i<dependency_jobs_sel.length;i++){
				dependencyIds=dependencyIds+dependency_jobs_sel[i].id+",";
			}
	    	var param={};
	    	var cronCofig={};
	     	param.dtOffset='-1';
	     	var selJobHandler=$('#jobType').val();
	     	if(selJobHandler=='DWSqlJobHandler'){
	    	param.sql=window.sql_editor.getValue();
	     	}else if(selJobHandler=='ShellJobHandler'){
		    	param.shell=window.shell_editor.getValue();

	     	}
	     	else if(selJobHandler=='DataIntegerationJobHandler'){
		    	param.db_id=$('#di_sourcedb').val();
		    	param.sql=$('#di_sql').val();
		    	param.target_tableId=$('#di_targetTable').val();
		    	param.delTargetTable=$('#delTargetTable').val();

	     	}
	    	cronCofig.period=$('.jqCron-selector-title:first').text();

	   
    		   $.post('saveSchedulerJob',{
    			  jobId:$('#jobId').val(),
    			  jobCron:$('#jobCron').val(),
    			  jobDesc:$('#jobDesc').val(),
    			  author:$('#author').val(),
    			  jobName:$('#jobName').val(),
    			  jobType:$('#jobType').find("option:selected").text(),
    			  schdStatus:$('#schdStatus').val(),
    			  schdPeriod:cronCofig.period,
    			  executorHandler:$('#jobType').val(),
    			  executorParam:JSON.stringify(param),
    			  cronCofig:(JSON.stringify(cronCofig)),
    			  dependency: dependencyIds  			   
    		   },function(data){
    			   if(data.code==0){
    					  swal("提示",data.errorMsg, "success");  
    					window.location.href='./schedulerJobList';
    			   }
    				  swal("提示",data.errorMsg, "warning");  
    		   });
    		   
});
});
</script>
		<c:if test="${ !empty  job}">
  <script type="text/javascript">
                 $(function(){
                 $.post('getJobParam',{jobId:'${job.jobId}'},
                	 
                 function(data){
                	   <c:if test="${job.executorHandler eq 'DWSqlJobHandler' }">
                	 window.sql_editor.setOption('value',String(data.sql));
                	 </c:if>
                	   <c:if test="${job.executorHandler eq 'ShellJobHandler'}">
                	 window.shell_editor.setOption('value',String(data.shell));
                	 </c:if>
                	 <c:if test="${job.executorHandler eq 'DataIntegerationJobHandler'}">
                 $('#di_sql').val(String(data.sql));
                 $('#di_sourcedb').select2().val(String(data.db_id)).change();
                 $('#di_targetTable').select2().val(String(data.target_tableId)).change();
                 $('#delTargetTable').val(String(data.delTargetTable)).change();
                	 </c:if>
                	 
                 },'json');
           

		 $('#delBtn').click(function(){
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
              	   $.post('delSchedulerJob',{
          			   jobId:'${job.jobId}'
          			   
          		   },function(data){
          			   swal("提示!", "删除成功.", "success");  
                         window.location.href='./schedulerJobList';
          		   });
                     
                     
                 }
             });  
  		   
  		   
  	   });
});
</script>
</c:if>
    </body>
</html>