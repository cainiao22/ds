<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="group clearfix" id='form_city'>
	<label class="groupName">定向城市: </label> <label class="span3">城市过滤:
		<select id="citytype">
			<option value="1">按热点城市查询</option>
			<option value="2">按行政城市查询</option>
			<option value="3">按直辖市查询</option>
	</select>
	</label> <label class="span3">热点城市: <select id="hot_city">
			<option value="-1">选择</option>
			<option value="K">Key类城市</option>
			<option value="A">A类城市</option>
			<option value="B">B类城市</option>
	</select></label> <label class="span3"> 省区: <select id="province">
			<option value="-1">选择</option>
	</select></label>
</div>



<div class="group clearfix" id="form_city3">
	<label class="groupName" style="visibility: hidden;">城市筛选: </label> <label
		class="span3"> 城市: <select id="city_city" multiple="multiple"
		size="10">
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
