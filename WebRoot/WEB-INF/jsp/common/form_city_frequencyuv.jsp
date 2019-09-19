<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id='form_uvcity'>
	<label class="groupName">地域筛选: </label> <label class="span3">
		国家: <select id="city_state">
	</select>
	</label> <label class="span3"> 省区: <select id="city_province">
			<option value="-1">选择</option>
	</select></label> <label class="span3"> 城市: <select id="city_city">
			<option value="-1">选择</option>
	</select></label>
</div>
