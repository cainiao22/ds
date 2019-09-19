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
<script src="thirdlib/echarts/china.js"></script>
<script src="thirdlib/echarts/shine.js"></script>
<script src="thirdlib/odometer/odometer.min.js"></script>
<script src="js/realtime.js"></script>
<style>
html, body{ margin:0; height:100%; }
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
	var echartsOption={
			 backgroundColor: '#404a59',
	    title: {
	    	top:10,
	        text: '尚品APP实时到访数据大屏',
	        x:'center',
	        textStyle: {
	            color: '#fff',
	            fontSize:32
	        },
	        subtextStyle: {
	            color: '#fff',
	            fontSize:30
	        }
	    },
	    tooltip: {
	        trigger: 'item',
	        formatter: function (params) {
	            return params.name + ' : ' + params.value[2];
	        }
	    },
	    
	    geo: {
	        map: 'china',
	        label: {
	            emphasis: {
	                show: false
	            }
	        },
	        roam:true,
	        itemStyle: {
	            normal: {
	                areaColor: '#323c48',
	                borderColor: '#111'
	            },
	            emphasis: {
	                areaColor: '#2a333d'
	            }
	        }
	 
	    },
	    series: [
{
    name: '今日到访人数',
    type: 'scatter',
    coordinateSystem: 'geo',
    symbolSize: 12,
    label: {
        normal: {
            show: false
        },
        emphasis: {
            show: false
        }
    },
    data:[],
    itemStyle: {
        normal: {
            color: '#f4e925',
            shadowBlur: 10,
            shadowColor: '#333'
        }
    },
    zlevel: 1
},
	        {
	            name: '实时活动人数',
	            type: 'effectScatter',
	            coordinateSystem: 'geo',
	            symbolSize: 12,
	            data:[],
	            itemStyle: {
	                normal: {
	                    color: '#f4e925',
	                    shadowBlur: 10,
	                    shadowColor: '#333'
	                }
	            },
	            zlevel: 1
	        }
	    ]
	};
	 
	var chart = echarts.init(document.getElementById('charts'),'shine');
	
	 
	 chart.setOption(echartsOption);
	
	 var my_interval = setInterval(function () {
		 var  geodata = [];
		 $.post('./cityVisit',{
		 },function(data){
			 var result=data.resultList;
			 var total=data.total;
			 $('#top').html('<h3>城市到访排行榜</h3>');
			 for ( var i = 0; i < result.length; i++) {	
				 var data=result[i];
				 geodata.push({
					 name:data['region']['city']+" 今天到访数",
					 value:[data['region']['lng'],data['region']['lat'],data['value']],
			symbolSize: Math.ceil(Math.log(data['value']))});
				 if(i<10){
				 $('#top').append('<p>'+data['region']['city']+':'+data['value']+'</p>');
				 }
				 
			 }
			 chart.setOption({
				 title: {
				        subtext: '全国到访人数：'+total
				  },
			        series: [{
			            data: geodata
			        },{
			           
			        }]
			    });
		 });
		 
		
	
		 
		 
     }, 5000);
	 
	 
	 var my_interval2 = setInterval(function () {
		 var  geodata = [];
		 $.post('./cityActivity',{
		 },function(result){
			 
			 for ( var i = 0; i < result.length; i++) {	
				 var data=result[i];
				 geodata.push({
					 name:data['region']['city']+" 活动人数",
					 value:[data['region']['lng'],data['region']['lat'],data['value']],
			symbolSize: Math.ceil(data['value'])});
			 }
			 chart.setOption({
			        series: [{
			           
			        },{
			        	 data: geodata
			        }]
			    });
		 });
		 
		
	
		 
		 
     }, 2000);
 });
    </script>
		<div id="top"  style="width: 300px;position:absolute;z-index: 1;color: #f4e925;top: 50%;right: 30px;font-weight: bolder;">


</div>

		<div id="charts"  style="width: 100%;height:100%;"></div>
				
			
		
