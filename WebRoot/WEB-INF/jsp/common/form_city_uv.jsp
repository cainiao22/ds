<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="group clearfix" id="form_uvcity1">
	<label class="groupName">城市筛选: </label> <label class="span3">
		选择国家: <select id="city_state" multiple="multiple">
	</select>
	</label> <label class="span" style="color: red;">分省显示: <input
		type="checkbox" value="1" name="splitBy" id="splitByProvince" /></label> <label
		class="span2" style="color: red;">分市显示: <input type="checkbox"
		value="1" name="splitBy" id="splitByCity" /></label> <label class="span2">查询类型:
		<input type="radio" name="queryType" value="1" checked="checked" />行政区域
	</label> <label class="span"><input type="radio" name="queryType"
		value="2" />城市类型</label> <label class="span"><input type="radio"
		name="queryType" value="3" />执行单</label> <label class="span"
		style="color: red;"><input type="radio" name="queryType"
		value="4" />搜索</label>
</div>
<div class="group clearfix" id="form_uvcity2">
	<label class="groupName" style="visibility: hidden;">城市筛选: </label> <label
		class="span3"> 选择省区: <select id="city_province">
			<option value="-1">选择</option>
	</select></label> <label class="span3"> 城市类型: <select id="city_type">
			<option value="-1">选择</option>
			<option value="K">KEY</option>
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="T">省会城市</option>
			<option value="Z">直辖市</option>
	</select></label> <label class="span3"> 执行单号: <input type="text"
		id="project-input" class="input-medium" /></label> <label class="span"><input
		type="button" id="project-input_query" class="btn btn-info" value="查询" /></label>

	<label class="span3"> 城市名称: <input type="text"
		id="cityname-input" class="input-medium" /></label> <label class="span"><input
		type="button" id="cityname-input_query" class="btn btn-info"
		value="查询" /></label>
</div>
<div class="group clearfix" id="form_uvcity3">
	<label class="groupName" style="visibility: hidden;">城市筛选: </label> <label
		class="span3"> 可选城市: <select id="city_city"
		multiple="multiple" size="10">
	</select></label> <label style="margin-top: 50px"><input type="button"
		value="选择" id="selbtn" class="btn btn-info" /> </label> <label
		style="margin-top: 90px; margin-left: -50px"><input
		type="button" value="全选" id="allbtn" class="btn btn-info" /></label> <label
		class="span3">已选城市: <select id="city_city_sel"
		multiple="multiple" size="10" style="width: 150px">
	</select></label> <label style="margin-top: 50px;"><input type="button"
		value="删除" id="delbtn" class="btn btn-info" /></label> <label
		style="margin-top: 90px;; margin-left: -50px"><input
		type="button" value="清空" id="emptybtn" class="btn btn-info" /></label>
</div>
