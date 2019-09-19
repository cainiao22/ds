<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span3">开始日期:
		<input type="text" value="" id="from" class="input-medium" />
	</label> <label class="span3">结束日期: <input type="text" value="" id="to"
		class="input-medium" /></label> <label class="span3">按日显示: <input
		type="checkbox" id="byday" /></label>
</div>

<div class="group clearfix" id="form_common_platform">
	<label class="groupName" style="visibility: hidden;">平台筛选: </label> <label
		class="span3">终端分组: <select id="common_platform_one">
			<option value='-1'>全部</option>
	</select></label><label class="span3">终端类型: <select id="common_platform_two">
			<option value="-1">全部</option>
	</select></label><label class="span3">操作系统: <select id="common_platform_three">
			<option value="-1">全部</option>
	</select></label> <label class="span3">应用类型: <select id="common_platform_four">
			<option value="-1">全部</option>
	</select></label>

</div>
<div class="separator"></div>

