<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--<![endif]-->
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
                                    <span>作业日志列表</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title"> 作业日志列表
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
								<label class=" control-label col-md-2">jobId:</label>
								   <div class=" col-md-10">
										<input class="form-control input-inline input-medium" placeholder="请输入作业id" type="text"  name="jobId" id="jobId" value="${param.jobId}"/>
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
										      		<label class=" control-label col-md-2">作业状态:</label>
										      		   <div class=" col-md-10">
                                                           <select id="status" name="status" value="${param.status}" class="form-control input-small">
                                                               <option value='0'>全部</option>
                                                               <option value='1'>成功</option>
                                                               <option value='2'>失败</option>
                                                               <option value='3'>进行中</option>
                                                           </select>
					
					</div>
					</div>
					</div> 
					  <div class=" col-md-6">
										      <div class=" form-group">
										      
										      		<label class=" control-label col-md-2">调度时间:</label>
										      		<div class=" col-md-10">
					<input type="text" class="form-control input-inline input-medium"  placeholder="请输入开始时间" value="${param.queryStartTime}"  name="queryStartTime"  id="queryStartTime" > -
                    <input type="text" class="form-control input-inline input-medium"  placeholder="请输入结束时间"  value="${param.queryEndTime}"  name="queryEndTime"  id="queryEndTime" >
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
                                <h4 class="modal-title" id="myModalLabel"></h4>
                            </div>
                            <div id="contentBody" class="modal-body">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                                <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认</button>--%>
                            </div>
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
              url: "schedulerJobLogPageList",
              //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
              //queryParamsType:'',   
              ////查询参数,每次调用是会带上这个参数，可自定义                         
              queryParams : function(params) {
                  return {
                        page: Math.floor(params.offset/params.limit)+1,
                        pageCount: params.limit,
                        jobId:$('#jobId').val(),
                        status:$('#status').val(),
                        queryStartTime:$('#queryStartTime').val(),
                        queryEndTime:$('#queryEndTime').val()
                      };
              },
              //分页方式：client客户端分页，server服务端分页（*）
              sidePagination: "server",
              //是否显示搜索
              search: false,  
              //Enable the strict search.    
              strictSearch: true,
              //Indicate which field is an identity field.
              idField : "",
              columns: [
            	
            	  {
                      field: 'jobId',
                      title: 'jobId',
                      align: 'center',
                      formatter:function(value,row, index){
                          return '<a href="schedulerJobDetail?jobId='+value+'">'+value+'</a>';
                      }
                  },
                  {
                      field: 'triggerTime',
                      title: '调度时间',
                      align: 'center',
                      formatter:
                          function(value,row, index) {
                              return new Date(value).format("yyyy-MM-dd hh:mm:ss");
                          }
                  },
                
            
            	  {
                      field: 'triggerCode',
                      title: '调度结果',
                      align: 'center',
                      formatter:function(value,row,index){
                          if(value == 200){
                              return '<font color="green">成功</font>';
                          }else{
                              return '<font color="red">失败</font>';
                          }
                      }
                  },
            	    {
                  title: '调度备注',
                  field: 'executorParam',
                  align: 'center',
                  formatter:function(value,row,index){
                      if(value != null && value != ''){
                          return '<a href="#" data="' + encodeURI(value) +'" onclick="showDetail(this)">查看</a>';
                      }else{
                          return '';
                      }
                  }
              },
              {
                  title: '执行时间',
                  field: 'handleTime',
                  align: 'center',
                  formatter:
                      function(value,row, index) {
                          return new Date(value).format("yyyy-MM-dd hh:mm:ss");
                      }
               
              },
                  {
                      title: '执行结果',
                      field: 'handleCode',
                      align: 'center',
                     formatter:function(value,row,index) {
                         if(value == 200){
                             return '<font color="green">成功</font>';
                         }else if(value == 300){
                             return '<font color="blue">正在运行</font>';
                         } else if(value == 301){
                             return '<font color="blue">准备就绪</font>';
                         }else if(value == 302){
                             return '<font color="yellow">正在等待</font>';
                         }else if(value == 0){
                             if(row.triggerCode == 200){
                                 return '<font color="blue">正在运行</font>';
                             }else{
                                 return '<font color="red">失败</font>';
                             }
                         } else{
                             return '<font color="red">失败</font>';
                         }
                     }
                  },
                  {
                      title: '执行备注',
                      field: 'handleMsg',
                      align: 'center',
                      formatter:function (value,row,index) {
                          if(value != null && value != ''){
                            return '<a href="#" data="' + encodeURI(value) +'" onclick="showDetail(this)">查看</a>';
                          }else{
                              return '';
                          }
                      }

                  },
                  {
                      title: ' 操作 ',
                      field: 'id',
                      align: 'center',
                      formatter:
                          function(value,row, index) {
                              return '<a href="javascript:void(0)" onclick="showTriggerHistory(' + value +  ')">查看详情</a>';
                          }

                  }
              
              ],
              pagination:true
          });
    	   
    	      $('#queryBtn').click(function(){
    	    	   $('#t').bootstrapTable('removeAll');
	    		   $('#t').bootstrapTable('refresh',{});
    	      });
    	      
       });

       function showDetail(elem) {
           $("#contentBody").html('');
           $("#contentBody").html(decodeURI($(elem).attr("data")));
           $("#myModal").modal('show');
       }

       function showTriggerHistory(jobLogId) {
           $.ajax({
               url:"getLogDetail",
               type: "GET",
               data: {'jobLogId':jobLogId},
               dataType: "json", //指定服务器返回的数据类型
               success: function (data) {
                   if(data.code == 0){
                       var msg = "";
                       var list = data.data;
                       for(var index in list){
                           msg += new Date(list[index].createTime).format("yyyy-MM-dd hh:mm:ss");
                           msg += "&nbsp&nbsp";
                           msg += list[index].handleMsg;
                           msg += "<br/>"
                       }
                       $("#contentBody").html('');
                       $("#contentBody").html(msg);
                       $("#myModal").modal('show');

                   }else {
                       $("#contentBody").html(data.errorMsg);
                       $("#myModal").modal('show');
                   }
               }
           })
       }
       </script>
    </body>
</html>