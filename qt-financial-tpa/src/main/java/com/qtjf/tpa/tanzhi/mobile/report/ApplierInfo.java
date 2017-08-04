package com.qtjf.tpa.tanzhi.mobile.report;

import java.util.List;

import com.qtjf.tpa.tanzhi.mobile.report.applierinfo.Address;
import com.qtjf.tpa.tanzhi.mobile.report.applierinfo.Contract;


public class ApplierInfo {
	private String phone_number;
	private String name;
	private String idcard;
	private String idcard_location;
	private String gender;
	private Integer age;
	private String home_telephone_number;
	private String home_address;
	private Address home_address_map_result;
	private String company_telephone_number;
	private String company_address;
	private Address company_address_map_result;
	private List<Contract> contacts;
	
	
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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
	public String getIdcard_location() {
		return idcard_location;
	}
	public void setIdcard_location(String idcard_location) {
		this.idcard_location = idcard_location;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getHome_telephone_number() {
		return home_telephone_number;
	}
	public void setHome_telephone_number(String home_telephone_number) {
		this.home_telephone_number = home_telephone_number;
	}
	public String getHome_address() {
		return home_address;
	}
	public void setHome_address(String home_address) {
		this.home_address = home_address;
	}
	public Address getHome_address_map_result() {
		return home_address_map_result;
	}
	public void setHome_address_map_result(Address home_address_map_result) {
		this.home_address_map_result = home_address_map_result;
	}
	public String getCompany_telephone_number() {
		return company_telephone_number;
	}
	public void setCompany_telephone_number(String company_telephone_number) {
		this.company_telephone_number = company_telephone_number;
	}
	public String getCompany_address() {
		return company_address;
	}
	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	public Address getCompany_address_map_result() {
		return company_address_map_result;
	}
	public void setCompany_address_map_result(Address company_address_map_result) {
		this.company_address_map_result = company_address_map_result;
	}
	public List<Contract> getContacts() {
		return contacts;
	}
	public void setContacts(List<Contract> contacts) {
		this.contacts = contacts;
	}
	
}
