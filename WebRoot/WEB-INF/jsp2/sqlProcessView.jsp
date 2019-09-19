<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>千丁大数据平台</title>
    <link href="./assets/global/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" type="text/css" />
    <link href="./assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="./assets/global/plugins/bootstrap-toastr/toastr.css" rel="stylesheet" type="text/css" />
    <script src="./assets/global/plugins/jquery.min.js"
            type="text/javascript"></script>
    <script src="./assets/global/plugins/bootstrap-table/bootstrap-table.js"
            type="text/javascript"></script>
    <script src="./assets/global/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"
            type="text/javascript"></script>
    <script src="./assets/global/plugins/bootstrap-sweetalert/sweetalert.js" type="text/javascript"></script>
    <script src="./assets/global/plugins/bootstrap-toastr/toastr.js" type="text/javascript"></script>
</head>
<body>
<table id="table"></table>

</body>
<script type="text/javascript">
    $(function(){
        TableObj.onTableInit();
    });
    var TableObj = {
        onTableInit:function () {
            $('#table').bootstrapTable({
                //请求方法
                method: 'get',
                //是否显示行间隔色
                striped: true,
                //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                cache: false,
                //是否显示分页（*）
                pagination: true,
                //是否启用排序
                sortable: false,
                //排序方式
                //初始化加载第一页，默认第一页
                //我设置了这一项，但是貌似没起作用，而且我这默认是0,- -
                //pageNumber:1,
                //每页的记录行数（*）
                pageSize: 10,
                //可供选择的每页的行数（*）
                pageList: [10, 25, 50, 100],
                //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据
                url: "dataApiQuery/dwQueryMonitor",
                //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
                //queryParamsType:'',
                ////查询参数,每次调用是会带上这个参数，可自定义
                queryParams : function(params) {
                    return {
                        page: Math.floor(params.offset/params.limit)+1,
                        pageCount: params.limit,
                    };
                },
                //分页方式：client客户端分页，server服务端分页（*）
                sidePagination: "client",
                //是否显示搜索
                search: false,
                //Enable the strict search.
                strictSearch: true,
                //Indicate which field is an identity field.
                idField : "id",
                columns: [
                    {
                        field: 'time_used',
                        title: '耗时',
                        align: 'center',
                        formatter:function(time_used,row){
                            var result = "";
                            if(time_used.days != 0){
                                result += time_used.days + "天"
                            }
                            if(time_used.hours != 0){
                                result += time_used.hours + "小时"
                            }
                            if(time_used.minutes != 0){
                                result += time_used.minutes + "分钟"
                            }
                            if(time_used.seconds != 0){
                                result += time_used.seconds + "秒"
                            }
                            return result;
                        }
                    },
                    {
                        field: 'query_start',
                        title: '开始时间',
                        align: 'center'
                    },
                    {
                        field: 'current_query',
                        title: '查询内容',
                        align: 'center'
                    },
                    {
                        field: 'procpid',
                        title: '进程ID',
                        align: 'center'
                    },

                    {
                        title: '用户名',
                        field: 'usename',
                        align: 'center',
                    },
                    {
                        field: 'datname',
                        title: '数据库',
                        align: 'center'
                    },
                    {
                        field: 'client_addr.value',
                        title: '客户端IP',
                        align: 'center',
                    },
                    {
                        title: '操作',
                        align: 'center',
                        formatter:function(value,row){
                            return '<a href="#" onclick="killProcess(' + row.procpid + ')" >kill</a>';
                        }
                    }

                ],
                pagination:true
            });

        }
    }

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": 5000,
        "hideDuration": 1000,
        "timeOut": 5000,
        "extendedTimeOut": "0",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    function killProcess(processId) {
        swal({
            title: "操作提示",      //弹出框的title
            text: "确定删除吗？",   //弹出框里面的提示文本
            type: "warning",        //弹出框类型
            showCancelButton: true, //是否显示取消按钮
            confirmButtonColor: "#DD6B55",//确定按钮颜色
            cancelButtonText: "取消",//取消按钮文本
            confirmButtonText: "确定",//确定按钮上面的文档
            closeOnConfirm: true
        }, function () {
            $.ajax({
                type: "post",
                url: "dataApiQuery/pg_cancel_backend",
                data: { "procpid":  processId},
                success: function (data) {
                    if (data.code == 0) {
                        toastr.success('操作成功');

                        $('#table').bootstrapTable('refresh');
                    }
                },
                error: function () {
                    toastr.error('操作失败');
                },
                complete: function () {

                }

            });
        });
    }
</script>
</html>