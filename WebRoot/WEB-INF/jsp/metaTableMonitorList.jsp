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

</head>
<body>
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
</script>
<c:import url="common/top.jsp"></c:import>

<div class="body clearfix">
    <c:import url="common/sitebar.jsp"></c:import>
    <div class="main">
        <div id="ReportWrapper" class="content clearfix">
            <div class="title-bar clearfix">
                <h1 class="l">
                    <a href="metaTableList">数据仓库</a>->${metaTable.name } (${metaTable.alias})
                    <a href="metaTableManage?id=${metaTable.id}">查看与修改 </a>| <a
                        href="metaFieldList?tableId=${metaTable.id}">查看字段 </a>| <a
                        href="etlJobQueue?etlJobId=${metaTable.id}">调度队列 </a>

                </h1>
            </div>
        </div>
        <div class="section" id="Tabs">
            <div class="tabs">
                <ul class="clearfix">
                </ul>
            </div>
        </div>


        <form action="./metaFieldList" method="get">
            <div>
                <button id="addBtn" type="button" class="btn btn-success"
                        onclick="javascript:gourl('./metaTableMonitorAdd?id=${metaTable.id}');">添加
                </button>
            </div>
        </form>
        <div class="section" id="Tabs">
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
                            <c:if test="${item.enableMonitor eq 1}"> 是 </c:if>
                            <c:if test="${item.enableMonitor eq 0}"> 否 </c:if>
                        </td>
                        <td>${item.valueMax}</td>
                        <td>${item.valueMin}</td>
                        <td>${item.monitorjobScheduleHour}点${item.monitorjobScheduleMinute}分</td>
                        <td>${item.priority}</td>

                        <td><a href="./metaTableMonitorManage?id=${item.id}">修改</a> |
                            <a
                                    href="javascript:void(0)"
                                    onclick="deleteItem('./metaTableMonitorDelete?id=${item.id}&metaTableId=${item.metaTableId}')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
<c:import url="common/foot.jsp"></c:import>
</body>
</html>