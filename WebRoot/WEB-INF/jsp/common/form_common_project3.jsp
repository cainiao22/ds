<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="authority"%>

<c:import url="common/form_common_2date.jsp" />


<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">查看选项: </label> <label
		class="span3">执行单号: <input type="text" value=""
		id="projectnumber" class="input-medium" /></label> <label class="span3">按排期包:
		<input type="checkbox" id="bypkg" />
	</label>

</div>
<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">查看选项: </label> <label
		class="span3">曝光位置: <select id="vp">
			<option value="s">视频开始</option>
			<option value="e">视频结束</option>
	</select></label> <label class="span3">平台类型: <select id="plattype">
			<option value="PC">PC</option>
			<option value="MOBILE">MOBILE</option>
			<option value="IFOX">IFOX</option>
	</select></label> <label class="span3">页面类型: <select id="pagetype">
			<option value="播放器">播放器</option>
			<option value="普通页面">普通页面</option>
	</select></label>

</div>
<div class="separator"></div>
