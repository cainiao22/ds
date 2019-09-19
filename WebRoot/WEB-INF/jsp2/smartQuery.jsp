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
                                    <span>自助分析</span>
                                </li>
                              
                            </ul>
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">自助分析
                        </h1>   
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
            
                                                                    
                                                                      
                                                            
                                                              <div class="row">
                                                          <div class="col-md-12">
                                                             <div class="portlet light  ">
                                   
                                    <div class="portlet-body">
                                                          <div class="form-group">
                                                           <label class="col-md-1 control-label">数据集: </label>
                                                               <div class="col-md-9">
                                                        <select class="form-control select2"  id="metaTableSelect">
                                                          <option value="-1">请选择</option>
                                                        <c:forEach items="${metaTableList}" var="metaTable">
                                                       <option value="${metaTable.id }" <c:if test="${metaTableParam.id eq metaTable.id }"> selected=" selected"</c:if> >${metaTable.alias }(${metaTable.type}.${metaTable.name})</option>
                                                       </c:forEach>
                                                        </select>
											</div>
                                                            </div>
                                                            </div>
                                                            </div>
                                             
                                                            
                                                         
                                                         <c:if test="${not empty metaFieldList }">
                                                          <form id="form" action="smartQueryExport" target="_blank" method="post" style="display: none;">
                                                          <input id="fullTableName" name="fullTableName" value="${metaTableParam.type}.${metaTableParam.name}"  type="hidden"/>
                                                          <input id="tableId" name="tableId" value="${metaTableParam.id}"  type="hidden"/>
                                                          <input id="groupBy" name="groupBy" value=""  type="hidden"/>
                                                          <input id="metric" name="metric" value=""  type="hidden"/>
                                                          <input id="filter" name="filter" value=""  type="hidden"/>
                                                          <input id="limit"  name="limit"  value=""  type="hidden"/>
                                                          </form>
                                                            <div class="portlet light  ">
                                   
                                    <div class="portlet-body">
                                       <div class="form-group">
                                                           <label class="col-md-1 control-label">维度: </label>
                                                               <div class="col-md-9"  >
                                                        <select class="form-control select2"  id="metaFieldSelect1" multiple="multiple"  style="visibility: hidden;">
                                                        <c:forEach items="${metaFieldList}" var="metaField">
                                                        <c:if test="${ metaField.isDim eq 1}">
                                                       <option value="${metaField.name }" >${metaField.alias }</option>
                                                       </c:if>
                                                       </c:forEach>
                                                        </select>
											</div>
                                                            </div>
                                    </div>
                                </div>
                                                            <div class="portlet light  ">
                                   
                                    <div class="portlet-body">
                                       <div class="form-group">
                                                           <label class="col-md-1 control-label">指标: </label>
                                                               <div class="col-md-9" >
                                                        <select class="form-control select2"  id="metaFieldSelect2" multiple="multiple" style="visibility: hidden;">
                                                        <c:forEach items="${metaFieldList}" var="metaField">
                                                          <c:if test="${ metaField.isMetric eq 1}">
                                                      
                                                          <c:choose>
                                                          <c:when test="${metaField.isVirtual eq 1}">
                                                           <option value="${metaField.name }" >${metaField.alias }</option>
                                                          </c:when>
                                                          <c:when test="${metaField.isVirtual eq 0}">
                                                           <optgroup label="${metaField.alias }">
                                                           <c:if test="${metaField.dataType eq 0 }">
                                                             <option value=" count(${metaField.name })" >${metaField.alias }【计数】</option>
                                                             <option value=" count( distinct ${metaField.name })" >${metaField.alias }【去重计数】</option>
                                                           </c:if>
                                                             <c:if test="${metaField.dataType eq 1 }">
                                                                 <option value=" count(${metaField.name })" >${metaField.alias }【计数】</option>
                                                             <option value=" count( distinct ${metaField.name })" >${metaField.alias }【去重计数】</option>
                                                                 <option value=" sum(${metaField.name })" >${metaField.alias }【求和】</option>
                                                             <option value=" agv(  ${metaField.name })" >${metaField.alias }【平均数】</option>
                                                             <option value=" max(   ${metaField.name })" >${metaField.alias }【最大值】</option>
                                                             <option value=" min(   ${metaField.name })" >${metaField.alias }【最小值】</option>
                                                             </c:if>
                                                      <c:if test="${metaField.dataType eq 2 }">
                                                             <option value=" count(${metaField.name })" >${metaField.alias }【计数】</option>
                                                             <option value=" count( distinct ${metaField.name })" >${metaField.alias }【去重计数】</option>
                                                           </c:if>
                                                       </optgroup>
                                                          </c:when>
                                                          </c:choose>
                                                      
                                                      
                                                      
                                                      
                                                       </c:if>
                                                       </c:forEach>
                                                        </select>
											</div>
                                                            </div>
                                    </div>
                                </div>      
                                                 <div class="portlet light  ">
                                   
                                    <div class="portlet-body" >
                            
                                       <div class="form-group">
                                                           <label class="col-md-3 control-label">筛选: </label>
                                                                 
                                                            </div>
                                    </div>
                                    
                                    <div class="portlet-body " id="filterFiv">
                            
                                       <div class="form-group">
                                                         
                                                                    <div class="col-md-9 col-md-offset-1" >
                                                                    <button class="btn btn-info" id="addFilterBtn">添加</button>
                                                                    </div>
                                                            </div>
                                    </div>
                                    
                                    
                                </div>      
                                                 <div class="portlet light  ">
                                   
                                    <div class="portlet-body" >
                            
                                       <div class="form-group">
                                                           <label class="col-md-1 control-label">限制: </label>
                                                                 
                               
                                                         
                                                                    <div class="col-md-9">
                                                               <div class="col-md-3" >
                                                        <select class="form-control "   id="limit_size">
                                                        <option value="1000">1000行</option>
                                                        <option value="5000">5000行</option>
                                                        <option value="10000">10000行</option>
                                                        <option value="50000">50000行</option>
                                                        <option value="100000">100000行</option>
                                                        </select>
                                                                    </div>
                                                            </div>
                                    </div>
                                    
                                    
                                </div>      
                                </div>      
                                                     
                        <div class="portlet light  ">
                                   
                                    <div class="portlet-body" >
                            
                                    
                                    <div class="portlet-body "  >
                            
                                       <div class="form-group">
                                                         
                                                                    <div class="col-md-9 col-md-offset-1" >
                                                                    <button type="button" class="btn red  btn-xlg" id="queryBtn">    执行查询    </button>
                                                                    </div>
                                                            </div>
                                    </div>
                                    
                                    
                                </div>      
                                </div>      
                                            
                                                                <div class="row">
                            <div class="col-md-12   portlet light ">
                               <div class="portlet-body"  id="table_container">
                                      
                                            
                                            
                                    </div>
                            </div></div> 
                            </c:if>
            
                   
                   
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
<link href="./assets/global/plugins/bootstrap-tokenfield/css/bootstrap-tokenfield.min.css" rel="stylesheet"
	type="text/css" />
