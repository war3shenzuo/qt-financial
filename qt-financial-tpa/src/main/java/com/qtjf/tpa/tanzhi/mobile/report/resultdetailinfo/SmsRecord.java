package com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo;

import java.util.List;

import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.smsrecord.SmsBucketInfo;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.smsrecord.SmsList;



public class SmsRecord {

	private List<SmsList> sms_list;
	private List<SmsBucketInfo> sms_bucket_info;
	public List<SmsList> getSms_list() {
		return sms_list;
	}
	public void setSms_list(List<SmsList> sms_list) {
		this.sms_list = sms_list;
	}
	public List<SmsBucketInfo> getSms_bucket_info() {
		return sms_bucket_info;
	}
	public void setSms_bucket_info(List<SmsBucketInfo> sms_bucket_info) {
		this.sms_bucket_info = sms_bucket_info;
	}
}
