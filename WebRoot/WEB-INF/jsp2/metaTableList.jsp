<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!-- BEGIN HEAD -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>千丁大数据平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>

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
                <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true"
                    data-slide-speed="200">
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

                </div>
                <!-- END PAGE BAR -->
                <!-- BEGIN PAGE TITLE-->
                <h1 class="page-title"> 数据仓库管理
                    <small></small>
                </h1>
                <!-- END PAGE TITLE-->
                <!-- END PAGE HEADER-->
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN SAMPLE TABLE PORTLET-->
                        <div class="portlet light bordered">
                            <div class="portlet-title">


                                <form action="./metaTableList" method="get" class="form-inline">
                                    <div class="form-group">
                                        <label class=" control-label">数据库类型：</label>
                                        <select id="dbType" name="dbType" class="form-control   input-small">
                                            <option value=''>全部
                                            </option>
                                            <c:forEach items="${dbTypes}" var="dbType">
                                                <option value='${ dbType}'>${ dbType}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class=" control-label">数据库：</label>
                                        <select id="type" name="type" class="form-control input-medium select2">
                                            <option value=''>全部</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class=" control-label">关键字:</label>
                                        <input class="form-control input-inline input-medium" placeholder="请输入关键字"
                                               type="text" name="keyword" id="keyword"
                                               value="${metaTableParam.keyword }"/>
                                    </div>
                                    <div class="form-group">
                                        <label class=" control-label">负责人:</label>
                                        <input type="text" class="form-control input-inline input-small"
                                               placeholder="请输入负责人" name="owner" id="owner"
                                               value="${metaTableParam.owner }">

                                    </div>
                                    <div class="form-group">
                                        <button id="queryBtn" type="submit" class="btn btn-info">搜索</button>
                                        <a href="./metaTableAdd?dbType=${metaTableParam.dbType}&keyword=${metaTableParam.keyword}&type=${ metaTableParam.type}&owner=${ metaTableParam.owner}">
                                            <button id="addBtn" type="button" class="btn btn-success">添加</button>
                                        </a>
                                    </div>
                                </form>

                            </div>
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <table class="table table-hover table-light">
                                        <thead>
                                        <tr>
                                            <th style="width: 150px;">表名</th>
                                            <th style="width:140px;">中文名</th>
                                            <th style="width: 50px;">类型</th>
                                            <th style="width: 50px;">数据库</th>
                                            <th style="width:50px;">负责人</th>
                                            <th style="width: 50px;">调度</th>
                                            <th style="width: 50px;">字段</th>
                                            <th style="width: 50px;">预警</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${metaTableList}" var="metaTable">
                                            <tr>
                                                <td><a href="./metaTableManage?id=${metaTable.id}" onclick=" return appendParams(this);">${metaTable.name}</a>
                                                </td>
                                                <td>${metaTable.alias}</td>
                                                <td>${metaTable.dbType}</td>
                                                <td>${metaTable.type}</td>
                                                <td>${metaTable.owner}</td>
                                                <td>
                                                    <c:choose><c:when
                                                            test="${metaTable.enableEtl eq 1}"><fmt:formatNumber
                                                            value="${metaTable.etlJobScheduleHour}"
                                                            minIntegerDigits="2"/>:<fmt:formatNumber
                                                            value="${metaTable.etlJobScheduleMinute}"
                                                            minIntegerDigits="2"/></c:when>
                                                        <c:otherwise>关闭</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="metaFieldList?tableId=${metaTable.id}">字段</a>
                                                </td>
                                                <td>
                                                    <a href="metaTableMonitorList?id=${metaTable.id}">预警</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>

                                <div>
                                    <c:import url="common/pagination.jsp">
                                        <c:param name="currentPage" value="${metaTableParam.page}"/>
                                        <c:param name="totalPage" value="${totalPage }"/>
                                        <c:param name="totalCount" value="${totalCount }"/>
                                        <c:param name="url"
                                                 value="./metaTableList?dbType=${metaTableParam.dbType}&keyword=${metaTableParam.keyword}&type=${ metaTableParam.type}&owner=${ metaTableParam.owner}"/>
                                    </c:import>

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
    var dbTypeMap = eval('(${metaTableTypes})');
    $(function () {
        $(".select2").select2();

        init();

        $("#dbType").change(function () {
            $("#type").empty();
            $("#type").append("<option value=''>全部</option>");
            var key = $(this).val();
            schemas = dbTypeMap[key];
            for(var i=0; i<schemas.length; i++){
                $("#type").append("<option value='" + schemas[i] + "'>" + schemas[i] + "</option>")
            }
        })
    });

    function appendParams(elem){
        var href = $(elem).attr("href");
        var dbType = $("#dbType").val();
        var type = $("#type").val();
        var keyword = $("#keyword").val();
        var owner = $("#owner").val();

        href = href + "&dbType=" + dbType + "&type=" +type + "&keyword=" + keyword + "&owner=" + owner;
        $(elem).attr("href", href);

        return true;
    }


    function init() {
        var dbType='${metaTableParam.dbType}';
        if(dbType != null && dbType != '' && dbType != 'null'){
            $("#dbType").val(dbType);
        }
        $("#type").empty();
        $("#type").append("<option value=''>全部</option>");
        var key = $("#dbType").val();
        if(key == ''){
            return;
        }
        var schemas = dbTypeMap[key];
        var type = '${ metaTableParam.type}';
        for(var i=0; i<schemas.length; i++){
            var selected = '';
            if(type == schemas[i]){
                selected = 'selected="selected"';
            }
            $("#type").append("<option " + selected + " value='" + schemas[i] + "'>" + schemas[i] + "</option>")
        }
    }
</script>
</body>
</html>