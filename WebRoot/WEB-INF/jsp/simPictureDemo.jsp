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
<body>
<h1>图片相似商品DEMO(样本数据:topshop 2813个spu)</h1>
<h1>当前商品：</h1>
SPU:${spu }
<img alt="" src="${picmap.get(spu) }">
<h1>最相似商品：</h1>

<c:forEach begin="0" end="10" var="sim" items="${pictureSimList }">
<P style="float: left;">
SPU:${sim.spu }
Sim:${sim.sim }
<img alt="" src="${picmap.get(sim.spu) }">
</P>
</c:forEach>
	
</body>
</html>