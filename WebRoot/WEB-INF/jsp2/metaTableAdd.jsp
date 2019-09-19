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
    <script type="text/javascript" src="./js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap-select.min.js"></script>
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
                            <span>元数据</span>
                            <i class="fa fa-circle"></i>
                        </li>
                        <li>
                            <span>数仓元数据</span>
                        </li>
                    </ul>
                    <c:import url="common/metaTableRightBar.jsp"></c:import>
                </div>
                <!-- END PAGE BAR -->
                <!-- BEGIN PAGE TITLE-->
                <h1 class="page-title">基本信息
                    <small></small>
                </h1>
                <!-- END PAGE TITLE-->
                <!-- END PAGE HEADER-->
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN FORM-->
                        <form class="form-horizontal" action="./metaTableSave" method="post"
                              id="form">
                            <input
                                    type="hidden" name="id" id="id" value="${metaTable.id }"/>
                            <div class="portlet light bordered">


                                <div class="portlet-body form">
                                    <div class="form-body">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">表名: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="name" id="name"
                                                               class="form-control" value="${metaTable.name }"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">

                                                    <label class="col-md-3 control-label">中文名: </label>
                                                    <div class="col-md-9">
                                                        <input type="text"
                                                               name="alias" class="form-control"
                                                               value="${metaTable.alias }"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">

                                                    <label class="col-md-3 control-label">数据库类型: </label>
                                                    <div class="col-md-9">
                                                        <select id="dbType" name="dbType" class="form-control">
                                                            <option value=''>请选择</option>
                                                            <c:forEach items="${dbTypes}" var="dbType">

                                                                <option value='${ dbType}'
                                                                        <c:if test="${ metaTable.dbType eq dbType }"> selected=selected </c:if>>
                                                                        ${ dbType}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">数据库: </label>
                                                    <div class="col-md-9">
                                                        <select id="type" name="type" class="form-control select2">
                                                            <%--<c:forEach items="${metaTableTypes}" var="metaTableType">

                                                                <option value='${ metaTableType}'
                                                                        <c:if test="${ metaTable.type eq metaTableType }"> selected=selected </c:if>>
                                                                        ${ metaTableType}</option>
                                                            </c:forEach>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">自助分析: </label>
                                                    <div class="col-md-9">
                                                        <select id="queryEnable" name="queryEnable"
                                                                class="form-control">

                                                            <option value='0'
                                                                    <c:if test="${ metaTable.queryEnable eq 0 }"> selected=selected </c:if>>
                                                                关闭
                                                            </option>
                                                            <option value='1'
                                                                    <c:if test="${ metaTable.queryEnable eq 1 }"> selected=selected </c:if>>
                                                                启用
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">

                                                    <label class="col-md-3 control-label">负责人: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" placeholder="多个负责人请用英文逗号分开"
                                                               name="owner" class="form-control"
                                                               value="${metaTable.owner }"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">描述: </label>
                                                    <div class="col-md-9">
                                                        <textarea
                                                                name="description" class="form-control" rows="5"
                                                                cols="16"
                                                                style="margin: 0px; width: 571px; height: 59px;"
                                                        >${metaTable.description}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button id="submitBtn" type="submit" class="btn btn-success">提交</button>

                                                <c:if test="${ !empty  metaTable}">
                                                    <a href="metaTableDelete?id=${metaTable.id}&dbType=${metaTableParam.dbType}&keyword=${metaTableParam.keyword}&type=${ metaTableParam.type}&owner=${ metaTableParam.owner}">
                                                        <button id="delBtn" type="button" class="btn btn-warning">删除
                                                        </button>
                                                    </a>

                                                </c:if>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </form>
                        <!-- END FORM-->
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
<script type='text/javascript' src="js/roleTableManage.js"></script>
<script type='text/javascript' src="js/usermanage.js"></script>
<script type="text/javascript">
    var dbTypeMap = eval('(${metaTableTypes})');
    $(function () {
        $(".select2").select2();

        init();

        $("#dbType").change(function () {
            $("#type").empty();
            var key = $(this).val();
            schemas = dbTypeMap[key];
            for(var i=0; i<schemas.length; i++){
                $("#type").append("<option value='" + schemas[i] + "'>" + schemas[i] + "</option>")
            }
        })
    });
    
    function init() {
        var type = '${ metaTable.type}';
        $("#type").empty();
        var key = $("#dbType").val();
        if(key == ''){
            return;
        }
        schemas = dbTypeMap[key];
        selected = '';
        for(var i=0; i<schemas.length; i++){
            $("#type").append("<option value='" + schemas[i] + "'>" + schemas[i] + "</option>")
        }

        if(type != null && type != ''){
            $("#type").val(type);
        }
    }
</script>

</body>
</html>