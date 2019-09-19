<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<label class="span">排期包类型: <select id="pkgtype"
	multiple="multiple">



		<c:forEach items="${BOOKPKGTYPE}" var="pkgtype" varStatus="vaStatus">

			<option value="${pkgtype}">${pkgtype}</option>
		</c:forEach>
</select></label>