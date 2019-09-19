<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="authority"%>
<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span3">开始日期:
		<input type="text" value="" id="from" class="input-medium" />
	</label> <label class="span3">结束日期: <input type="text" value="" id="to"
		class="input-medium" /></label> <label class="span3">执行单号: <input
		type="text" value="" id="projectnumber" class="input-medium" /></label> <label
		class="span3">执行单ID: <input type="text" value=""
		id="projectid" class="input-medium" /></label>
</div>
<div class="group clearfix" id="form_common2">
	<label class="groupName">业务人员: </label> <label class="span3">
		BI: <select id="bi">
			<option value="-1">不限</option>
			<c:forEach var="BIUser" items="${BIUsers }">
				<option value="${BIUser.id}">${BIUser.realname }</option>
			</c:forEach>
	</select>
	</label> <label class="span3"> 媒介: <select id="media">
			<option value="-1">不限</option>
			<c:forEach var="mediaUser" items="${mediaUsers }">
				<option value="${mediaUser.id }">${mediaUser.realname }</option>
			</c:forEach>
	</select></label>
</div>
<div class="separator"></div>
