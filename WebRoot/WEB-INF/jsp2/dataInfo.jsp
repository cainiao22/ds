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
                                    <span>数据同步列表</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title"> 数据同步列表
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
										<input class="form-control input-inline input-medium" placeholder="请输入关键字" type="text"  id="alias"   value="${metaTableParam.alias }" />
										</div>
										      <div class="form-group">
										      		<label class=" control-label">负责人:</label>
					<input type="text" class="form-control input-inline input-medium"  placeholder="请输入负责人"    id="ownerd" >
					
					</div>
					     <div class="form-group">
					<button id="queryBtn" type="button" class="btn btn-info">搜索</button>
				<%--<a href="bizSourceMetaAdd">	<button id="addBtn" type="button" class="btn btn-success" >添加</button></a>--%>
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
              url: "queyrSynDataInfoRecord",
              //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
              //queryParamsType:'',   
              ////查询参数,每次调用是会带上这个参数，可自定义                         
              queryParams : function(params) {
                  return {
                        page: Math.floor(params.offset/params.limit)+1,
                        pageCount: params.limit,
                        alias:$('#alias').val(),
                        ownerd:$('#ownerd').val()
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
                      field: 'tableName',
                      title: '源表名',
                      align: 'center',
                      formatter:function(value,row,index){
                    	  return '<a href="dataInfoDetail?id='+row.id+'" target="_blank">'+value+'</a>';
                      }
                  },{
                      field: 'targetTableName',
                      title: '目标表名',
                      align: 'center'
                  },
                  {
                      field: 'alias',
                      title: '中文名',
                      align: 'center'
                  },
            	  {
                      field: 'createTime',
                      title: '创建时间',
                      align: 'center',
                      formatter:function(value,row,index){

                          return changeDateFormat(value);
                      }
                  }
                  ,
                  {
                      field: 'metaDataType',
                      title: '源数据库类型',
                      align: 'center'
                  },
                  {
                      field: 'metaConfigkey',
                      title: '源数据库',
                      align: 'center'
                  },
                  {
                      field: 'targetDataType',
                      title: '目标数据库类型',
                      align: 'center'
                  },
                  {
                      field: 'targetConfigkey',
                      title: '目标数据库',
                      align: 'center'
                  },
				{
                  field: 'ownerd',
                  title: '负责人',
                  align: 'center'
              }
              
              ],
              pagination:true
          });
    	   
    	      $('#queryBtn').click(function(){
    	    		   $('#t').bootstrapTable('removeAll');
    	    		   $('#t').bootstrapTable('refresh',{});
    	      });
    	      
       });
       //转换日期格式(时间戳转换为datetime格式)
       function changeDateFormat(cellval) {
           var dateVal = cellval + "";
           if (cellval != null) {
               var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
               var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
               var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

               var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
               var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
               var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

               return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
           }
       }
        </script>
    </body>
</html>