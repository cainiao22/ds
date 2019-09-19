<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="authority"%>
<div class="tabs filter-tabs">
	<ul id="tabSelect" class="clearfix selected" style="display: none;">
		<li id="tab_all" class="selected"><a class="trackable"
			href="javascript:void(0)">综合指标</a></li>
		<li id="tab_stock"><a class="trackable" href="javascript:void(0)">库存分析</a></li>
		<li id="tab_simplestock"><a class="trackable"
			href="javascript:void(0)">库存分析精简版</a></li>
		<li id="tab_uv"><a class="trackable" href="javascript:void(0)">UV分析</a></li>
		<li id="tab_vv"><a class="trackable" href="javascript:void(0)">VV分析</a></li>
		<li id="tab_du"><a class="trackable" href="javascript:void(0)">分时长报表</a></li>
		<li id="tab_adsenseRatio"><a class="trackable"
			href="javascript:void(0)">地域投放比例报表</a></li>
		<li id="tab_keytarget"><a class="trackable"
			href="javascript:void(0)">关键指标报表</a></li>
		<li id="tab_dukeytarget"><a class="trackable"
			href="javascript:void(0)">关键指标报表(分时长)</a></li>
		<li id="tab_mobileStock"><a class="trackable"
			href="javascript:void(0)">机型库存报表(Gphone)</a></li>
		<li id="tab_newMobileStock"><a class="trackable"
			href="javascript:void(0)">机型库存报表Beta</a></li>
		<li id="tab_hourdata"><a class="trackable"
			href="javascript:void(0)">小时数据报表</a></li>
		<li id="tab_click"><a class="trackable" href="javascript:void(0)">点击数据报表</a></li>
		<li id="tab_specialAD"><a class="trackable"
			href="javascript:void(0)">特型广告报表</a></li>
		<li id="tab_logicalStock"><a class="trackable"
			href="javascript:void(0)">理论库存报表</a></li>
		<li id="tab_pkgSpecialAD"><a class="trackable"
			href="javascript:void(0)">特型广告排期包报表</a></li>
		<li id="tab_pkgKey"><a class="trackable"
			href="javascript:void(0)">排期包关键指标报表</a></li>
		<li id="tab_posad"><a class="trackable" href="javascript:void(0)">贴片位置库存报表</a></li>
		<li id="tab_dingsantou"><a class="trackable"
			href="javascript:void(0)">项目定散投报表</a></li>
	</ul>
</div>