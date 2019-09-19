<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head><script type='text/javascript' src="js/jquery-1.7.2.min.js"></script>
<body>
<form action=""   id="submitForm" method="get">
				 <div style="line-height: 30px;">只显示包含以下内容：<input type="text" name="filter" value="${filter }" style="width: 200px;"></input></div>
				 <div style="line-height: 30px;">只显示最新行数：<input type="text"  name="cnt" value="${cnt }"></input></div>
				 <div style="line-height: 30px;">自动刷新：<input type="text"  name="autoRefresh" value="${autoRefresh }"></input>秒(0\负数表示不自动刷新)</div>
				 <div style="line-height: 30px;"><input type="submit" value="开启刷新" id=""></input>    <input type="button" value="停止刷新" id="stopAutoRefresh"></input></div>
				</form>

<script type="text/javascript">

$(function(){
	var duration=${autoRefresh};
	var timeID;
	if(duration>0){
		timeID=setTimeout("myrefresh()",duration*1000);
	} 

	 function myrefresh()
	 {
	    window.location.reload();
	 }
	window.myrefresh=myrefresh;
	
	$('#stopAutoRefresh').click(function(){
		clearTimeout(timeID);
	});;
});
</script>

<h1>埋点日志检测</h1>

<c:forEach  var="log" items="${loglist }">
<div style="border-bottom:1px solid blue">
<p>${log.ts }</p>
<c:forEach var="tm" items="${log.tm}">   
${tm.key} : ${tm.value} <br>   
</c:forEach> 
</div>
</c:forEach>
	
</body>
</html>