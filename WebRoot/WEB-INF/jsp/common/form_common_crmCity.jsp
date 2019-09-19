<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<label class="span3">选择城市: <select id="crmCity"
	multiple="multiple">


		<c:set value="-1" var="group"></c:set>


		<c:forEach items="${crmCityList}" var="crmCity" varStatus="vaStatus">
			<c:if test="${group ne  crmCity.groupname}">
				<c:if test="${!vaStatus.first}">
					</optgroup>
				</c:if>
				<optgroup
					label="${crmCity.groupname } <span style='color:red;'>(点击全选)</span>">
					<c:set value="${crmCity.groupname }" var="group"></c:set>
			</c:if>

			<option value="${crmCity.id }">${crmCity.name }</option>
			<c:if test="${vaStatus.last}">
				</optgroup>
			</c:if>
		</c:forEach>

</select></label>