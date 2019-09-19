<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' type='text/css'
	href="bootstrap/css/bootstrap.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h3 style="text-align: center;">${report.title }</h3>
<table
					class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
						
						
						<c:forEach items="${report.groupFieldList }" var="groupField">
						<c:if test="${ not empty groupField.segment}">
								<th>${groupField.displayName}</th>
								</c:if>
							</c:forEach>
							
							
						<c:forEach items="${report.meterFieldList }" var="meterField">
							<th>${meterField.displayName }</th>
							</c:forEach>
						</tr>
					</thead>

					<c:forEach items="${resultList}" var="result">
						<tr>
						<c:forEach items="${report.groupFieldList }" var="groupField">
							<c:if test="${ not empty groupField.segment}">
								<td>${result.get(groupField.column)}</td>
								</c:if>
							</c:forEach>
						<c:forEach items="${report.meterFieldList }" var="meterField">
							<td>${result.get(meterField.column)}</td>
							</c:forEach>
						</tr>
					</c:forEach> 
					</tbody>
				</table>
</body>
</html>