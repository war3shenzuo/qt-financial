package com.qtjf.tpa.tanzhi.mobile.report;

public class CommunicationTimeBucketInfo {
	private String time_bucket;
	private Integer calling_count;
	private Integer called_count;
	private Integer calling_duration_time;
	private Integer called_duration_time;
	public String getTime_bucket() {
		return time_bucket;
	}
	public void setTime_bucket(String time_bucket) {
		this.time_bucket = time_bucket;
	}
	public Integer getCalling_count() {
		return calling_count;
	}
	public void setCalling_count(Integer calling_count) {
		this.calling_count = calling_count;
	}
	public Integer getCalled_count() {
		return called_count;
	}
	public void setCalled_count(Integer called_count) {
		this.called_count = called_count;
	}
	public Integer getCalling_duration_time() {
		return calling_duration_time;
	}
	public void setCalling_duration_time(Integer calling_duration_time) {
		this.calling_duration_time = calling_duration_time;
	}
	public Integer getCalled_duration_time() {
		return called_duration_time;
	}
	public void setCalled_duration_time(Integer called_duration_time) {
		this.called_duration_time = called_duration_time;
	}
}
