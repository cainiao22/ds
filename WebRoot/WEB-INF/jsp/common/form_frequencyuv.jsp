<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span3">统计日期:
		<input type="text" value="" id="from" class="input-medium" />
	</label> <label class="span3">时间周期: <select id="reporttype">
			<option value="0">当天</option>
			<c:forEach var="reporttype" begin="1" end="8">

				<option value="${reporttype}">过去${reporttype}周</option>
			</c:forEach>
	</select></label> <label class="span3">广告形式: <select id="adstyle">

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
	</select></label>
</div>