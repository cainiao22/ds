<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="authority"%>
<div class="group clearfix" id="form_common">
	<label class="groupName">常规条件: </label> <label class="span3">开始日期:
		<input type="text" value="" id="from" class="input-medium" />
	</label> <label class="span3">结束日期: <input type="text" value="" id="to"
		class="input-medium" /></label> <label class="span3">合同单号: <input
		type="text" value="" id="contractnumber" class="input-medium" />
	</label> <label class="span3">执行单号: <input type="text" value=""
		id="projectnumber" class="input-medium" /></label>
</div>
<div class="group clearfix" id="form_common">
	<label class="groupName" style="visibility: hidden;">查看选项: </label> <label
		class="span3">报表类型: <select id="viewtype">
			<my:hasAuthority module="project-income">
				<option value="1">收入</option>
			</my:hasAuthority>
			<my:hasAuthority module="project-consume">
				<option value="2">消耗量</option>
			</my:hasAuthority>
	</select></label>

</div>
<div class="separator"></div>
