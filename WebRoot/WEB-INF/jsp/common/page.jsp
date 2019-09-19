<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="pagination pagination-right ">
	<ul>
		<li <c:if test="${param.currentPage eq 1 }">class="active" </c:if>><a
			href="${param.url }&page=1">第一页</a></li>
		<c:if test="${param.currentPage >=10 }">
			<li class="disabled"><a href="javaScript:void(0);">...</a></li>
		</c:if>
		<c:forEach begin="1" end="${param.totalPage }" var="p">
			<c:set value="${p-param.currentPage}" var="flag"></c:set>
			<c:set value="${param.totalPage-param.currentPage}" var="flag1"></c:set>
			<c:if test="${flag <=5 and flag >=-5 }">
				<li <c:if test="${param.currentPage eq p }">class="active"</c:if>><a
					href="${param.url }&page=${p}">${p}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${flag1 >=10 }">
			<li class="disabled"><a href="javaScript:void(0);">...</a></li>
		</c:if>
		<li
			<c:if test="${param.currentPage eq param.totalPage or param.totalPage eq 0 }">class="active"</c:if>><a
			href="${param.url }&page=${param.totalPage}">最后一页</a></li>
	</ul>
	<span style="padding-top: 60px;">共计: ${param.totalCount } 项
		,${param.totalPage } 页</span>
</div>

