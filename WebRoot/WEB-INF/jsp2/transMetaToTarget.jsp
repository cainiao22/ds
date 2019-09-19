<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <c:import url="common/global_js.jsp"></c:import>
    <script type="text/javascript" src="./assets/global/plugins/select2/js/select2.min.js"></script>
    <script type="text/javascript" src="./assets/global/plugins/select2/js/select2.full.min.js"></script>
    <link  href="./assets/global/plugins/select2/css/select2.min.css"
           rel="stylesheet" type="text/css" />
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
                            <span>数据管理</span>
                            <i class="fa fa-circle"></i>
                        </li>
                        <li>
                            <span>数据同步</span>
                        </li>
                    </ul>
                </div>
                <!-- END PAGE BAR -->
                <!-- BEGIN PAGE TITLE-->
                <h1 class="page-title">数据信息
                    <small></small>
                </h1>
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN FORM-->
                        <form class="form-horizontal"
                              id="form">
                            <div class="portlet light bordered">
                                <div class="portlet-body form">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">源表名: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" id="tableName"
                                                               name="tableName" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">目标表名: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" id="targetTableName"
                                                               name="targetTableName" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">中文名: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" id="alias"
                                                               name="alias" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">负责人: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" id="ownerd"
                                                               name="ownerd" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">partitioned by: </label>
                                                <div class="col-md-9">
                                                    <input type="text" id="partitioned"
                                                           name="partitioned" class="form-control" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">terminate by: </label>
                                                <div class="col-md-9">
                                                    <input type="text" id="terminate"
                                                           name="terminate" class="form-control" value="\u0001"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">stored as: </label>
                                                    <div class="col-md-9">
                                                            <select id="stored" name="stored"
                                                                    class="form-control">
                                                            <option value="TEXTFILE">TEXTFILE</option>
                                                            <option value="SEQUENCEFILE">SEQUENCEFILE</option>
                                                            <option value="RCFILE">RCFILE</option>
                                                            <option value="ORCFILE">ORCFILE</option>
                                                            <option value="PARQUET">PARQUET</option>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">location: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" id="location"
                                                               name="location" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">源数据库类型: </label>
                                                    <div class="col-md-9">
                                                        <input type="hidden"
                                                               readonly="readonly"
                                                               id="metaDataType"
                                                               name="metaDataType" class="form-control"
                                                               value=""/>
                                                        <select id="metaDataTypeSelect" name="dbNameSelect"
                                                                class="form-control">
                                                            <option value="">请选择</option>
                                                            <c:forEach items="${dataSources}" var="dataSource">
                                                                <option value="${dataSource}">${dataSource}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">源数据库: </label>
                                                    <div class="col-md-9">
                                                        <input type="hidden"
                                                               readonly="readonly"
                                                               id="metaConfigkey"
                                                               name="metaConfigkey" class="form-control"
                                                               value=""/>
                                                        <select id="metaConfigkeySelect" name="dbNameSelect"
                                                                class="form-control">
                                                            <option value="">请选择</option>
                                                           <%-- <c:forEach items="${clist}" var="configKey">
                                                                <option value="${configKey}">${configKey}</option>
                                                            </c:forEach>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">目标数据库类型: </label>
                                                    <div class="col-md-9">
                                                        <input type="hidden"
                                                               readonly="readonly"
                                                               id="targetDataType"
                                                               name="targetDataType" class="form-control"
                                                               value=""/>
                                                        <select id="targetDataTypeSelect" name="dbNameSelect"
                                                                class="form-control">
                                                            <option value="">请选择</option>
                                                            <c:forEach items="${dataSources}" var="dataSource">
                                                                <option value="${dataSource}">${dataSource}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">目标数据库: </label>
                                                    <div class="col-md-9">
                                                        <input type="hidden"
                                                               readonly="readonly"
                                                               id="targetConfigkey"
                                                               name="targetConfigkey" class="form-control"
                                                               value=""/>
                                                        <select id="targetConfigkeySelect" name="dbNameSelect"
                                                                class="form-control">
                                                            <option value="">请选择</option>
                                                           <%-- <c:forEach items="${configKeys}" var="configKey">
                                                                <option value="${configKey}">${configKey}</option>
                                                            </c:forEach>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                           <%-- <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">partitionvalue: </label>
                                                    <div class="col-md-9">
                                                        <input type="text" id="partitionvalue"
                                                               name="partitionvalue" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button id="submitBtn" type="button"  class="btn btn-success">建表</button>
                                                <%--<button id="leadBtn" type="button"  class="btn btn-success">同步数据</button>--%>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="sqlModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    创建失败
                </h4>
            </div>
            <div class="modal-body">
                <textarea id="sqlContent" rows="10" style="width: 100%">

                </textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- END CONTAINER -->