<link href="./assets/global/plugins/bootstrap-tokenfield/css/tokenfield-typeahead.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="./assets/global/plugins/bootstrap-tokenfield/bootstrap-tokenfield.min.js"
	type="text/javascript"></script>
<script type='text/javascript'>

$(function(){
	var filterHtml='  <div class="portlet-body"><div class="form-group"><div class="col-md-offset-1 col-md-3"><select name="filterSel" class="form-control select2" ><c:forEach items="${metaFieldList}" var="metaField">    <c:if test="${ metaField.isFilter eq 1}"><option value="${metaField.name }">${metaField.alias }</option></c:if></c:forEach></select></div><div class="col-md-2"><select class="form-control select2"><option value="0">包含</option><option value="1">不包含</option><option value="2">大于</option><option value="3">大于等于</option><option value="4">小于</option><option value="5">小于等于</option></select></div><div class="col-md-3"><input type="text"  name="filters"  class="form-control  input-medium "  /></div><div class="col-md-1">  <button type="button" class="btn yellow  btn" name="deleteBtn">删除</button></div></div></div></div>';
	 $('.select2').select2( {
	 }
	 );
	 $('.select2').css('visibility','visible');
	 $('#metaTableSelect').change(function(){
		 if($(this).val()!='-1'){
		 window.location.href='smartQuery?id='+$(this).val();
		 }
	 });

	 $('body').on('click','button[name=deleteBtn]',function(){
		 
	$(this).parent().parent().parent().remove();s
	 });
	$('#addFilterBtn').click(function(){
		$('#filterFiv').before(filterHtml);
		
		$('[name=filters]:last')	.tokenfield({
			createTokensOnBlur:true,
			delimiter:[","],
						  showAutocompleteOnFocus: true
				});
		 $('select[name=filterSel]:last').select2( {
		 }
		 );
	});
	$(document).on('click', '#exportBtn', function() {
		 $('#form').submit();
		});
	$('#queryBtn').click(function(){
		$('.row :first').block({ message: '数据查询中,请稍候...' });
		var groupBy=$("#metaFieldSelect1").select2("data");
		var groupByData='';
		for(var i=0;i<groupBy.length;i++){
			groupByData=groupByData+groupBy[i].id+":"+groupBy[i].text+"€";
		}
		var metric=$("#metaFieldSelect2").select2("data");
		var metricData='';
		for(var i=0;i<metric.length;i++){
			metricData=metricData+metric[i].id+":"+metric[i].text+"€";
		}
		if(groupByData=='' && metricData==''  ){
				$('.row :first').unblock();
			   swal("提示!", "维度、指标至少选择一个.", "warning");  
			return false;
		} 
		var filterData='';
		$('[name=filters]').each(function(){
			var curFilter=$(this).parent().parent().prev().prev().children().first().find("option:selected").val()
			curFilter+="#$#";
			curFilter+=$(this).parent().parent().prev().children().first().val();
			curFilter+="#$#";
		curFilter+=$(this).tokenfield('getTokensList', '^ ',false);
		filterData+='€'+curFilter;
		});
		$('#table_container').empty();
	    var limit =$('#limit_size').val();
		$.post('./smartQuerySubmit',{
			fullTableName:'${metaTableParam.type}.${metaTableParam.name}',
			tableId:'${metaTableParam.id}',
			groupBy:groupByData,
			metric:metricData,
			filter:filterData,
			limit:limit
		},function(data){
		$('#table_container').html(data);
	
		$('.row :first').unblock();
			
		});
		$('#groupBy').val(groupByData);
		$('#metric').val(metricData);
		$('#filter').val(filterData);
		$('#limit').val(limit);
		
		
	});
});
</script>
       
       
    </body>
</html>