<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<script type='text/javascript' src="js/jquery-1.7.2.min.js"></script>   
<script src="js/heatmap.js"></script>
<body>

<div id="heatmapContainer"><img src="./img/${site }.png" style="opacity:0.8; -moz-opacity:0.8; filter:alpha(opacity=80);z-index: -1;"/></div>
<script type="text/javascript">
$(function(){

	var config = {
			  container: document.getElementById('heatmapContainer'),
			  
			 
			};
			// create heatmap with configuration
			var heatmapInstance = h337.create(config);
			var dataPoints = [];
			<c:forEach items="${points }" var="p">

			dataPoints.push({ 
						  x: ${p.x}, // x coordinate of the datapoint, a number 
						  y: ${p.y}, // y coordinate of the datapoint, a number
						  value: 1 // the value at datapoint(x, y)
						});
					</c:forEach>
					
					var data = {
							max:20,
							  min: 5,
							  data:dataPoints
							};
					window.onload = function() { 
							heatmapInstance.setData(data);
					}
});
	</script>
 
</body>
</html>