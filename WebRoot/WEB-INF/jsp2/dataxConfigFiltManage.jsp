<%@ page import="java.net.URL" %>
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
    <c:import url="common/global_style.jsp"></c:import>
    <link  href="./assets/global/plugins/select2/css/select2.min.css"
           rel="stylesheet" type="text/css" />
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
                              id="dataxForm">
                            <div class="portlet light bordered">
                                <div class="portlet-body form">
                                    <div class="form-body">
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
                                                        <select id="metaDataTypeSelect" name="dataBaseType"
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

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">数据库帐号: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="username"
                                                                   name="username" class="form-control" value="" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">数据库密码: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="password"
                                                                   name="password" class="form-control" value="" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">数据库地址: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="jdbcUrl"
                                                                   name="jdbcUrl" class="form-control" value="" readonly="true"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">HDFS地址: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="defaultFS"
                                                                   name="defaultFS" class="form-control" value="hdfs://\${nameservice}/"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">路径: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="path"
                                                                   name="path" class="form-control" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">生成文件的名称: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="fileName"
                                                                   name="fileName" class="form-control" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">分割符: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="fieldDelimiter"
                                                                   name="fieldDelimiter" class="form-control" value="\u0001"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">writeMode: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="writeMode"
                                                                   name="writeMode" class="form-control" value="append"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6" style="display: none">
                                                    <label class="col-md-3 control-label">查询sql: &nbsp;&nbsp;</label>
                                                    <textarea
                                                            id="sql" name="querySql"  class="form-control" rows="3" cols="26" style="margin: 10px; width: 350px; height: 50px;"
                                                    ></textarea>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">源表名: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="tableName"
                                                                   name="tableName" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">压缩格式: </label>
                                                        <div class="col-md-9">
                                                            <input type="text" id="compress"
                                                                   name="compress" class="form-control" value="gzip"/>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <input id="submitBtn" type="button" value="生成JSON文件" class="btn btn-success"/>
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
<!-- END CONTAINER -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" >
                <textarea id="hh" rows="3" cols="26" style="margin: 1px; width: 570px; height: 428px;"></textarea>
            </div>
            <input type="hidden" id="jsonPath" />
            <div class="modal-footer">
                <button type="button" class="btn btn-default"  data-dismiss="modal" id="close">关闭
                </button>
                <button type="button" onclick="downloadJsonFile()" class="btn btn-primary">
                    下载JSON文件
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
<c:import url="common/footer.jsp"></c:import>
</div>
<script src="./assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.js"
        type="text/javascript"></script>
<script type='text/javascript'>
$(function () {
    $("#metaConfigkeySelect").select2();
})
    //生成JSON文件方法
    $('#submitBtn').click(function () {
        $.ajax({
            url:"./createJsonFile",
            type:"post",
            data:$("#dataxForm").serialize(),
            dataType:"json",
            success:function (data) {
                if(data.success){
                    console.log("data",data);
                    $("#jsonPath").val(data.jsonPath);//json文件路径,用于删除和下载使用
                   $.ajax({
                       url:"./json/"+data.fileName+".json",//读取json文件
                       dataType:"text",
                       async:false,
                       success:function (data) {
                           $("#hh").html(data);//将json文件写入文本域
                           $("#myModal1").modal("show");  //显示模态框
                           $("#myModal").modal({ backdrop: "static", keyboard: false });
                       }
                   });
                }else{
                    console.log("errMsg",data.errInfo);
                    alert(data.msg);
                }
            }
        })
    });

    //下载Json文件方法
    function downloadJsonFile() {
        location.href = "./downloadJsonFile?jsonPath="+$("#jsonPath").val();
    }

    $('#close').confirmation({
        animation: true,
        placement: "top",
        title: "请确认JSON文件已经保存完毕!!",
        btnOkLabel: '确定',
        btnCancelLabel: '取消',
        onConfirm: function () {
            $.ajax({
                url:"./delJsonFile",
                type:"post",
                data:{"jsonPath":$("#jsonPath").val()},
                dataType:"json",
                success:function (data) {
                    if(data.success){
                        swal("提示", data.msg);
                    }
                }
            })
            $("#myModal").modal("hide"); //这个需要最后写
            $("#myModal").on("hidden.bs.modal", function () {
                $(this).removeData("modal"); //清除数据 当模态框对用户隐藏时发生
            });
        },
        onCancel: function () {

        }
    })

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

    $("#metaConfigkeySelect").change(function(){
        $.ajax({
            url:"./queryDataBaseInfo",
            type:"post",
            dataType:"json",
            data:$("#dataxForm").serialize(),
            success:function (data) {
                if(data.success){
                    console.log("data",data);
                    $("#username").val(data.metaConfigValueModel.user);
                    $("#password").val(data.metaConfigValueModel.password);
                    $("#jdbcUrl").val(data.metaConfigValueModel.url);
                }else{
                    console.log("errInfo",data.errInfo);
                }
            }
        })
    });

</script>
</body>
</html>