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
                        <h1 class="page-title"> 数据接口列表
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                    
                                      <form action="#" method="get"  class="form-inline">
										      <div class="form-group">
								<label class=" control-label">关键字:</label>
										<input class="form-control input-inline input-medium" placeholder="请输入关键字" type="text"  id="keyword"   value="${metaTableParam.keyword }" />
										</div>
                                          <form action="#" method="get"  class="form-inline">
                                              <div class="form-group">
                                          <label class=" control-label">项目名称:</label>
                                          <input class="form-control input-inline input-medium" placeholder="请输入项目名称" type="text"  id="projectName"   value="${metaTableParam.projectName }" />
                                    </div>
										      <div class="form-group">
										      		<label class=" control-label">负责人:</label>
					<input type="text" class="form-control input-inline input-medium"  placeholder="请输入负责人"    id="owner" >
					
					</div>
					     <div class="form-group">
					<button id="queryBtn" type="button" class="btn btn-info">搜索</button>
				<a href="./dataApiDetail">	<button id="addBtn" type="button" class="btn btn-success" >添加</button></a>
						</div>
							</form>
				</div>
                                       
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
    	      TableObj.onTableInit();
    	      $('#queryBtn').click(function(){
    	    		   $('#t').bootstrapTable('destroy');
    	    		   TableObj.onTableInit();
    	    		   //$('#t').bootstrapTable('refresh',{});
    	      });
    	      
       });

       var TableObj = {
           onTableInit:function () {
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
                   url: "dataApiList",
                   //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
                   //queryParamsType:'',
                   ////查询参数,每次调用是会带上这个参数，可自定义
                   queryParams : function(params) {
                       return {
                           page: Math.floor(params.offset/params.limit)+1,
                           pageCount: params.limit,
                           projectName:$('#projectName').val(),
                           owner:$('#owner').val(),
                           keyword:$('#keyword').val()
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
                           field: 'name',
                           title: '接口标识',
                           align: 'center',
                           formatter:function(value,row,index){
                               return '<a href="dataApiDetail?commonDataSummaryId='+row.commonDataSummaryId+'">'+value+'</a>';
                           }
                       },
                       {
                           field: 'alias',
                           title: '接口名称',
                           align: 'center'
                       },
                       {
                           field: 'dataSource',
                           title: '数据源类型',
                           align: 'center'
                       },
                       {
                           field: 'projectName',
                           title: '项目名称',
                           align: 'center'
                       },
                       {
                           field: 'owner',
                           title: '负责人',
                           align: 'center'
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
                           field: 'Api',
                           title: '接口调用',
                           align: 'center',
                           formatter:function(value,row,index){
                               return '<a target="_blank" href="./dataApiQuery/'+row.name+'">dataApiQuery/'+row.name+'</a>';
                           }
                       },
                       {
                           field: 'cleanCache',
                           title: '操作',
                           width:'100',
                           align: 'center',
                           formatter:function(value,row,index){
                               var username = Cookies.get("username");
                               if(username!="admin"){
                                   return '<a target="_blank" href="./dataApiCleanCache/'+row.name+'">清除缓存</a>';
                               }else{
                                   return '<a target="_blank" href="./dataApiCleanCache/'+row.name+'">清除缓存</a>'
                                       + '<br/><a href="javascript:void(0);" onclick="syncData(\'' + row.name +'\')"  id="'+value+'">同步数据</a>';
                               }

                           }
                       }

                   ],
                   pagination:true
               });

           }
       }
       function syncData(name) {
           swal({
                   title: "确认吗?",
                   text: "确认同步吗？该操作不可逆。",
                   type: "warning",
                   showCancelButton: true,
                   confirmButtonText: "确认!",
                   cancelButtonText: "取消",
                   closeOnConfirm: true,
                   closeOnCancel: true },
                    function () {
                        setTimeout(function () {
                        $.post('syncDataInf',{
                            name:name
                        },function(data){
                            if(data.code==0){
                                swal("提示",data.errorMsg, "success");
                            }
                            else if(data.code==5){
                                swal({
                                        title: "确认吗?",
                                        text: data.errorMsg+"确认同步吗？该操作不可逆。",
                                        type: "warning",
                                        showCancelButton: true,
                                        confirmButtonText: "确认!",
                                        cancelButtonText: "取消",
                                        closeOnConfirm: true,
                                        closeOnCancel: true },
                                    function () {
                                        setTimeout(function () {
                                        $.post('syncDataInfUpdate',{
                                            name:name
                                        },function(data){
                                            if(data.code==0){
                                                swal("提示",data.errorMsg, "success");
                                            }else{
                                                swal("提示",data.errorMsg, "warning");
                                            }
                                        })},1000)
                                    })
                            }
                            else{
                            swal("提示",data.errorMsg, "warning");
                            }
                        })},1000)
                    })
       }
       </script>
    </body>
</html>