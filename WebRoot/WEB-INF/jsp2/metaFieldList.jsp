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
                                    <span>元数据管理</span>
                                      <i class="fa fa-circle"></i>
                                </li>
                                 <li>
                                    <span>数据仓库管理</span>
                                </li>
                            </ul>
                         <c:import url="common/metaTableRightBar.jsp"></c:import>
                        </div>
                        <!-- END PAGE BAR -->
                        <!-- BEGIN PAGE TITLE-->
                        <h1 class="page-title">字段信息 ${metaTable.name } (${metaTable.alias})
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                    <div class="portlet-title">
                                    
                                   
                                         <form action="./metaTableList" method="get"  class="form-inline">
                                         <div class="form-group">
				<a href="./metaFieldAdd?tableId=${metaFieldParam.tableId}">	<button id="addBtn" type="button" class="btn btn-success" >添加</button></a>
					
						<button id="syncFieldMeta" type="button" class="btn btn-success">同步字段</button>
					
						</div>
			</form> 
                                       
                                    </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                          <table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th style="width: 150px;">名称</th>
						<th style="width:140px;">中文名</th>
						<th style="width: 50px;">原始类型</th>
						<th style="width: 50px;">数据类型</th>
							<th style="width: 50px;">数据日期</th>
							<th style="width: 50px;">维度</th>
							<th style="width: 50px;">过滤</th>
							<th style="width: 50px;">指标</th>
							<th style="width: 50px;">虚拟</th>
							<th style="width: 100px;">管理</th>
						</tr>
					</thead>

					<c:forEach items="${metaFieldList}" var="metaField">
						<tr>
							<td>${metaField.name}</td>
							<td>${metaField.alias}</td>
					<td>${metaField.type}</td>
					<td>	<select name="data_type" class="form-control  input-xsmall" uuid="${metaField.id}">
					<option value="-1">请选择</option>
					<option value="0" <c:if test ="${metaField.dataType eq 0 }"> selected="selected"</c:if>>文本</option>
					<option value="1" <c:if test ="${metaField.dataType eq 1 }"> selected="selected"</c:if>>数字</option>
					<option value="2" <c:if test ="${metaField.dataType eq 2 }"> selected="selected"</c:if>>日期</option>
					</select></td>
								<td>   
								  <input <c:if test ="${metaField.isDate eq 1 }"> checked="checked"</c:if> type="checkbox"  autocomplete="off" class="form-control"  name="updfield_isDate_${metaField.id}"> 
								  </td>
								<td>   
								  <input <c:if test ="${metaField.isDim eq 1 }"> checked="checked"</c:if>   type="checkbox"  autocomplete="off" class="form-control"  name="updfield_isDim_${metaField.id}"> 
								  </td>
								<td>   
								  <input <c:if test ="${metaField.isFilter eq 1 }"> checked="checked"</c:if>  type="checkbox"  autocomplete="off" class="form-control"  name="updfield_isFilter_${metaField.id}"> 
								  </td>
								<td>   
								  <input <c:if test ="${metaField.isMetric eq 1 }"> checked="checked"</c:if>  type="checkbox"  autocomplete="off" class="form-control"  name="updfield_isMetric_${metaField.id}"> 
								  </td>
								<td>   
								  <input <c:if test ="${metaField.isVirtual eq 1 }"> checked="checked"</c:if>  type="checkbox"  autocomplete="off" class="form-control"  name="updfield_isVirtual_${metaField.id}"> 
								  </td>
							
				
							<td>  <a href="./metaFieldManage?id=${metaField.id}">修改</a> |
							 <a
								href="./metaFieldDelete?id=${metaField.id}&tableId=${metaField.tableId}"
								 >删除</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
                                            
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
	
	$('#syncFieldMeta').click(function(){
		$(this).html('字段同步中...');
		$(this).attr("disabled",true); 
		
		$.post('./syncFieldMeta',{id:"${metaFieldParam.tableId}",
		name:"${metaTable.name}"	,
        dbType:"${metaTable.dbType}",
		type:"${metaTable.type}"	
		},   function(data){
		if(data.code == 0){
            window.location.href='./metaFieldList?tableId=${metaFieldParam.tableId}';
        }else{
            toastr.info(data.errorMsg);
            $('#syncFieldMeta').html('同步字段');
            $('#syncFieldMeta').attr("disabled",false);
        }
		});
	});

	$("select[name='data_type']").change(function () {
        var id = $(this).attr("uuid");
        var v = $(this).val();
        $.get('updateFiled?fieldId='+id+'&key=dataType&value='+v+"&t="+Math.random(),function(res){
            toastr.info('dataType 更新为'+v+(res=='1'?'成功':'失败'));
        });
    });
	
	$("input[name*=updfield]").change(function() {
	var arr=$(this).attr('name').split('_');
	var v=$(this).is(':checked');
	$.get('updateFiled?fieldId='+arr[2]+'&key='+arr[1]+'&value='+v+"&t="+Math.random(),function(res){
		toastr.info(arr[1]+' 更新为'+v+(res=='1'?'成功':'失败'));
	});
		}); 
});
</script>
    </body>
</html>