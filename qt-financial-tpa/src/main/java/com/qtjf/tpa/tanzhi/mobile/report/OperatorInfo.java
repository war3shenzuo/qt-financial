package com.qtjf.tpa.tanzhi.mobile.report;

public class OperatorInfo {
	private String phone_number;
	private String operator_type;
	private String name;
	private String idcard;
	private String address;
	private String vip_level;
	private String accumulate_points;
	private String email;
	private String registration_history;
	private String order_description;
	
	private String phone_number_location; // Version:1.1.0
	private String available_amount; // Version:1.1.0
	private String main_active_location; // Version:1.1.0
	private Integer main_location_percent; // Version:1.1.0
	
	
	public String getPhone_number_location() {
		return phone_number_location;
	}
	public void setPhone_number_location(String phone_number_location) {
		this.phone_number_location = phone_number_location;
	}
	public String getAvailable_amount() {
		return available_amount;
	}
	public void setAvailable_amount(String available_amount) {
		this.available_amount = available_amount;
	}
	public String getMain_active_location() {
		return main_active_location;
	}
	public void setMain_active_location(String main_active_location) {
		this.main_active_location = main_active_location;
	}
	public Integer getMain_location_percent() {
		return main_location_percent;
	}
	public void setMain_location_percent(Integer main_location_percent) {
		this.main_location_percent = main_location_percent;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getOperator_type() {
		return operator_type;
	}
	public void setOperator_type(String operator_type) {
		this.operator_type = operator_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getVip_level() {
		return vip_level;
	}
	public void setVip_level(String vip_level) {
		this.vip_level = vip_level;
	}
	public String getAccumulate_points() {
		return accumulate_points;
	}
	public void setAccumulate_points(String accumulate_points) {
		this.accumulate_points = accumulate_points;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegistration_history() {
		return registration_history;
	}
	public void setRegistration_history(String registration_history) {
		this.registration_history = registration_history;
	}
	public String getOrder_description() {
		return order_description;
	}
	public void setOrder_description(String order_description) {
		this.order_description = order_description;
	}
	
}
