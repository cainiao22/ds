package com.qding.bigdata.ds.enums;

/**
 * Created by QDHL on 2017/7/27.
 */

public enum SchedulerTypeEnum {
	DWSQL("数仓SQL", "DWSqlJobHandler"), SHELL("Shell命令", "ShellJobHandler"), DATA_INTEGERATION("数据集成", "DataIntegerationJobHandler");

	private SchedulerTypeEnum(String name, String handler) {
		this.name = name;
		this.handler = handler;
	}

	String name;
	String handler;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHandler() {
		return handler;
	}

	public void setHandler(String handler) {
		this.handler = handler;
	}

}
