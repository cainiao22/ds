package com.qding.bigdata.ds.enums;

public enum MonitorJobStatus {

	Pending("Pending"),	Running("Running"),Success("Success"),Failed("Failed");
	private String name;

	MonitorJobStatus(String name) {
		this.name = name;
	}
	
}
