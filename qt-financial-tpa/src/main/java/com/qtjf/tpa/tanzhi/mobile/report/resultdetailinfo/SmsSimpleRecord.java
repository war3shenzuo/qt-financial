package com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo;

import java.util.List;

import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.smsrecord.SmsBucketInfo;


/**
 * 40100
 * @author darren
 *
 */
public class SmsSimpleRecord {
	private Integer sender_receiver_number;
	private List<SmsBucketInfo> sms_bucket_info;
	
	public Integer getSender_receiver_number() {
		return sender_receiver_number;
	}
	public void setSender_receiver_number(Integer sender_receiver_number) {
		this.sender_receiver_number = sender_receiver_number;
	}
	public List<SmsBucketInfo> getSms_bucket_info() {
		return sms_bucket_info;
	}
	public void setSms_bucket_info(List<SmsBucketInfo> sms_bucket_info) {
		this.sms_bucket_info = sms_bucket_info;
	}
}