<c:import url="common/footer.jsp"></c:import>
</div>

<script type='text/javascript'>
   $(function () {
$("#metaConfigkeySelect").select2();
$("#targetConfigkeySelect").select2();
        $('#submitBtn').click(function () {
            $.post('./transformData', {
                tableName: $('#tableName').val(),
                targetTableName: $('#targetTableName').val(),
                partitioned: $('#partitioned').val(),
                terminate: $('#terminate').val(),
                stored: $('#stored').val(),
                location: $('#location').val(),
                metaDataType: $('#metaDataTypeSelect').val(),
                metaConfigkey: $('#metaConfigkeySelect').val(),
                targetDataType: $('#targetDataTypeSelect').val(),
                targetConfigkey: $('#targetConfigkeySelect').val(),
                alias: $('#alias').val(),
                ownerd: $('#ownerd').val(),
            }, function (data) {
                if (data.code == 0) {
                    swal("提示", data.merrage, "success");
                    window.location.href = '#';
                }else{
                   /*var sql=;*/
                    $("#sqlContent").val(data.merrage);
                    $("#sqlModal").modal();
                       /* window.location.href = contextPath+'/getAgentPosImportStatementListWithPaging.jhtml?agentNo='+agentNo;
                        document.write("<form action=toFailSqlJsp method=post name=form1 style='display:none' target='_blank'>");
                        document.write("<input type=hidden name=sql value='" + data.merrage +"'/>");
                        document.write("</form>");
                        document.form1.submit();*/
                }
                /*swal({
                    title: "提示",
                    text: data.merrage,
                    type:"warning",
                    width:800
                });*/
               /* swal("提示", data.merrage, "warning");*/
            });
        });

        $('#leadBtn').click(function () {
            $.post('./importDataFromMysql', {
                tableName: $('#tableName').val(),
                districtField: $('#districtField').val(),
                metaDataType: $('#metaDataTypeSelect').val(),
                metaConfigkey: $('#metaConfigkeySelect').val(),
                targetDataType: $('#targetDataTypeSelect').val(),
                targetConfigkey: $('#targetConfigkeySelect').val(),
                partitionvalue: $('#partitionvalue').val(),
            }, function (data) {
                if (data == 0) {
                    swal("提示", data.merrage, "success");
                    window.location.href = '#';
                }
               /* <textarea class="form-control" rows="4"    id="sqlStatement" name="sqlStatement"></textarea>*/
              /* alter(data.merrage);*/
              /*window.reload(data.merrage);*/
                /*swal({
                    title: "提示",
                    text: data.merrage,
                    type:"warning",
                    width: 800
                });*/
                swal("提示", data.merrage, "warning");
            });
        });
   });


   $("#metaDataTypeSelect").change(function(){
       $.post('./configList', {
           dataType: $('#metaDataTypeSelect').val()
       }, function (clist) {
             $("#metaConfigkeySelect").empty();
            $("<option value=''>请选择</option>").appendTo("#metaConfigkeySelect");
           for(var i=0;i<clist.length;i++){
               $("#metaConfigkeySelect").append("<option value='"+clist[i]+"'>"+clist[i]+"</option>");
           }
       });
   });

   $("#targetDataTypeSelect").change(function(){
       $.post('./configList', {
           dataType: $('#targetDataTypeSelect').val()
       }, function (clist) {
             $("#targetConfigkeySelect").empty();
            $("<option value=''>请选择</option>").appendTo("#targetConfigkeySelect");
           for(var i=0;i<clist.length;i++){
               $("#targetConfigkeySelect").append("<option value='"+clist[i]+"'>"+clist[i]+"</option>");
           }
       });
   });

</script>
</body>
</html>
<%--<button id="submitBtnNo" type="button" class="btn btn-success">取消
                                                    </button>--%>
<%--<button id="submitAnsSyncBtn" type="button"
        onclick="syncDataAndStruct()" class="btn btn-success">保存并同步结构
</button>
<c:if test="${info != null}">
    <button id="syncDataBtn" type="button" class="btn btn-success">
        同步数据
    </button>
</c:if>--%>