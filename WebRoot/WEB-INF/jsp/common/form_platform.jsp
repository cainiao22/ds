<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id="form_platform">
	<label class="groupName">平台筛选: </label> <label class="span3">终端分组:
		<select id="platform_one">
			<option value='-1'>全部</option>
	</select>
	</label><label class="span3">终端类型: <select id="platform_two">
			<option value="-1">全部</option>
	</select></label> <label class="span3">操作系统: <select id="platform_three">
			<option value="-1">全部</option>
	</select></label> <label class="span3">应用类型: <select id="platform_four">
			<option value="-1">全部</option>
	</select></label>
</div>
