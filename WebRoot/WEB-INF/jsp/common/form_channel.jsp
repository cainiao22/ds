<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id="form_channel">
	<label class="groupName">渠道筛选: </label> <label class="span3">
		大渠道: <select id="channel_one">
			<option value="-1">选择</option>
	</select>
	</label> <label class="span3"> 小渠道: <select id="channel_two">
			<option value="-1">选择</option>
	</select></label> <label class="span3"> 推广码: <input type="text"
		id="channel_three" class="input-medium" /></label>
</div>
