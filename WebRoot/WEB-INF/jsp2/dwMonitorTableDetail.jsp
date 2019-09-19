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
                                    <span>监控中心</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>数仓监控</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title"> ${metaTable.type }.${metaTable.name}(${metaTable.alias}) ${metaTable.owner}
                            <small><a href="metaTableMonitorList?id=${metaTable.id}">查看预警规则</a></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                    
                                   
                                         <div class="row">
                                         <div class="col-md-12">
                           <div class="form-group last">
                                                                        <label class="control-label">表描述:</label>
                                                                        <p class="form-control-static">${metaTable.description } </p>
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
              
            </div>
            <!-- END CONTAINER -->
      <c:import url="common/footer.jsp"></c:import>
        </div>
       <c:import url="common/global_js.jsp"></c:import>
       <script type="text/javascript">
       
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
              url: "getMonitorJobStatusList",
              //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
              //queryParamsType:'',   
              ////查询参数,每次调用是会带上这个参数，可自定义                         
              queryParams : function(params) {
                  return {
                        page: Math.floor(params.offset/params.limit)+1,
                        pageCount: params.limit,
                        metaTableId:'${metaTable.id}'
                      };
              },
              //分页方式：client客户端分页，server服务端分页（*）
              sidePagination: "server",
              //是否显示搜索
              search: false,  
              //Enable the strict search.    
              strictSearch: true,
              //Indicate which field is an identity field.
              idField : "id",
              columns: [
            	  {
                      field: 'scheduleTime',
                      title: '监控时间',
                      align: 'center',
                  },
                 
                  {
                      field: 'monitorName',
                      title: '规则',
                      align: 'center'
                  },
                  {
                      field: 'sql',
                      title: '校验SQL',
                      align: 'center',
                      width:150
                  },
                  {
                      field: 'dataDate',
                      title: '数据日期',
                      align: 'center'
                  } ,
				 
            	    {
                  title: '状态',
                  field: 'currentStatus',
                  align: 'center',
                  formatter:function(value,row,index){
                	  return '<span class="label label-'+labelStyleConfig[value]+'">'+value+'</span>';
                  }
              },
              {
                  title: '更新时间',
                  field: 'updateTime',
                  align: 'center',
                  formatter:function(value,row, index) {
                	  return new Date(value).format("yyyy-MM-dd hh:mm:ss");
                	  }
               
              }
              , {
                  field: 'id',
                  title: '日志',
                  align: 'center',
                  formatter:function(value,row,index){
                	  return '<a href="javascript:void(0);" name="loglink"  id="'+value+'">日志</a>';
                  }
     
                  
              },
              ],
              onClickCell:function(field, value, row, obj){
            	  if(field=='id'){
            		  $('#myModal').modal();
            			$('#showEtljobExecuteLogDiv').html("加载中...");
            			var s="";
            			$.post('./getMonitorExecuteLogByQueueId',{monitorQueueId:value},function(data){
            				$('#showEtljobExecuteLogDiv').empty();
            				$.each(data, function(i, v) {
            					s+="<p class='alert alert-success'>"+v.createTime+":"+v.monitorLog+"</p>";
            					});
            				$('#showEtljobExecuteLogDiv').append(s);
            			});
            		  }
              },
              pagination:true
          });
    	   
    	      $('#queryBtn').click(function(){
    	    		   $('#t').bootstrapTable('refresh',{});
    	      });
    	      
    	      
       });
       
 
       </script>
       
       <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					日志
				</h4>
			</div>
			<div class="modal-body" ID="showEtljobExecuteLogDiv">
				加载中...
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
    </body>
</html>