<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span">
		在线: <input type="radio" name="isoffline" checked="checked" value="0">
	</label> <label class="span"> 离线: <input type="radio" name="isoffline"
		value="1" /></label>

</div>
<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">常规条件: </label> <label
		class="span3">开始日期: <input type="text" value="" id="from"
		class="input-medium" />
	</label> <label class="span3">结束日期: <input type="text" value="" id="to"
		class="input-medium" /></label> <label class="span3">按日显示: <input
		type="checkbox" id="byday" /></label>
</div>
<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">机型筛选: </label> <label
		class="span3">机型品牌: <select id="brand">
			<option value='-1'>全部</option>
			<c:forEach items="${mobileBrandList}" var="brand">
				<option value="${brand.brand }">${brand.brand}</option>
			</c:forEach>
	</select></label><label class="span3">屏幕大小: <select id="screenSize">
			<option value="-1">全部</option>
			<c:forEach items="${mobileScreenSizeList}" var="screenSize">
				<option value="${screenSize.screenSize }">${screenSize.screenSize}</option>
			</c:forEach>
	</select></label><label class="span3">价格:(>=) <input type="text" value=""
		id="baseprice" class="input-medium" />
	</label>


</div>
<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">机型筛选: </label> <label
		class="span3">OS 版本: <input type="text" value=""
		id="osversion" class="input-medium" /></label> <label class="span3">APP版本:
		<input type="text" value="" id="appversion" class="input-medium" />
	</label> <label class="span3">视频时长: <select id="duration_select">
			<option value="-1">全部</option>
			<c:forEach items="${durationList}" var="duration">
				<option value="${duration.id }">${duration.name }</option>
			</c:forEach>
			<option value="-2">自定义时长</option>
	</select>

	</label> <label id="diyDuration" class="span3" for="#none"
		style="color: blue; display: none;">从:<input type="text"
		style="width: 77px;" id="duration_b" />到:<input type="text"
		style="width: 77px;" id="duration_e" /></label>

</div>
<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">平台选择: </label> <label
		class="span3">选择平台: <select id="adsplatform"
		multiple="multiple">
			<c:forEach var="plat" items="${ADSPLATFORMMAP}">
				<option value='${plat.key}'>${plat.value }</option>
			</c:forEach>
	</select></label>
</div>
<div class="separator"></div>