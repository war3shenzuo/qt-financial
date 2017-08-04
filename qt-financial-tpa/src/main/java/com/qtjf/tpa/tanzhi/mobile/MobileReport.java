package com.qtjf.tpa.tanzhi.mobile;

import java.util.List;

import com.qtjf.tpa.tanzhi.mobile.report.ApplierInfo;
import com.qtjf.tpa.tanzhi.mobile.report.BillInfo;
import com.qtjf.tpa.tanzhi.mobile.report.CommunicationCityInfo;
import com.qtjf.tpa.tanzhi.mobile.report.CommunicationDetection;
import com.qtjf.tpa.tanzhi.mobile.report.CommunicationMonthInfo;
import com.qtjf.tpa.tanzhi.mobile.report.CommunicationProvinceInfo;
import com.qtjf.tpa.tanzhi.mobile.report.CommunicationTimeBucketInfo;
import com.qtjf.tpa.tanzhi.mobile.report.CommunicationTimeDurationInfo;
import com.qtjf.tpa.tanzhi.mobile.report.LableInfo;
import com.qtjf.tpa.tanzhi.mobile.report.OperatorInfo;
import com.qtjf.tpa.tanzhi.mobile.report.RechargeInfo;
import com.qtjf.tpa.tanzhi.mobile.report.ReportInfo;
import com.qtjf.tpa.tanzhi.mobile.report.SensitiveInfo;
import com.qtjf.tpa.tanzhi.mobile.report.TravelInfo;


public class MobileReport {
	private String version;
	private ReportInfo report_info;
	private ApplierInfo applier_info;
	private OperatorInfo operator_info;
	private List<SensitiveInfo> sensitive_info;
	private List<LableInfo> label_info;
	private List<RechargeInfo> recharge_info;
	private List<TravelInfo> travel_info;
	private List<BillInfo> bill_info;
	
	private CommunicationDetection communication_detection;
	private List<CommunicationMonthInfo> communication_month_info;
	private List<CommunicationTimeBucketInfo> communication_time_bucket_info;
	private List<CommunicationTimeDurationInfo> communication_time_duration_info;
	private List<CommunicationCityInfo> communication_city_info;
	private List<CommunicationProvinceInfo> communication_province_info;
	
	
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public ReportInfo getReport_info() {
		return report_info;
	}
	public void setReport_info(ReportInfo report_info) {
		this.report_info = report_info;
	}
	public ApplierInfo getApplier_info() {
		return applier_info;
	}
	public void setApplier_info(ApplierInfo applier_info) {
		this.applier_info = applier_info;
	}
	public OperatorInfo getOperator_info() {
		return operator_info;
	}
	public void setOperator_info(OperatorInfo operator_info) {
		this.operator_info = operator_info;
	}
	public List<SensitiveInfo> getSensitive_info() {
		return sensitive_info;
	}
	public void setSensitive_info(List<SensitiveInfo> sensitive_info) {
		this.sensitive_info = sensitive_info;
	}
	public List<LableInfo> getLabel_info() {
		return label_info;
	}
	public void setLabel_info(List<LableInfo> label_info) {
		this.label_info = label_info;
	}
	public List<RechargeInfo> getRecharge_info() {
		return recharge_info;
	}
	public void setRecharge_info(List<RechargeInfo> recharge_info) {
		this.recharge_info = recharge_info;
	}
	public List<TravelInfo> getTravel_info() {
		return travel_info;
	}
	public void setTravel_info(List<TravelInfo> travel_info) {
		this.travel_info = travel_info;
	}
	public CommunicationDetection getCommunication_detection() {
		return communication_detection;
	}
	public void setCommunication_detection(CommunicationDetection communication_detection) {
		this.communication_detection = communication_detection;
	}
	public List<CommunicationMonthInfo> getCommunication_month_info() {
		return communication_month_info;
	}
	public void setCommunication_month_info(List<CommunicationMonthInfo> communication_month_info) {
		this.communication_month_info = communication_month_info;
	}
	public List<CommunicationTimeBucketInfo> getCommunication_time_bucket_info() {
		return communication_time_bucket_info;
	}
	public void setCommunication_time_bucket_info(List<CommunicationTimeBucketInfo> communication_time_bucket_info) {
		this.communication_time_bucket_info = communication_time_bucket_info;
	}
	public List<CommunicationCityInfo> getCommunication_city_info() {
		return communication_city_info;
	}
	public void setCommunication_city_info(List<CommunicationCityInfo> communication_city_info) {
		this.communication_city_info = communication_city_info;
	}
	public List<CommunicationProvinceInfo> getCommunication_province_info() {
		return communication_province_info;
	}
	public void setCommunication_province_info(List<CommunicationProvinceInfo> communication_province_info) {
		this.communication_province_info = communication_province_info;
	}
	public List<CommunicationTimeDurationInfo> getCommunication_time_duration_info() {
		return communication_time_duration_info;
	}
	public void setCommunication_time_duration_info(List<CommunicationTimeDurationInfo> communication_time_duration_info) {
		this.communication_time_duration_info = communication_time_duration_info;
	}
	public List<BillInfo> getBill_info() {
		return bill_info;
	}
	public void setBill_info(List<BillInfo> bill_info) {
		this.bill_info = bill_info;
	}
	
	
}
