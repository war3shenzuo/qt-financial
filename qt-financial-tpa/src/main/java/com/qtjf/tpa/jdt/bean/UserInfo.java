package com.qtjf.tpa.jdt.bean;

import java.math.BigDecimal;

public class UserInfo {

	/**
	 * WechatNumber: 微信号（非必填） QqNumber: QQ号（非必填） LovEducationType:教育程度（必填） 1 :
	 * 中专/高中及以下 2 : 大专 3 : 本科 4 : 硕士及以上 LovShebaoType :现单位是否缴纳社保（必填） 1 : 未缴纳社保 2
	 * : 缴纳本地社保 City : 城市（必填） Province:省份（必填） District:地区（必填）
	 * LivingAddress:住址（必填） contact1_name:紧急联系人姓名（必填） contact1_type:紧急联系人类型（必填）
	 * 0 : 配偶 1 : 父母 2 : 兄弟姐妹 3 : 子女 4 : 同事 5 : 同学 6 : 朋友
	 * contact1_cell:紧急联系人联系方式（必填） contact2_name : 第二紧急联系人姓名（非必填）
	 * contact2_type:第二紧急联系人类型（非必填） contact2_cell:第二紧急联系人联系方式（非必填）
	 * RequestAmount:借款额度（非必填） LovDurationType:还款周期类型（非必填） 0: 天 1: 月 2: 周
	 * DurationNumber: 还款周期（非必填）
	 */

	private String WechatNumber;
	private String QqNumber;
	private Integer LovEducationType;
	private Integer LovShebaoType;
	private String City;
	private String Province;
	private String District;
	private String LivingAddress;
	private String contact1_name;
	private String contact1_type;
	private String contact1_cell;
	private String contact2_name;
	private String contact2_type;
	private String contact2_cell;
	private BigDecimal RequestAmount;
	private Integer LovDurationType;
	private Integer DurationNumber;

	public String getWechatNumber() {
		return WechatNumber;
	}

	public void setWechatNumber(String wechatNumber) {
		WechatNumber = wechatNumber;
	}

	public String getQqNumber() {
		return QqNumber;
	}

	public void setQqNumber(String qqNumber) {
		QqNumber = qqNumber;
	}

	public Integer getLovEducationType() {
		return LovEducationType;
	}

	public void setLovEducationType(Integer lovEducationType) {
		LovEducationType = lovEducationType;
	}

	public Integer getLovShebaoType() {
		return LovShebaoType;
	}

	public void setLovShebaoType(Integer lovShebaoType) {
		LovShebaoType = lovShebaoType;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getProvince() {
		return Province;
	}

	public void setProvince(String province) {
		Province = province;
	}

	public String getDistrict() {
		return District;
	}

	public void setDistrict(String district) {
		District = district;
	}

	public String getLivingAddress() {
		return LivingAddress;
	}

	public void setLivingAddress(String livingAddress) {
		LivingAddress = livingAddress;
	}

	public String getContact1_name() {
		return contact1_name;
	}

	public void setContact1_name(String contact1_name) {
		this.contact1_name = contact1_name;
	}

	public String getContact1_type() {
		return contact1_type;
	}

	public void setContact1_type(String contact1_type) {
		this.contact1_type = contact1_type;
	}

	public String getContact1_cell() {
		return contact1_cell;
	}

	public void setContact1_cell(String contact1_cell) {
		this.contact1_cell = contact1_cell;
	}

	public String getContact2_name() {
		return contact2_name;
	}

	public void setContact2_name(String contact2_name) {
		this.contact2_name = contact2_name;
	}

	public String getContact2_type() {
		return contact2_type;
	}

	public void setContact2_type(String contact2_type) {
		this.contact2_type = contact2_type;
	}

	public String getContact2_cell() {
		return contact2_cell;
	}

	public void setContact2_cell(String contact2_cell) {
		this.contact2_cell = contact2_cell;
	}

	public BigDecimal getRequestAmount() {
		return RequestAmount;
	}

	public void setRequestAmount(BigDecimal requestAmount) {
		RequestAmount = requestAmount;
	}

	public Integer getLovDurationType() {
		return LovDurationType;
	}

	public void setLovDurationType(Integer lovDurationType) {
		LovDurationType = lovDurationType;
	}

	public Integer getDurationNumber() {
		return DurationNumber;
	}

	public void setDurationNumber(Integer durationNumber) {
		DurationNumber = durationNumber;
	}

}
