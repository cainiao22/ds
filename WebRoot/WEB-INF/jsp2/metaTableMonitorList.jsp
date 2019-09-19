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
                        <h1 class="page-title"> 预警规则 ${metaTable.name } (${metaTable.alias})
                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
              <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN SAMPLE TABLE PORTLET-->
                                <div class="portlet light bordered">
                                
                                  <div class="portlet-title">
                                	<a href="./metaTableMonitorAdd?id=${metaTable.id}">	<button id="addBtn" type="button" class="btn btn-success" >添加</button></a>
                                </div>
                                    <div class="portlet-body">
                                        <div class="table-scrollable">
                                            <table
                    class="table table-striped table-bordered table-condensed table-hover">
                <thead>
                <tr>
                    <th style="width: 120px;">创建时间</th>
                    <th style="width: 120px;">更新时间</th>
                    <th style="width: 150px">SQL脚本</th>
                    <th style="width: 80px;">是否启用</th>
                    <th style="width: 100px;">最大值</th>
                    <th style="width: 100px;">最小值</th>
                    <th style="width: 90px;">调度时间</th>
                    <th style="width: 80px;">优先级</th>
                    <th style="width: 100px;">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${metaTableMonitorList}" var="item">
                    <tr>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                            value="${item.createTime}"/></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                            value="${item.updateTime}"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:length(item.monitorSql) > 200}"><span>
                                <c:out value="${fn:substring(item.monitorSql, 0, 200)} ....."/></span><span
                                        style="display: none;">${item.monitorSql}</span>
                                    <a href="javascript:void(0)" name="monitorSql">展开</a>
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${item.monitorSql}"/>
                                </c:otherwise>
                            </c:choose></td>
                        <td>
                            <c:if test="${item.enableMonitor eq 1}"> <span class="label label-success">是</span> </c:if>
                            <c:if test="${item.enableMonitor eq 0}"> <span class="label label-warning">否</span> </c:if>
                        </td>
                        <td>${item.valueMax}</td>
                        <td>${item.valueMin}</td>
                        <td>${item.monitorjobScheduleHour}点${item.monitorjobScheduleMinute}分</td>
                        <td>${item.priority}</td>

                        <td align="center"><a href="./metaTableMonitorManage?id=${item.id}">修改</a> |
                            <a
                                    href="./metaTableMonitorDelete?id=${item.id}&metaTableId=${item.metaTableId}"
                                   >删除</a>
                            <c:if test="${item.enableMonitor eq 1}">
                                <p><a href="javascript:void(0)" onclick="monitorJobRun('${item.id}')">立即执行</a></p>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
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
    $(function () {
        $('a[name=monitorSql]').click(function(){
            if($(this).prev().is(":hidden")){
                $(this).prev().prev().hide();
                $(this).prev().show();
                $(this).text("收起");
            }else{
                $(this).prev().prev().show();
                $(this).prev().hide();
                $(this).text("展开");
            }

        });
    });
    
    function monitorJobRun(monitorId) {
        $.ajax({
            url:'./metaTableMonitorRun',
            type:'POST', //GET
            async:true,    //或false,是否异步
            data:{
                id:monitorId
            },
            timeout:5000,    //超时时间
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            beforeSend:function(xhr){
                console.log(xhr)
                console.log('发送前')
            },
            success:function(data,textStatus,jqXHR){
                console.log(data)
                console.log(textStatus)
                console.log(jqXHR)
                alert("加入对列成功");
            },
            error:function(xhr,textStatus){
                console.log('错误')
                console.log(xhr)
                console.log(textStatus)
                alert("系统异常，执行失败");
            },
            complete:function(){
                console.log('结束')
            }
        })
    }
</script>
    </body>
</html>