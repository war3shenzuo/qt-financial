package com.qtjf.tpa.tanzhi.mobile.report;

import com.qtjf.tpa.tanzhi.mobile.report.sensitiveinfo.ResultDetailInfo;

public class SensitiveInfo {

	private Integer item_id;
	private String item_name;
	private String risk_level;
	private String check_result;
	private ResultDetailInfo result_detail_info;
	
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getRisk_level() {
		return risk_level;
	}
	public void setRisk_level(String risk_level) {
		this.risk_level = risk_level;
	}
	public String getCheck_result() {
		return check_result;
	}
	public void setCheck_result(String check_result) {
		this.check_result = check_result;
	}
	public ResultDetailInfo getResult_detail_info() {
		return result_detail_info;
	}
	public void setResult_detail_info(ResultDetailInfo result_detail_info) {
		this.result_detail_info = result_detail_info;
	}
}
