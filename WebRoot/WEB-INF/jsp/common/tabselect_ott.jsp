<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="authority"%>
<div class="tabs filter-tabs">
	<ul class="clearfix selected">
		<my:hasAuthority module="ottByChannel">
			<li <c:if test="${path eq 'ottByChannel'}"> class="selected" </c:if>><a
				class="trackable" href="ottByChannel">OTT渠道报表</a></li>
		</my:hasAuthority>
		<my:hasAuthority module="ottByChannelReqAndStock">
			<li
				<c:if test="${path eq 'ottByChannelReqAndStock'}"> class="selected" </c:if>><a
				class="trackable" href="ottByChannelReqAndStock">OTT渠道请求与上报报表</a></li>
		</my:hasAuthority>

	</ul>
</div>