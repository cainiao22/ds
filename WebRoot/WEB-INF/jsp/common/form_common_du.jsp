<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<label class="span3">视频时长: <select id="duration_select">
		<option value="-1">全部</option>
		<c:forEach items="${durationList}" var="duration">
			<option value="${duration.id }">${duration.name }</option>
		</c:forEach>
		<option value="-2">自定义时长</option>
</select>

</label>
<label id="diyDuration" class="span3" for="#none"
	style="color: blue; display: none;">从:<input type="text"
	style="width: 77px;" id="duration_b" />到:<input type="text"
	style="width: 77px;" id="duration_e" /></label>
