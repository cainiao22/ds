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
                                    <span> 监控中心</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>数仓SQL运行状态</span>
                                </li>
                            </ul>
                       
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title"> 数仓SQL运行状态
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                    
                          当前正在执行的SQL：<span class="label label-success">查询中...</span>
                                       
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-light">
                                                <thead>
                                             	<tr>
							<th width="10%">会话ID</th>
							<th width="10%">用户名</th>
							<th width="10%">数据库</th>
							<th width="10%">clientIP</th>
							<th width="15%">开始查询时间</th>
							<th>SQL</th>
							<th width="10%">耗时</th>
							<th width="10%">操作</th>
		
						</tr>
                                                </thead>
                                                <tbody id="data">
                                                	
                                                </tbody>
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
    	   var du=5;
    	   window.du=du;
    	   function run (){
    		 
    	   $.post('./dataApiQuery/dwQueryMonitor',{},function(res){
    		   $('#data').empty();
    		   $('.portlet-title span').text('查询完成,等待再次查询.');
    		 if(res.data.length<1){
    			 $('.portlet-title span').text('当前没有SQL执行,等待再次查询.');
    			 return;
    		 }
    		 for(var i=0;i<res.data.length;i++){
    			 var row=res.data[i];
    			 var s=row['time_used']['seconds'].toFixed(2);
    			 if(s<0){continue;}
    			 time_used=s+'秒';
    			 var m=row['time_used']['minutes'];
    			 if(m>0){
    				 time_used=m+'分'+time_used;
    			 }
    			
    			 var h=row['time_used']['hours'];
    			 if(h>0){
    				 time_used=h+'小时'+time_used;
    			 }
    			 var time_used_class='label label-success';
    			 if((Number(s)+Number(m*60)+Number(h*3600))>45){
    				 time_used_class='label label-warning';
    					 
    			 }else	 if((Number(s)+Number(m*60)+Number(h*3600))>300){
        				 time_used_class='label label-error';
        					 
        			 }
    			 $('#data').append('<tr><td>'+row.procpid+'</td><td>'+row.usename+'</td><td>'+row.datname+'</td><td>'+row.client_addr.value+'</td><td>'+row.query_start+'</td><td>'+row.current_query+'</td><td><span class="'+time_used_class+'">'+time_used+'</span></td><td><button class="btn btn-danger" name="pg_cancel_backend"  procpid="'+row.procpid+'">中断查询</button></td></tr>');
    	   }
    	   }
       );
    	   }
    	   setInterval(run,du*1000); 
    	   $('body').on('click','button[name=pg_cancel_backend]',function(e){
    		   var procpid=$(this).attr('procpid');
    		    $.post('./dataApiQuery/pg_cancel_backend',{procpid:procpid},function(res){
    		    	   swal("提示!", "操作成功.", "success");  
    		   }
    		   ); 
    	   });
       });
       
       </script>
    </body>
</html>