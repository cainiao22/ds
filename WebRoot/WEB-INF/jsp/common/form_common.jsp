<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span3">开始日期:
		<input type="text" value="" id="from" class="input-medium" />
	</label> <label class="span3">结束日期: <input type="text" value="" id="to"
		class="input-medium" /></label> <label class="span3">按日显示: <input
		type="checkbox" id="byday" /></label>
</div>

<div class="group clearfix" id="form_common_platform">
	<label class="groupName" style="visibility: hidden;">平台筛选: </label> <label
		class="span3">终端分组: <select id="common_platform_one">
			<option value='-1'>全部</option>
	</select></label><label class="span3">终端类型: <select id="common_platform_two">
			<option value="-1">全部</option>
	</select></label><label class="span3">操作系统: <select id="common_platform_three">
			<option value="-1">全部</option>
	</select></label> <label class="span3">应用类型: <select id="common_platform_four">
			<option value="-1">全部</option>
	</select></label>

</div>
<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">常规条件: </label> <label
		class="span3">广告形式: <select id="adstyle" multiple="multiple">

			<c:set value="-1" var="group"></c:set>


			<c:forEach items="${adStyleList}" var="adStyle" varStatus="vaStatus">

				<c:if test="${group eq  adStyle.group}">
					<option value="${adStyle.code }">${adStyle.name }</option>
				</c:if>
				<c:if test="${group ne  adStyle.group}">
					<c:if test="${group ne  '-1'}">
						</optgroup>
					</c:if>
					<optgroup label="${adStyle.group }">
						<option value="${adStyle.code }">${adStyle.name }</option>
						<c:set value="${adStyle.group }" var="group"></c:set>
				</c:if>

				<c:if test="${vaStatus.last}">
					</optgroup>
				</c:if>
			</c:forEach>
	</select></label> <label class="span3">广告范围: <select id="scope">
			<option value="-1">全部</option>
			<c:forEach items="${scopeList}" var="scope">
				<option value="${scope.id }">${scope.name }</option>
			</c:forEach>
	</select></label><label class="span3">视频时长: <select id="duration_select">
			<option value="-1">全部</option>
			<c:forEach items="${durationList}" var="duration">
				<option value="${duration.id }">${duration.name }</option>
			</c:forEach>
			<option value="-2">自定义时长</option>
	</select>

	</label> <label id="diyDuration" class="span3" for="#none"
		style="color: blue; display: none;">从:<input type="text"
		style="width: 77px;" id="duration_b" />到:<input type="text"
		style="width: 77px;" id="duration_e" /></label>

</div>


<div class="separator"></div>