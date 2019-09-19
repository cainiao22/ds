<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="common/title.jsp"></c:import>
<c:import url="common/cssjs.jsp"></c:import>
<link rel="stylesheet" href="thirdlib/odometer/themes/odometer-theme-default.css" />
<script src="thirdlib/echarts/echarts.min.js"></script>
<script src="thirdlib/echarts/shine.js"></script>
<script src="thirdlib/odometer/odometer.min.js"></script>
<script src="js/realtime.js"></script>
<style>

.screen{
width: 200px;height: 100px;background:#0073b7 none repeat scroll 0 0;color:white;padding: 10px;
float: left;margin: 10px;
}
.screenText{
font-size: 26px;text-align: center;margin-top:50px;
float:none;
}
.odometer {
  font-size: 32px;
  line-height: 50px;
  color: white;
  margin-right:20px;
  float: right;
}
</style>
</head>
<body>
	<script type="text/javascript">
 $(function(){ 
	   var totalReqOdometer = new Odometer({
           el: $('#totalReq')[0],
           value: 0,
           duration: 0 
       });
	   totalReqOdometer.render();
	   var totalUvOdometer = new Odometer({
           el: $('#totalUv')[0],
           value: 0,
           duration: 0
       });
	   totalUvOdometer.render();
	   var usetimeOdometer = new Odometer({
           el: $('#usetime')[0],
           value: 0,
           duration: 0
       });
	   usetimeOdometer.render();
	var minuteReqDataOption = {
			    title: {
			        text: '分钟实时请求数',
			        x: 'center'
			    },
			    tooltip: {
			        trigger: 'axis',
			        formatter: function (params) {
			            params = params[0];
			            var date = new Date(params.name);
			            return date.getHours() +"时"+date.getMinutes()+ '分: ' + params.value[1];
			        },
			        axisPointer: {
			            animation: false
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    toolbox: {
			        feature: {
			            saveAsImage: {}
			        }
			    },
			    xAxis: {
			        type: 'time',
			        data: []
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [
			        {
			            name:'请求数',
			            type:'line',
			            data:[],
			            smooth:true,
			            showSymbol: false,
			            lineStyle:{
			            	normal:{
			            		width:0.8
			            	}
			            	
			            }
			        }
			    ]
			};
	var minuteUsetimeDataOption = {
			    title: {
			        text: '分钟实时响应时间',
			        x: 'center'
			    },
			    tooltip: {
			        trigger: 'axis',
			        formatter: function (params) {
			            params = params[0];
			            var date = new Date(params.name);
			            return date.getHours() +"时"+date.getMinutes()+ '分: ' + params.value[1];
			        },
			        axisPointer: {
			            animation: false
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    toolbox: {
			        feature: {
			            saveAsImage: {}
			        }
			    },
			    xAxis: {
			        type: 'time',
			        data: []
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [
			        {
			            name:'响应时间(毫秒)',
			            type:'line',
			            data:[],
			            smooth:true,
			            showSymbol: false,
			            lineStyle:{
			            	normal:{
			            		width:0.8
			            	}
			            	
			            }
			        }
			    ]
			};
	 var minuteReqData = echarts.init(document.getElementById('minuteReqData'),'shine');
	 var minuteUsetimeData = echarts.init(document.getElementById('minuteUsetimeData'),'shine');
	 minuteReqData.setOption(minuteReqDataOption);
	 minuteUsetimeData.setOption(minuteUsetimeDataOption);
	 function refreshSummary(){
		 $.post('./recRequestSummary',{
			 day:$('#date').val()
		 },function(result){
			 
			 var totalUv=result.totalUv;
			 var totalReq=result.totalReq;
			 var avgUsetime=result.avgUsetime;
			 totalReqOdometer.update(totalReq);
			 totalUvOdometer.update(totalUv);
			 usetimeOdometer.update(avgUsetime);
		 });
 }
	 function refreshMinute(){
		 $.post('./recRequestReportData',{
			 day:$('#date').val()
		 },function(result){
			 
			 var minuteDataList=result.minuteDataList;
			 var  y1data = [];
			 var  y2data = [];
			 for ( var i = 0; i < minuteDataList.length; i++) {
				 y1data.push({name:new Date(minuteDataList[i]['time']).toString(),value:[new Date(minuteDataList[i]['time']).toString(),minuteDataList[i]['total']]});
				 y2data.push({name:new Date(minuteDataList[i]['time']).toString(),value:[new Date(minuteDataList[i]['time']).toString(),minuteDataList[i]['avgUsetime']]});
			 }
			 minuteReqDataOption.series[0].data=y1data;
			 minuteUsetimeDataOption.series[0].data=y2data;
			 minuteReqData.setOption(minuteReqDataOption);
			 minuteUsetimeData.setOption(minuteUsetimeDataOption);
		 });
 }
		 
		$("#date").datepicker({
			changeYear : true,
			changeMonth : true,
			dateFormat : "yymmdd",
			showButtonPanel:true
		}).datepicker('setDate', new Date());
		$("#date").change(function(){
			refreshMinute();
			
		});
	 setInterval(function (){
		 refreshSummary();
     }, 5000); 
	 setInterval(function (){
		 refreshMinute();
     }, 30000); 
	 refreshSummary();
	 refreshMinute();
 });
    </script>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l" id="reportName">推荐系统监控报表</h1>
				</div>
			</div>

			<div class="section" id="Tabs">
				<div class="tabs">
					<ul class="clearfix">
					</ul>
				</div>
			</div>




			<div class="filters section" id="FilterTabs">
			<div class="tab-contents">
					<ul>
						<li style="">
							<form class="form-inline">
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix" id="form_common">
	<label class="groupName">查询条件: </label> <label class="span3">数据日期:
		<input type="text"  id="date" class="input-medium" />
	</label> 
</div>
<div class="separator"></div>

								</div>
							</form>
						</li>
					</ul>
				</div>
				<img id="loading" style="float: left; display: none;"
					src="./img/loading2.gif" />

			</div>
			<div class="screen">
			<div id="totalUv" class="odometer"></div>
			<div class="screenText">当日推荐人数</div></div>
			<div class="screen">
			<div id="totalReq" class="odometer"></div>
			<div class="screenText">
			当日推荐次数</div>
			</div>
			<div class="screen">
					  <div style="float:right; margin-top:10px; margin-right:20px;">毫秒</div>
					<div id="usetime" class="odometer"></div>
				<div class="screenText">
			实时响应时间</div>
			</div>
			<div id="minuteReqData"  style="width: 100%;height:400px;clear: both;"></div>
			<div id="minuteUsetimeData"  style="width: 100%;height:400px;clear: both;"></div>
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>