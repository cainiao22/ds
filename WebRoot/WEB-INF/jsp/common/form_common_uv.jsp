<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span3">报表类型:
		<select id="reporttype">
			<option value="1">日报</option>
			<option value="2">月报</option>
	</select>
	</label> <label class="span3">开始日期: <input type="text" value=""
		id="from" class="input-medium" />
	</label> <label class="span3">结束日期: <input type="text" value=""
		id="to" class="input-medium" /></label> <label class="span3"
		style="display: none;">选择年份: <select id="year">
			<option value="2015">2015</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
	</select></label> <label class="span3" style="display: none;">开始月份: <select
		id="from_month">
			<option value="-1">选择</option>
	</select></label> <label class="span3" style="display: none;">结束月份: <select
		id="to_month">
			<option value="-1">选择</option>
	</select></label>
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
