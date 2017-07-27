package com.qtjf.tpa.jdt.bean;

import java.math.BigDecimal;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonProperty;

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
	@JSONField(name = "WechatNumber")
	private String WechatNumber;
	@JsonProperty("QqNumber")
	private String QqNumber;
	@JsonProperty("LovEducationType")
	private Integer LovEducationType;
	@JsonProperty("LovShebaoType")
	private Integer LovShebaoType;
	@JsonProperty("City")
	private String City;
	@JsonProperty("Province")
	private String Province;
	@JsonProperty("District")
	private String District;
	@JsonProperty("LivingAddress")
	private String LivingAddress;
	@JsonProperty("Contact1Name")
	private String Contact1Name;
	@JsonProperty("Contact1Type")
	private Integer Contact1Type;
	@JsonProperty("Contact1Cell")
	private String Contact1Cell;
	@JsonProperty("Contact2Name")
	private String Contact2Name;
	@JsonProperty("Contact2Type")
	private Integer Contact2Type;
	@JsonProperty("Contact2Cell")
	private String Contact2Cell;
	@JsonProperty("RequestAmount")
	private BigDecimal RequestAmount;
	@JsonProperty("LovDurationType")
	private Integer LovDurationType;
	@JsonProperty("DurationNumber")
	private Integer DurationNumber;

	@JSONField(name = "WechatNumber")
	public String getWechatNumber() {
		return WechatNumber;
	}

	public void setWechatNumber(String wechatNumber) {
		WechatNumber = wechatNumber;
	}

	@JSONField(name = "QqNumber")
	public String getQqNumber() {
		return QqNumber;
	}

	public void setQqNumber(String qqNumber) {
		QqNumber = qqNumber;
	}

	@JSONField(name = "LovEducationType")
	public Integer getLovEducationType() {
		return LovEducationType;
	}

	public void setLovEducationType(Integer lovEducationType) {
		LovEducationType = lovEducationType;
	}

	@JSONField(name = "LovShebaoType")
	public Integer getLovShebaoType() {
		return LovShebaoType;
	}

	public void setLovShebaoType(Integer lovShebaoType) {
		LovShebaoType = lovShebaoType;
	}

	@JSONField(name = "City")
	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	@JSONField(name = "Province")
	public String getProvince() {
		return Province;
	}

	public void setProvince(String province) {
		Province = province;
	}

	@JSONField(name = "District")
	public String getDistrict() {
		return District;
	}

	public void setDistrict(String district) {
		District = district;
	}

	@JSONField(name = "LivingAddress")
	public String getLivingAddress() {
		return LivingAddress;
	}

	public void setLivingAddress(String livingAddress) {
		LivingAddress = livingAddress;
	}

	@JSONField(name = "RequestAmount")
	public BigDecimal getRequestAmount() {
		return RequestAmount;
	}

	public void setRequestAmount(BigDecimal requestAmount) {
		RequestAmount = requestAmount;
	}

	@JSONField(name = "LovDurationType")
	public Integer getLovDurationType() {
		return LovDurationType;
	}

	public void setLovDurationType(Integer lovDurationType) {
		LovDurationType = lovDurationType;
	}

	@JSONField(name = "DurationNumber")
	public Integer getDurationNumber() {
		return DurationNumber;
	}

	public void setDurationNumber(Integer durationNumber) {
		DurationNumber = durationNumber;
	}

	@JSONField(name = "Contact1Name")
	public String getContact1Name() {
		return Contact1Name;
	}

	public void setContact1Name(String contact1Name) {
		Contact1Name = contact1Name;
	}

	@JSONField(name = "Contact1Cell")
	public String getContact1Cell() {
		return Contact1Cell;
	}

	public void setContact1Cell(String contact1Cell) {
		Contact1Cell = contact1Cell;
	}

	@JSONField(name = "Contact2Name")
	public String getContact2Name() {
		return Contact2Name;
	}

	public void setContact2Name(String contact2Name) {
		Contact2Name = contact2Name;
	}

	@JSONField(name = "Contact2Cell")
	public String getContact2Cell() {
		return Contact2Cell;
	}

	public void setContact2Cell(String contact2Cell) {
		Contact2Cell = contact2Cell;
	}

	@JSONField(name = "Contact1Type")
	public Integer getContact1Type() {
		return Contact1Type;
	}

	public void setContact1Type(Integer contact1Type) {
		Contact1Type = contact1Type;
	}

	@JSONField(name = "getContact2Type")
	public Integer getContact2Type() {
		return Contact2Type;
	}

	public void setContact2Type(Integer contact2Type) {
		Contact2Type = contact2Type;
	}

}
