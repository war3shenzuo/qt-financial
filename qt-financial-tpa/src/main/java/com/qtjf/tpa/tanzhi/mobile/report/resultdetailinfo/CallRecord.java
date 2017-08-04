package com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo;

import java.util.List;

import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.callrecord.CallBucketInfo;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.callrecord.CallList;


/**
 * 30200、50100、50200、50300、50500、60100、60200、60300
 * @author darren
 *
 */
public class CallRecord {

	private List<CallList> call_list;
	private List<CallBucketInfo> call_bucket_info;
	
	
	public List<CallList> getCall_list() {
		return call_list;
	}
	public void setCall_list(List<CallList> call_list) {
		this.call_list = call_list;
	}
	public List<CallBucketInfo> getCall_bucket_info() {
		return call_bucket_info;
	}
	public void setCall_bucket_info(List<CallBucketInfo> call_bucket_info) {
		this.call_bucket_info = call_bucket_info;
	}
}
