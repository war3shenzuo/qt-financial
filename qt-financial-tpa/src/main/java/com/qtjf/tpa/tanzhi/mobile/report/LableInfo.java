package com.qtjf.tpa.tanzhi.mobile.report;

public class LableInfo {
	private Integer sort_index;
	private String phone_number;
	private String label_name;
	private String label_type;
	private String phone_location;
	private Integer contact_count;
	private Integer contact_duration;
	private Integer calling_count;
	private Integer called_count;
	private String earliest_time; // Version:1.1.0
	private String latest_time; // Version:1.1.0
	
	
	public String getEarliest_time() {
		return earliest_time;
	}
	public void setEarliest_time(String earliest_time) {
		this.earliest_time = earliest_time;
	}
	public String getLatest_time() {
		return latest_time;
	}
	public void setLatest_time(String latest_time) {
		this.latest_time = latest_time;
	}
	public Integer getSort_index() {
		return sort_index;
	}
	public void setSort_index(Integer sort_index) {
		this.sort_index = sort_index;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getLabel_name() {
		return label_name;
	}
	public void setLabel_name(String label_name) {
		this.label_name = label_name;
	}
	public String getLabel_type() {
		return label_type;
	}
	public void setLabel_type(String label_type) {
		this.label_type = label_type;
	}
	public String getPhone_location() {
		return phone_location;
	}
	public void setPhone_location(String phone_location) {
		this.phone_location = phone_location;
	}
	public Integer getContact_count() {
		return contact_count;
	}
	public void setContact_count(Integer contact_count) {
		this.contact_count = contact_count;
	}
	public Integer getContact_duration() {
		return contact_duration;
	}
	public void setContact_duration(Integer contact_duration) {
		this.contact_duration = contact_duration;
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
}
