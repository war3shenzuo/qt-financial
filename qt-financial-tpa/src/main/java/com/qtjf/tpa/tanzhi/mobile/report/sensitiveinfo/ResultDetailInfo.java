package com.qtjf.tpa.tanzhi.mobile.report.sensitiveinfo;

import java.util.List;

import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.ApplierHitBlackCheck;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.CallRecord;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.CallSimpleRecord;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.ContactsHitBlackCheck;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.InserviceDurationCheck;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.OperatorInfoCheck;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.SmsRecord;
import com.qtjf.tpa.tanzhi.mobile.report.resultdetailinfo.SmsSimpleRecord;

public class ResultDetailInfo {

	private OperatorInfoCheck operator_info_check;//10100
	private InserviceDurationCheck inservice_duration_check;//10200
	private List<ContactsHitBlackCheck> contacts_hit_black_check;//30100
	private ApplierHitBlackCheck applier_hit_black_check;//20100
	private CallRecord call_record;//30200、50100、50200、50300、50500、60100、60200、60300
	private CallSimpleRecord call_simple_record;//40100
	private SmsRecord sms_record;//30200、50100、50400
	private SmsSimpleRecord sms_simple_record;//40100
	
	public OperatorInfoCheck getOperator_info_check() {
		return operator_info_check;
	}
	public void setOperator_info_check(OperatorInfoCheck operator_info_check) {
		this.operator_info_check = operator_info_check;
	}
	public InserviceDurationCheck getInservice_duration_check() {
		return inservice_duration_check;
	}
	public void setInservice_duration_check(InserviceDurationCheck inservice_duration_check) {
		this.inservice_duration_check = inservice_duration_check;
	}
	public List<ContactsHitBlackCheck> getContacts_hit_black_check() {
		return contacts_hit_black_check;
	}
	public void setContacts_hit_black_check(List<ContactsHitBlackCheck> contacts_hit_black_check) {
		this.contacts_hit_black_check = contacts_hit_black_check;
	}
	public ApplierHitBlackCheck getApplier_hit_black_check() {
		return applier_hit_black_check;
	}
	public void setApplier_hit_black_check(ApplierHitBlackCheck applier_hit_black_check) {
		this.applier_hit_black_check = applier_hit_black_check;
	}
	public CallRecord getCall_record() {
		return call_record;
	}
	public void setCall_record(CallRecord call_record) {
		this.call_record = call_record;
	}
	public CallSimpleRecord getCall_simple_record() {
		return call_simple_record;
	}
	public void setCall_simple_record(CallSimpleRecord call_simple_record) {
		this.call_simple_record = call_simple_record;
	}
	public SmsRecord getSms_record() {
		return sms_record;
	}
	public void setSms_record(SmsRecord sms_record) {
		this.sms_record = sms_record;
	}
	public SmsSimpleRecord getSms_simple_record() {
		return sms_simple_record;
	}
	public void setSms_simple_record(SmsSimpleRecord sms_simple_record) {
		this.sms_simple_record = sms_simple_record;
	}
	
}
