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
                                    <span>调度系统</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>作业列表</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title"> 作业列表
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                    
                                   
                                         <form class="form-horizontal">
                                         <div class="row">
                                             <div class="col-md-6">
                                           <div class=" form-group">
								<label class=" control-label col-md-2">关键字:</label>
								   <div class=" col-md-10">
										<input class="form-control input-inline input-medium" placeholder="请输入关键字" type="text"  name="keyword" id="keyword"    />
										</div>
										</div>
										</div>
                                                      <div class=" col-md-6">
                                             <!-- <div class=" form-group">
					<label class=" control-label  col-md-2">状态：</label>	
					     <div class=" col-md-10">
				<select id="status" name="status" class="form-control   input-small">
					<option value=''>全部</option>
					<option value='301'>Ready</option>
					<option value='302'>Pending</option>
					<option value='300'>Running</option>
					<option value='200'>Success</option>
					<option value='500'>Failed</option>

										</select>
										</div>
										</div> -->
										</div>
                                                    </div>
                                                      <div class="row">
                                         <div class=" col-md-6">
                                             <div class=" form-group">
										      		<label class=" control-label col-md-2">类型:</label>
										      		   <div class=" col-md-10">
                                                           <select id="type" name="type" class="form-control   input-small">
                                                               <option value=''>全部
                                                               </option>
                                                               <c:forEach items="${schdJobTypes}" var="schdJobType">

                                                                   <option value='${schdJobType.name}'
                                                                           <c:if test="${jobParam.jobType eq schdJobType.name }"> selected=selected </c:if>>
                                                                           ${ schdJobType.name}</option>
                                                               </c:forEach>
                                                           </select>
					
					</div>
					</div>
					</div> 
					  <div class=" col-md-6">
										      <div class=" form-group">
										      
										      		<label class=" control-label col-md-2">负责人:</label>
										      		<div class=" col-md-10">
					<input type="text" class="form-control input-inline input-medium"  placeholder="请输入负责人"   name="author"  id="author" >
					</div>
					</div>
					</div>
                                     
										</div>
										    
					   <div class="row">
                                         <div class="col-md-offset-4 col-md-6">
                                          <div class=" form-group">
					<button id="queryBtn" type="button" class="btn btn-info">搜索</button>
		 </div>
						</div>
						</div>
				</div>
			</form> 
                                       
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-light" id="t">
                                              
                                            </table>
                                            
                                            </div>
                                            
                                            <div>
                                          
                                        </div>
                                    </div>
                                </div>
                                <!-- END SAMPLE TABLE PORTLET-->
                            </div>
                           
                        </div>
                   
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
                <!-- END CONTENT -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <h4 class="modal-title" id="myModalLabel">执行任务</h4>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="jobId" />
                            <div class="form-group">
                                <label for="txt_scheduleTime">执行时间</label>
                                <input type="text" name="scheduleTime" class="form-control" id="txt_scheduleTime" placeholder="输入执行时间">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                            <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTAINER -->
      <c:import url="common/footer.jsp"></c:import>
        </div>
       <c:import url="common/global_js.jsp"></c:import>
       <script type="text/javascript">
       Date.prototype.format = function (format) {
           var args = {
               "M+": this.getMonth() + 1,
               "d+": this.getDate(),
               "h+": this.getHours(),
               "m+": this.getMinutes(),
               "s+": this.getSeconds(),
               "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
               "S": this.getMilliseconds()
           };
           if (/(y+)/.test(format))
               format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
           for (var i in args) {
               var n = args[i];
               if (new RegExp("(" + i + ")").test(format))
                   format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n : ("00" + n).substr(("" + n).length));
           }
           return format;
       };
       function showDagGraph(jobId){
           window.open("schedulerGraph?jobId=" + jobId);
       }
       function submitJob(jobId) {
           $("#jobId").val(jobId);
           $("#txt_scheduleTime").val(new Date().format("yyyy-MM-dd hh:mm:ss"));
           $("#myModal").modal('show');
       }
       $(function(){
    	   $('#t').bootstrapTable({
               //请求方法
              method: 'get',
               //是否显示行间隔色
              striped: true,
              //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）     
              cache: false,    
              //是否显示分页（*）  
              pagination: true,   
               //是否启用排序  
              sortable: false,    
               //排序方式 
              //初始化加载第一页，默认第一页
              //我设置了这一项，但是貌似没起作用，而且我这默认是0,- -
              //pageNumber:1,   
              //每页的记录行数（*）   
              pageSize: 10,  
              //可供选择的每页的行数（*）    
              pageList: [10, 25, 50, 100],
              //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据  
              url: "schedulerJobListData",
              //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
              //queryParamsType:'',   
              ////查询参数,每次调用是会带上这个参数，可自定义                         
              queryParams : function(params) {
                  return {
                        page: Math.floor(params.offset/params.limit)+1,
                        pageCount: params.limit,
                        keyword:$('#keyword').val(),
                        author:$('#author').val(),
                        jobType:$('#type').val(),
                      };
              },
              //分页方式：client客户端分页，server服务端分页（*）
              sidePagination: "server",
              //是否显示搜索
              search: false,  
              //Enable the strict search.    
              strictSearch: true,
              //Indicate which field is an identity field.
              idField : "jobId",
              columns: [
            	  {
                      field: 'jobId',
                      title: '作业ID',
                      align: 'center',
                      formatter:function(value,row,index){
                    	  return '<a href="schedulerJobDetail?jobId='+row.jobId+'" >'+value+'</a>';
                      }
                  },
            	  {
                      field: 'jobName',
                      title: '作业名',
                      align: 'center',
                      formatter:function(value,row,index){
                    	  return '<a href="schedulerJobDetail?jobId='+row.jobId+'">'+value+'</a>';
                      }
                  },
                  {
                      field: 'jobType',
                      title: '作业类型',
                      align: 'center'
                  },
                  /*{
                      field: 'jobDesc',
                      title: '作业描述',
                      align: 'center'
                  },*/
                  {
                      field: 'jobCron',
                      title: '调度时间表达式',
                      align: 'center'
                  },
            	  {
                      field: 'author',
                      title: '负责人',
                      align: 'center'
                  },
            	    {
                  title: '状态',
                  field: 'latestExecuteStatus',
                  align: 'center',
                  formatter:function(value,row,index){
                	  return '<span class="label label-'+labelStyleConfig[value]+'">'+value+'</span>';
                  }
              },
              {
                  title: '更新时间',
                  field: 'updateTime',
                  align: 'center',
                  formatter:
                  function(value,row, index) {
                	  return new Date(value).format("yyyy-MM-dd hh:mm:ss");
                	  }
               
              },
              {
                  title: '操作列表',
                  field: 'jobId',
                  align: 'center',
                  formatter:
                      function(value,row, index) {
                          return '<a href="javascript:void(0)" onclick="submitJob(' + value + ')">立即执行</a><br/>'
                                + '<a href="javascript:void(0)"  onclick="showDagGraph(' + value + ')" >调度结构</a><br/>'
                              + '<a href="./schedulerJobLogList?jobId=' + value + '">查看日志</a>';
                      }

              }
              
              ],
              pagination:true
          });
    	   
    	      $('#queryBtn').click(function(){
    	    	   $('#t').bootstrapTable('removeAll');
	    		   $('#t').bootstrapTable('refresh',{});
    	      });

    	      $('#btn_submit').click(function () {
    	          var jobId = $("#jobId").val();
    	          var scheduleTime = $("#txt_scheduleTime").val();
                    $.ajax({
                        url:"http://xxl-job-admin.bigdata.qdingnet.com/xxl-job-admin/jobinfo/trigger",
                        type: "GET",
                        data: {'id':jobId, 'scheduleTime':scheduleTime},
                        dataType: "jsonp", //指定服务器返回的数据类型
                        jsonp: "callback",
                        success: function (data) {
                              if(data.code == 200){
                                  swal("提示!", "请选择作业类型！", "success");
                              }else {

                              }
                        }
                    })
              });
       });
       </script>
    </body>
</html>