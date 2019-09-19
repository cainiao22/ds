<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>社区日报</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <link href="./assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="./assets/travel_dashborad/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="./assets/travel_dashborad/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="./assets/plugin/datepicker/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
    <link href="./assets/plugin/select2/css/select2.css" rel="stylesheet" type="text/css"/>

    <link href="./assets/global/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="./assets/global/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="./assets/global/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .link div {
            float: left;
            padding-left: 10px;
        }

        select {
            width: 90%;
        }

        .tcenter {
            text-align: center;
            margin-bottom: 0px;
        }

        .tright {
            text-align: right;
            margin-top: 0px;
        }

        .tab-pane {
            padding: 10px 20px 30px 20px;
        }

        .nextform, .nextform option {
            background-color: #2a323c;
            border-radius: 4px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: none;
            height: 28px;
            color: #ffffff;
            font-size: 14px;
            cursor: pointer;
        }

        .dropdown-menu {
            background-color: #323c48;
        }

        .datepicker {
            border: 1px solid #232a32;
            padding: 8px;
        }

        .form-control {
            background-color: #2a323c;
        }

        .form-control:focus {
            background: #2a323c;
        }

        .datepicker th {
            font-size: 14px !important;
            color: #ffffff;
        }

        .datepicker tfoot tr th:hover {
            background: #2a323c;
        }

        .datepicker table tr td.day.focused {
            background: #2a323c;
            cursor: pointer;
        }

        .datepicker table tr td.today, .datepicker table tr td.today:hover, .datepicker table tr td.today.disabled, .datepicker table tr td.today.disabled:hover {
            background-color: #3b4655;
            background-image: linear-gradient(to bottom, #3b4655, #3b4655);
        }

        .datepicker table tr td.range.today:hover, .datepicker table tr td.range.today:hover:hover, .datepicker table tr td.range.today.disabled:hover, .datepicker table tr td.range.today.disabled:hover:hover, .datepicker table tr td.range.today:active, .datepicker table tr td.range.today:hover:active, .datepicker table tr td.range.today.disabled:active, .datepicker table tr td.range.today.disabled:hover:active, .datepicker table tr td.range.today.active, .datepicker table tr td.range.today:hover.active, .datepicker table tr td.range.today.disabled.active, .datepicker table tr td.range.today.disabled:hover.active, .datepicker table tr td.range.today.disabled, .datepicker table tr td.range.today:hover.disabled, .datepicker table tr td.range.today.disabled.disabled, .datepicker table tr td.range.today.disabled:hover.disabled, .datepicker table tr td.range.today[disabled], .datepicker table tr td.range.today:hover[disabled], .datepicker table tr td.range.today.disabled[disabled], .datepicker table tr td.range.today.disabled:hover[disabled] {
            background-image: linear-gradient(to bottom, #3c4857, #3c4857);
        }

        .datepicker table tr td.day:hover,
        .datepicker table tr td.day.focused {
            background: #2a323c;
            cursor: pointer;
        }

        .datepicker table tr td.range, .datepicker table tr td.range:hover, .datepicker table tr td.range.disabled, .datepicker table tr td.range.disabled:hover {
            background: #3c4857;
        }

        .datepicker .datepicker-switch:hover,
        .datepicker .prev:hover,
        .datepicker .next:hover,
        .datepicker tfoot tr th:hover {
            background: #2a323c;
        }

        .input-group-addon {
            border-radius: 2px;
            background-color: #323c48;
            color: #ffffff;
            border: 1px solid #323c48;
        }

        .datepicker table tr td.active, .datepicker table tr td.active:hover, .datepicker table tr td.active.disabled, .datepicker table tr td.active.disabled:hover {
            background-color: #2a323c !important;
        }
        .dataTables_processing{
            z-index: 555;
            color: #fff;

        }
        div.dataTables_processing {
            background: linear-gradient(to right, rgba(255, 255, 255, 0) 0%, rgb(42, 50, 60) 25%, rgb(42, 50, 60) 75%, rgba(255, 255, 255, 0) 100%);
        }
        .date {
            background-color: #2a323c;
            height: 30px;
            padding: 5px 10px;
            font-size: 12px;
            line-height: 1.5;
            border-radius: 3px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
            text-align: center;
        }
    </style>
</head>
<body class="fixed-left">
<div id="wrapper">
    <div class="content-page">
        <div class="content">
            <div class="">
                <div class="page-header-title">
                    <h4 class="page-title">社区日报</h4>
                </div>
            </div>
            <div class="page-content-wrapper ">
                <div class="container">
                    <div class="row">
                        <div class="form-group col-lg-6">
                            <label class="col-lg-2 control-label">数据周期：</label>
                            <div class="">
                                <input type="text" class="span2 input-append date">
                                <!--<span class="add-on"><i class="ion-calendar"></i></span>-->
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-4">
                            <div class="form-group">
                                <label class="col-lg-2 control-label">地域:</label>
                                <div class="col-lg-5">
                                    <select id="city">
                                        <option value="">地域</option>
                                    </select>
                                </div>
                                <div class="col-lg-5">
                                    <select id="community">
                                        <option value="">社区</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-lg-2">
                            <button type="button" class="btn btn-info waves-effect waves-light fa fa-search"
                                    onclick="getData()">搜&nbsp;&nbsp;&nbsp;&nbsp; 索
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-primary">
                                <div class="panel-body">
                                   <%-- <h4 class="m-b-30 m-t-0">社区日报</h4>--%>
                                    <div class="col-xs-6 col-sm-1" style="float: right">
                                        <a class="btn btn-default buttons-excel buttons-html5 btn-success" onclick="exportExcel()">
                                            <span>导出</span>
                                        </a>
                                    </div>
                                    <table id="datatable-buttons" class="table table-striped table-bordered" style="width: 300%">
                                        <thead>
                                        <tr>
                                            <th>城市ID</th>
                                            <th>城市</th>
                                            <th>社区ID</th>
                                            <th>社区</th>
                                            <th>实际上线户数</th>
                                            <th>入住户数</th>
                                            <th>是否有门禁</th>
                                            <th>是否开通物业缴费</th>
                                            <th>是否开通报事功能</th>
                                            <th>累计注册人数</th>
                                            <th>累计绑定房屋数</th>
                                            <th>累计绑定人数</th>
                                            <th>新增注册人</th>
                                            <th>新增绑定房屋</th>
                                            <th>新增绑定人</th>
                                            <th>绑定率</th>
                                            <th>渗透率</th>
                                            <th>活跃率</th>
                                            <th>活跃人数</th>
                                            <th>活跃次数</th>
                                            <th>GMV单量</th>
                                            <th>GMV金额</th>
                                            <th>物业缴费额</th>
                                            <th>物业缴费人数</th>
                                            <th>通行人数</th>
                                            <th>通行次数</th>
                                            <th>app通行人数</th>
                                            <th>app通行次数</th>
                                            <th>公告人数</th>
                                            <th>报事人数</th>
                                            <th>报事次数</th>
                                            <th>物业公司</th>
                                            <th>开发商</th>
                                            <th>APP上线时间</th>
                                            <th>门禁上线时间</th>
                                            <th>是否开通wx</th>
                                            <th>是否开通app</th>
                                        </tr>
                                        </thead>
                                        <tbody style="width: 240%"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            2017 ©千丁互联
        </footer>
    </div>
</div>

<script src="./assets/travel_dashborad/js/jquery.min.js"></script>
<script src="./assets/global/plugins/bootstrap-table/bootstrap-table.min.js" type="text/javascript"></script>
<script src="./assets/global/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="./assets/travel_dashborad/js/modernizr.min.js"></script>
<script src="./assets/travel_dashborad/js/detect.js"></script>
<script src="./assets/travel_dashborad/js/fastclick.js"></script>
<script src="./assets/travel_dashborad/js/jquery.slimscroll.js"></script>
<script src="./assets/travel_dashborad/js/jquery.blockUI.js"></script>
<script src="./assets/travel_dashborad/js/waves.js"></script>
<script src="./assets/travel_dashborad/js/wow.min.js"></script>
<script src="./assets/travel_dashborad/js/jquery.nicescroll.js"></script>
<script src="./assets/travel_dashborad/js/jquery.scrollTo.min.js"></script>
<script src="./assets/global/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="./assets/global/plugins/datatables/dataTables.bootstrap.js"></script>
<script src="./assets/plugin/datepicker/js/bootstrap-datepicker.js"></script>
<script src="./assets/plugin/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="./assets/plugin/select2/js/select2.js"></script>
<script src="./assets/travel_dashborad/js/moment-with-locales.min.js"></script>
<script src="./js/communityReport.init.js"></script>
</body>
</html>