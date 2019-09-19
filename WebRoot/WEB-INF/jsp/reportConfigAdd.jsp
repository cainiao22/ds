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
<link rel="stylesheet" href="css/jsoneditor.css"/>
<script src="js/jquery.jsoneditor.js"></script>
</head>
<script type="text/javascript">
$(function(){
	
    var myjson =eval('('+$('#config').text()+')');
    var opt = { 
        change: function(data) { 
        	$('#config').text(JSON.stringify(data));
        },
        propertyclick: function(path) { 

        	}
    };
     opt.propertyElement = '<textarea>';  // element of the property field, <input> is default
    opt.valueElement = '<textarea>';  // element of the value field, <input> is default
    $('#mydiv').jsonEditor(myjson, opt);
	
});

</script>
<body>
	<c:import url="common/top.jsp"></c:import>

	<div class="body clearfix">
		<c:import url="common/sitebar.jsp"></c:import>
		<div class="main">
			<div id="ReportWrapper" class="content clearfix">
				<div class="title-bar clearfix">
					<h1 class="l">报表管理</h1>
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

							<form class="form-inline" action="./reportConfigSave" method="post"
								id="form">
								 <input
									type="hidden" name="id" id="id" value="${reportConfig.id }" />
								<div class="filter table-indicator" id="TableIndicator">
									<div class="group clearfix">
										<label class="span12">
											报表名称:
													<input type="text" name="name" id="name"
														class="input-large" value="${reportConfig.name }">
											
										</label> <label class="span12">报表配置:
										
										<textarea id="config" name="config" style="width:600px;height: 300px">${reportConfig.config }</textarea>
										</label>
										<div class="span12 json-editor" id="mydiv" ></div>

									</div>

									<div class="separator"></div>
								</div>
<div class="buttons" style="text-align: center;">

				<button id="submitBtn" type="submit" class="btn btn-success">确定</button>
			</div>


							</form>
						</li>
					</ul>
				</div>
			</div>
		
			
		</div>
	</div>
	<c:import url="common/foot.jsp"></c:import>
</body>
</html>