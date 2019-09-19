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
width: 300px;height: 140px;background:#0073b7 none repeat scroll 0 0;color:white;padding: 10px;
float: left;margin: 10px;
}
.screenlarge{
width: 980px;height: 140px;background:#0073b7 none repeat scroll 0 0;color:white;padding: 10px;
float: left;margin: 10px;display: none;
}
.screenText{
font-size: 30px;text-align: center;margin-top:80px;
float:none;
}
.odometer {
  font-size: 36px;
  line-height: 50px;
  color: white;
  margin-right:20%;
  float: right;
}
</style>
</head>
<body>
	<script type="text/javascript">
 $(function(){ 
	   var n1 = new Odometer({
           el: $('#n1')[0],
           value: 0,
           duration: 0 
       });
	   n1.render();
	   var n2 = new Odometer({
           el: $('#n2')[0],
           value: 0,
           duration: 0
       });
	   n2.render();
	   var n3 = new Odometer({
           el: $('#n3')[0],
           value: 0,
           duration: 0
       });
	   n3.render();
	   var n4 = new Odometer({
           el: $('#n4')[0],
           value: 0,
           duration: 0
       });
	   n4.render();
	   var n5 = new Odometer({
           el: $('#n5')[0],
           value: 0,
           duration: 0
       });
	   n5.render();
	   var n6 = new Odometer({
           el: $('#n6')[0],
           value: 0,
           duration: 0
       });
	   n6.render();
	   
	   
	   var n7 = new Odometer({
           el: $('#n7')[0],
           value: 0,
           duration: 0
       });
	   n7.render();
	   
	   
	   
	   var n8 = new Odometer({
           el: $('#n8')[0],
           value: 0,
           duration: 0
       });
	   n8.render();
	   
	   
	   var n9 = new Odometer({
           el: $('#n9')[0],
           value: 0,
           duration: 0
       });
	   n9.render();
	   
	   
	   var n10 = new Odometer({
           el: $('#n10')[0],
           value: 0,
           duration: 0
       });
	   n10.render();
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
	/*  var minuteReqData = echarts.init(document.getElementById('minuteReqData'),'shine');
	 var minuteUsetimeData = echarts.init(document.getElementById('minuteUsetimeData'),'shine');
	 minuteReqData.setOption(minuteReqDataOption);
	 minuteUsetimeData.setOption(minuteUsetimeDataOption); */
	 function refreshSummary(){
		 $.post('./520Data',{
			 day:$('#date').val()
		 },function(result){
			 
			 var totalOrderCnt=result.totalOrderCnt;
			 n1.update(totalOrderCnt);
			 
			 var appTotalUv=result.appTotalUv;
			 n2.update(appTotalUv);
			 
			 var mTotalUv=result.mTotalUv;
			 n3.update(mTotalUv);
			 
			 var pcTotalUv=result.pcTotalUv;
			 n4.update(pcTotalUv);
			 
			 
			 var appOnlineCnt=result.appOnlineCnt;
			 n5.update(appOnlineCnt);
			 
			 
			 var mOnlineCnt=result.mOnlineCnt;
			 n6.update(mOnlineCnt);
			 
			 var pcOnlineCnt=result.pcOnlineCnt;
			 n7.update(pcOnlineCnt);
			 
			 var appLogcnt=result.appLogcnt;
			 n8.update(appLogcnt);
			 
			 var mLogcnt=result.mLogcnt;
			 n9.update(mLogcnt);
			 
			 
			 var pcLogcnt=result.pcLogcnt;
			 n10.update(pcLogcnt);
			
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
			//refreshMinute();
			
		});
	 setInterval(function (){
		 refreshSummary();
     }, 5000); 
	// setInterval(function (){
	//	 refreshMinute();
   //  }, 30000); 
	 refreshSummary();
	// refreshMinute();
 });
    </script>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l" id="reportName">实时概况</h1>
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
				
			<div class="screenlarge">
			<div id="n1" class="odometer" style="margin-right:45%; "></div>
			<div class="screenText">
			累计订单数</div>
			</div>
			
				<div style="clear: both;"></div>
		<div class="screen">
			<div id="n8" class="odometer"></div>
			<div class="screenText">App处理请求数</div></div>
			
			<div class="screen">
			<div id="n9" class="odometer"></div>
			<div class="screenText">
			M站处理请求数</div>
			</div>
			
			
			<div class="screen">
			<div id="n10" class="odometer"></div>
			<div class="screenText">
			PC站处理请求数</div>
			</div>
			
			
		<div style="clear: both;"></div>
			
			
			<div class="screen">
			<div id="n2" class="odometer"></div>
			<div class="screenText">App到访人数</div></div>
			
			<div class="screen">
			<div id="n3" class="odometer"></div>
			<div class="screenText">
			M站到访人数</div>
			</div>
			
			
			<div class="screen">
			<div id="n4" class="odometer"></div>
			<div class="screenText">
			PC站到访人数</div>
			</div>
		<div style="clear: both;"></div>
		<div class="screen">
			<div id="n5" class="odometer"></div>
			<div class="screenText">App在线人数</div></div>
			
			<div class="screen">
			<div id="n6" class="odometer"></div>
			<div class="screenText">
			M站在线人数</div>
			</div>
			
			
			<div class="screen">
			<div id="n7" class="odometer"></div>
			<div class="screenText">
			PC站在线人数</div>
			</div>
			
		
			
			
<!-- 
			<div id="minuteReqData"  style="width: 100%;height:400px;clear: both;"></div>
			<div id="minuteUsetimeData"  style="width: 100%;height:400px;clear: both;"></div> -->
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>