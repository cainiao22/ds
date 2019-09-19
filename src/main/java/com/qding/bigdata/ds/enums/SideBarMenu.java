package com.qding.bigdata.ds.enums;

public enum SideBarMenu {
	系统管理("系统管理","","SysManage_group","",false),
	             欢迎页面("欢迎页面","系统管理","index","",true),
	             用户管理("用户管理","系统管理","userlist","",true),
	             角色管理("角色管理","系统管理","rolelist","",true),
	             模块管理("模块管理","系统管理","modulelist","",true),
	             
	数据中心("数据中心","","dataCenter","",false),
				大屏数据("大屏数据", "数据中心","mainDashBoard","",true),
				SQL查询("SQL查询", "数据中心","queryBySql","",true),
				自助分析("自助分析", "数据中心","smartQuery","",true),
				管理指挥室("管理指挥室", "数据中心","zhihuishi","",true),
				旅游驾驶舱("旅游驾驶舱", "数据中心","travelDashboard","",true),
				社区日报("社区日报", "数据中心","communityReport","",true),
			/*	报表中心("报表中心", "数据中心","reportList","",true),*/
	监控中心("监控中心","","monitorCenter","",false),
				数仓监控("数仓监控", "监控中心","monitorExecutorList","",true),
				//数仓SQL运行状态("数仓SQL运行状态", "监控中心","dwQueryMonitor","",true),
	用户画像("用户画像","","userProfileGroup","",false),
				画像分析("画像分析", "用户画像","userProfile","",true),
				标签管理("标签管理", "用户画像","listTag","",true),
				群组管理("群组管理", "用户画像","userGroupIndex","",true),
	             
	
	元数据("元数据","","metaGroup","",false),
				数据仓库("数据仓库", "元数据","metaTableList","",true),
//				埋点("埋点", "元数据","trackMeta","",true),
				业务库("业务库", "元数据","bizSourceMeta","",true),
				数据同步("数据管理", "元数据","transMetaToTarget","",true),
	 			数据同步列表("数据同步列表", "元数据","dataInfo","",true),
				datax配置文件管理("datax配置文件管理", "元数据","dataxConfigFiltManage","",true),
//				日志源("日志源", "元数据","logSourceMeta","",true),
//				指标库("指标库", "元数据","measureList","",true),
	
	
//	调度系统("调度系统","","scheduleSystem","",false),
//			任务列表("任务列表", "调度系统","metaTableList","",true),
	
	数据管理("数据管理","","dataManage","",false),
			字典管理("字典管理", "数据管理","configIndex","",true),
			数据接口("数据接口", "数据管理","dataApi","",true),
	        数据表配置("数据表配置", "数据管理","tableConfigIndex","",true),
	调度系统("调度系统","","scheduler","",false),
	                    作业列表("作业列表", "调度系统","schedulerJobList","",true),
	                    作业日志("作业日志", "调度系统","schedulerJobLogList","",true),
	                    新建作业("新建作业", "调度系统","createSchedulerJob","",true);

	
	private String name;
	private String parentName;
	private String path;
	private String icon;
	private boolean isLink;

	SideBarMenu(String name, String parentName, String path, String icon, boolean isLink) {
		this.name = name;
		this.parentName = parentName;
		this.icon=icon;
		this.path=path;
		this.isLink=isLink;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isLink() {
		return isLink;
	}

	public void setLink(boolean isLink) {
		this.isLink = isLink;
	}

	 

	
}
