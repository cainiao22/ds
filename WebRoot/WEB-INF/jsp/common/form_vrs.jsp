<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id="form_vrs">
	<label class="groupName">专辑筛选: </label> <label class="span3">
		栏目: <select id="vrs_catalog_one" multiple="multiple">
	</select>
	</label> <label class="span3"> 产地: <select id="vrs_catalog_two"
		multiple="multiple">
	</select></label>
</div>
<div class="group clearfix" id="form_vrs">
	<label class="groupName" style="visibility: hidden;">专辑筛选: </label><label
		class="span3">选择类型: <select id="vrstype">
			<option value="1">专辑</option>
			<option value="2">MRS</option>
			<option value="3">广告产品</option>
	</select></label> <label class="span9" for="#none"> ID: <select id="idlimit"
		style="width: auto;">
			<option value="1">等于(多)</option>
			<option value="2">大于等于</option>
			<option value="3">小于等于</option>
			<option value="4">大于</option>
			<option value="5">小于</option>
			<!-- 	<option value="6">不等于(多)</option> -->
	</select><input type="text" id="vrstypeid" class="input-medium"
		style="width: 180px;" /> 名称: <select id="vrsnamelimit"
		style="width: auto;">
			<option value="2">包含(多)</option>
			<option value="1">等于(多)</option>
			<option value="3">不包含</option>
			<option value="4">开头是</option>
			<option value="5">结尾是</option>
			<!-- 	<option value="6">不等于(多)</option> -->
	</select><input type="text" id="vrstypename" class="input-medium"
		style="width: 180px;" /></label>
</div>
