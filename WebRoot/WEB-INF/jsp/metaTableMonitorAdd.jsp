‘
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <c:import url="common/title.jsp"></c:import>
    <c:import url="common/cssjs.jsp"></c:import>
    <script type='text/javascript' src="js/roleTableManage.js"></script>
    <script type='text/javascript' src="js/usermanage.js"></script>
</head>
<script type="text/javascript">
    $(function () {

    });
    function checkParam() {
        var valueMax = $("#valueMax").val();
        var valueMin = $("#valueMin").val();
        if(parseFloat(valueMin) > parseFloat(valueMax)){
            alert("最小值不能大于最大值");
            return false;
        }
        return true;
    }
</script>
<body>
<c:import url="common/top.jsp"></c:import>

<div class="body clearfix">
    <c:import url="common/sitebar.jsp"></c:import>
    <div class="main">
        <div id="ReportWrapper" class="content clearfix">
            <div class="title-bar clearfix">
                <h1><a href="metaTableList">数据仓库</a>
                    <c:if test="${ not  empty metaTable }">
                        ->${metaTable.name } (${metaTable.alias})
                        <a href="metaTableManage?id=${metaTable.id}">查看与修改 </a>| <a
                            href="metaFieldList?tableId=${metaTable.id}">查看字段 </a>| <a
                            href="etlJobQueue?etlJobId=${metaTable.id}">调度队列 </a>
                    </c:if>
                </h1>

            </div>
        </div>

        <div class="section" id="Tabs">
            <div class="tabs">
                <ul class="clearfix">
                </ul>
            </div>
        </div>


        <div class="filters section" id="FilterTabs">
            <div class="tab-contents">
                <ul>
                    <li style="">

                        <form class="form-inline" action="./metaTableMonitorSave" method="POST" onsubmit="return checkParam();"
                              id="form">
                            <input type="hidden" name="id" id="id" value="${metaTableMonitor.id }"/>
                            <input type="hidden" name="metaTableId" id="metaTableId" value="${metaTable.id }"/>
                            <div class="filter table-indicator" id="TableIndicator">
                                <div class="group clearfix">
                                    <label class="span6"><span class="labelSpan">规则名称:</span> <input type="text"
                                                                                                    id="monitorName"
                                                                                                    name="monitorName"
                                                                                                    class="input-large"
                                                                                                    value="${metaTableMonitor.monitorName }"></label>

                                </div>
                                <div class="group clearfix">
                                    <label class="span6"><span class="labelSpan">最大值:</span> <input type="text"
                                                                                                    id="valueMax"
                                                                                                    name="valueMax"
                                                                                                    class="input-large"
                                                                                                    value="${metaTableMonitor.valueMax }"></label>

                                    <label class="span6"><span class="labelSpan">最小值:</span> <input type="text"
                                                                                                    id="valueMin"
                                                                                                    name="valueMin"
                                                                                                    class="input-large"
                                                                                                    value="${metaTableMonitor.valueMin }"></label>

                                </div>

                                <div class="group clearfix">
                                    <label class="span12"> <span class="labelSpan">是否启用:</span><select id="enableMonitor"
                                                                                                       name="enableMonitor">
                                        <option value="0" <c:if
                                                test="${ metaTableMonitor.enableMonitor eq 0 }"> selected=selected </c:if>>关闭
                                        </option>
                                        <option value="1" <c:if
                                                test="${ metaTableMonitor.enableMonitor eq 1 }"> selected=selected </c:if>>开启
                                        </option>
                                    </select>
                                    </label>
                                </div>
                                <div class="group clearfix">
                                    <label class="span12"> <span class="labelSpan">定时调度:</span>
                                        <select id="monitorjobScheduleHour" name="monitorjobScheduleHour">
                                            <option value='-1'>小时</option>
                                            <c:forEach begin="0" end="23" var="etlJobScheduleHour">
                                                <option value='${ etlJobScheduleHour}'
                                                        <c:if test="${ metaTableMonitor.monitorjobScheduleHour eq etlJobScheduleHour }"> selected=selected </c:if>>
                                                        ${ etlJobScheduleHour}点
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <select id="monitorjobScheduleMinute" name="monitorjobScheduleMinute">
                                            <option value='-1'>分钟</option>
                                            <c:forEach begin="0" end="59" var="etlJobScheduleMinute">

                                                <option value='${ etlJobScheduleMinute}'
                                                        <c:if test="${ metaTableMonitor.monitorjobScheduleMinute eq etlJobScheduleMinute }"> selected=selected </c:if>>
                                                        ${ etlJobScheduleMinute}分
                                                </option>
                                            </c:forEach>
                                        </select><span style="color:red;">(目前支持每天定时执行)</span>
                                    </label>
                                    <label class="span12"> <span class="labelSpan">优先级:</span><select id="priority"
                                                                                                      name="priority"
                                                                                                      style="width: 100px">
                                        <c:forEach var="priority" begin="1" end="10">

                                            <option value='${ priority}'
                                                    <c:if test="${ metaTableMonitor.priority eq priority }"> selected=selected </c:if>>
                                                    ${ priority}</option>
                                        </c:forEach>
                                    </select><span style="color:red;">(数字越大，优先级越高，默认推荐5)</span>
                                    </label>
                                    <label class="span12"> <span class="labelSpan">SQL内容:</span>

                                        <textarea id="monitorSql"
                                                  name="monitorSql" class="input-large" rows="5" cols="16"
                                                  style="width: 571px; height: 180px;"
                                        > ${metaTableMonitor.monitorSql }</textarea>
                                    </label>
                                </div>
                            </div>


                        </form>
                    </li>
                </ul>
            </div>
        </div>

        <div class="buttons" style="text-align: center;">

            <button id="submitBtn" type="button" class="btn btn-success">确定</button>
        </div>
    </div>
</div>
<c:import url="common/foot.jsp"></c:import>
</body>
</html>