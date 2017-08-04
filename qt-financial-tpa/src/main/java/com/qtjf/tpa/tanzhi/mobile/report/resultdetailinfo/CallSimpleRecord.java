package com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo;

import java.util.List;

import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.callrecord.CallBucketInfo;


public class CallSimpleRecord {

	private Integer callers_number;
	private List<CallBucketInfo> call_bucket_info;
	
	public Integer getCallers_number() {
		return callers_number;
	}
	public void setCallers_number(Integer callers_number) {
		this.callers_number = callers_number;
	}
	public List<CallBucketInfo> getCall_bucket_info() {
		return call_bucket_info;
	}
	public void setCall_bucket_info(List<CallBucketInfo> call_bucket_info) {
		this.call_bucket_info = call_bucket_info;
	}

}
