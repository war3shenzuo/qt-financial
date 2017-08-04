package com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.callrecord;

public class CallList {
	private String name;
	private CallingInfo calling_info;
	private CalledInfo called_info;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CallingInfo getCalling_info() {
		return calling_info;
	}
	public void setCalling_info(CallingInfo calling_info) {
		this.calling_info = calling_info;
	}
	public CalledInfo getCalled_info() {
		return called_info;
	}
	public void setCalled_info(CalledInfo called_info) {
		this.called_info = called_info;
	}
}
