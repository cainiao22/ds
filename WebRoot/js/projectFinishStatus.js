$(function() {
	var platforms=new Array();
	window.platforms=platforms;
	
	var catalogs=new Array();
	window.catalogs=catalogs;
	
	var prepath='收入报表/';
	var reportname='';
	window.reportname=reportname;
	
	$("#framemain").load(function() {
		$('#loading').hide();
		$('#framemain').show();

	});
	function loadframe() {
		
		reportname='';
		var url = createurl();
		$('#framemain').hide();
		$('#loading').show();
		$('#framemain').attr("src", url);
		$('#framemain').attr('height','800px');
	}
	$('#submitBtn').click(function() {
		loadframe();
// $('#FilterTabs div:eq(0)').hide(500);
// $('#FilterTabs div:eq(1)').hide(500);
	});
	function parsefullurl(path,param){
		var url =window.config.bieehost+window.config.commonPages.replace('{#path}',path);

// var adstyle=$('#adstyle');
// var title= $('#from').val() + '' + $('#to').val()+' ' +
// (adstyle.val()==-1?'':adstyle.find("option:selected").text());
// url+='&MYTITLE='+encodeURIComponent(title);
		param[0] = (param.length - 1) / 3;
		for ( var i = 0; i < param.length; i++) {
			url += '&P' + i + '=' + param[i];
		}
		
		url+='&rand='+Math.random();
		return url;
	}
	function createurl() {
		switch (path) {
		case 'projectFinishStatus':
			return create_projectFinishStatus_url();
			break;
	}
	}
	function fillreportname() {
			reportname+='执行单完成情况总览报表';
		
	}
	function create_projectFinishStatus_url(){
		var param = new Array();
		setCommonLimit(param);
		
		
		
		fillreportname();
		
		var path = encodeURIComponent(prepath + reportname);
		return parsefullurl(path,param);
	}
	function setCommonLimit(param) {
		var index=0;
		param[++index] = 'eq';
		param[++index] = encodeURIComponent('"日期维"."DAY"');
		param[++index] = $('#from').val();
		param[++index] = 'le';
		param[++index] = encodeURIComponent('"执行单维"."执行单开始日期"');
		param[++index] = $('#from').val();
		param[++index] = 'ge';
		param[++index] = encodeURIComponent('"执行单维"."执行单结束日期"  大于等于');
		param[++index] = $('#from').val();
	
		
	}

	$("#from").datepicker({
		changeMonth : true,
		dateFormat : "yymmdd",
		showButtonPanel:true,
		maxDate:-1
	}).datepicker('setDate', -1);
});