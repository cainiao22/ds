<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="group clearfix" id="form_appid">
	<label class="groupName">应用类型: </label> <label class="span3">选择类型:
		<select id="appid">
			<option value="-1">全部</option>
			<c:forEach items="${appidList}" var="appid">
				<option value="${appid.id }">${appid.name }</option>
			</c:forEach>
	</select>
	</label>
</div>