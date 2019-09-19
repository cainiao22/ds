<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span3">开始日期:
		<input type="text" value="" id="from" class="input-medium" />
	</label> <label class="span3">结束日期: <input type="text" value="" id="to"
		class="input-medium" /></label> <label class="span3">广告形式: <select
		id="adstyle" multiple="multiple">

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
	</select></label> <label class="span3">选择平台: <select id="adsplatform"
		multiple="multiple">
			<c:forEach var="plat" items="${ADSPLATFORMMAP}">
				<c:if test="${plat.key ne '5' }">
					<option value='${plat.key}'>${plat.value }</option>
				</c:if>
			</c:forEach>
	</select></label>
</div>