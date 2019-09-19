<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<label class="span3">选择栏目: <select id="crmCatalog"
	multiple="multiple">

		<c:set value="-1" var="group"></c:set>

		<c:forEach items="${crmCatalogList}" var="crmCatalog">
			<c:if test="${group eq '-1' and '2' eq  crmCatalog.categoryid}">
				<optgroup label="电视剧 <span style='color:red;'>(点击全选)</span>">
					<c:set value="1" var="group"></c:set>
			</c:if>
			<c:if test="${crmCatalog.categoryid  eq '7'}">
				</optgroup>
				<optgroup label="其他<span style='color:red;'>(点击全选)</span>">
			</c:if>
			<option value="${crmCatalog.id }">${crmCatalog.name }</option>



		</c:forEach>
		</optgroup>
</select></label>