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
                                    <a href="javascript:void(0);">数据总览</a>
                                    <i class="fa fa-circle"></i>
                                </li>
                                <li>
                                    <span>大屏数据</span>
                                </li>
                            </ul>
                            <div class="page-toolbar">
                          
                            </div>
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title"> 大屏数据
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
                        <!-- BEGIN DASHBOARD STATS 1-->
                          <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 margin-bottom-10">
                                <div class="dashboard-stat blue">
                                    <div class="visual">
                                        <i class="fa fa-briefcase fa-icon-medium"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number" id="data1">0</div>
                                        <div class="desc">总注册用户数 </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="dashboard-stat red">
                                    <div class="visual">
                                        <i class="fa fa-shopping-cart"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number" id="data2"> 0</div>
                                        <div class="desc"> 昨日注册用户数 </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="dashboard-stat green">
                                    <div class="visual">
                                        <i class="fa fa-group fa-icon-medium"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number" id="data3"> 0 </div>
                                        <div class="desc">昨日APP启动数</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="row">
                            <div class="col-md-12">
                          
                          <iframe src="realtime_sales" width="98%" height="800px;" style="border-width: 0px;" ></iframe>
                            </div>
                            
                        </div>
                        <div class="clearfix"></div>
                        <!-- END DASHBOARD STATS 1-->
                       
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
                <!-- END CONTENT -->
             
            </div>
            <!-- END CONTAINER -->
         <c:import url="common/footer.jsp"></c:import>
         
        </div>
            <c:import url="common/global_js.jsp"></c:import>
            
                  <script type='text/javascript'>
       $(function(){
    	   $.post('dataApiQuery/member_all_query',{},function(data){
    		   
    		   $('#data1').text(data.data[0].count);
    		   
    	   });
    	   $.post('dataApiQuery/member_query_yesterday',{},function(data){
    		   
    		   $('#data2').text(data.data[0].count);
    		   
    	   });
    	   $.post('dataApiQuery/app_start_query_yesterday',{
    		   dt:getDay(-1)
    	   },function(data){
    		   
    		   $('#data3').text(data.data[0].count);
    		   
    	   });
    	   function getDay(day){  
    	       var today = new Date();  
    	         
    	       var targetday_milliseconds=today.getTime() + 1000*60*60*24*day;          
    	  
    	       today.setTime(targetday_milliseconds); //注意，这行是关键代码    
    	         
    	       var tYear = today.getFullYear();  
    	       var tMonth = today.getMonth();  
    	       var tDate = today.getDate();  
    	       tMonth = doHandleMonth(tMonth + 1);  
    	       tDate = doHandleMonth(tDate);  
    	       return tYear+"-"+tMonth+"-"+tDate;  
    	}
    	   function doHandleMonth(month){  
    	       var m = month;  
    	       if(month.toString().length == 1){  
    	          m = "0" + month;  
    	       }  
    	       return m;  
    	}  
    	  
       });
       </script>
    </body>
</html>