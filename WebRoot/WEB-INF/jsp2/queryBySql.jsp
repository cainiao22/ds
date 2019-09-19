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
                                    <span>数据中心</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>SQL查询</span>
                                </li>
                            </ul>
                             <c:import url="common/metaTableRightBar.jsp"></c:import>
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">SQL查询(输入时，按Alt键有提示)
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                               <!-- BEGIN FORM-->
                               <form id="form" action="queryBySqlExport" target="_blank" method="post">
                             <input type="hidden" name="dataSource" value="1" />
                        <div class="portlet light  ">
                                                 
                                              
                                                <div class="portlet-body form">
                                                        <div class="form-body">
                                                       
                                                                    
                                                                      
                                                            
                                                              <div class="row">
                                                          <div class="col-md-12">
                                                          <div class="form-group">
                                                           <label class="col-md-1 control-label">SQL: </label>
                                                               <div class="col-md-9">
                                                        <textarea 
											id="sql" name="sql"  class="form-control" rows="5" cols="26" style="margin: 10px; width: 600px; height: 180px;"
											></textarea>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                             <div class="form-body">
                                                            <div class="row">
                                                               <div class="form-group">
                                                                        <div class="col-md-offset-3 col-md-6 ">
                                                                        <span class="col-md-6">
                                                                       <button id="submitBtn" type="button" class="btn btn-info">执行查询</button>
	
 
	
</span>
				 

                                                                        </div>
                                                                        </div>
                                                                    </div>
                                                                    </div>
                                                            
                                                        </div>
                                              
                                                </div>
                                                
                                            </div>    
                                              </form>
                                                    <!-- END FORM-->
                            </div>
                           
                        </div>
                   
                     <div class="row">
                            <div class="col-md-12   portlet light ">
                               <div class="portlet-body"  id="table_container">
                                      
                                            
                                            
                                    </div>
                            </div></div>
                   
                   
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
                <!-- END CONTENT -->
              
            </div>
            <!-- END CONTAINER -->
      <c:import url="common/footer.jsp"></c:import>
        </div>
       <c:import url="common/global_js.jsp"></c:import>
                 <link href="./assets/global/plugins/codemirror/lib/codemirror.css" rel="stylesheet" type="text/css" />
<script src="./assets/global/plugins/codemirror/lib/codemirror.js" type="text/javascript"></script>
        <script src="./assets/global/plugins/codemirror/mode/sql/sql.js" type="text/javascript"></script>
<link rel="stylesheet" href="./assets/global/plugins/codemirror/addon/hint/show-hint.css" />
<script src="./assets/global/plugins/codemirror/addon/hint/show-hint.js"></script>
<script src="./assets/global/plugins/codemirror/addon/hint/sql-hint.js"></script>
<script type="text/javascript">
	
		
		

$(function(){
	  var mime = 'text/x-pgsql';
	  window.editor = CodeMirror.fromTextArea(document.getElementById('sql'), {
	    mode: mime,
 
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
		window.editor.setOption("hintOptions",{
				tables: hint_tables
				
		}
		);
	  }
	);

	
	$(document).on('click', '#exportBtn', function() {
		 $('#form').submit();
		});
	$('#submitBtn').click(function(){
		$('#table_container').empty();
		$('.portlet :first').block({ message: '数据查询中,请稍候...' });
		$.post('./queryBySqlSubmit',{sql:  window.editor.getValue(),dataSource:'1'},function(data){
		$('#table_container').html(data);
	
			$('.portlet :first').unblock();
			
		});
		
		
	});
	
	
});
</script>
       
    </body>
</html>