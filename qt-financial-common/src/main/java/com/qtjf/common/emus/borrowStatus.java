package com.qtjf.common.emus;

public enum borrowStatus {
	
	CANCEL("0","取消申请"),
	APPLY("1","已经申请"),
	CHECK("2","审核情况"),
	PAY("3","打款情况"),
	REPAY("4","还款期限"),
	EXP("5","到期提醒"),
	OVERDUE("6","逾期提醒"),
	POSTPONE("7","延期成功"),
	FINISH("8","还款成功"),
	AHEAD("9","提前还款成功");

	
	/** 返回状态码*/
	private String status ;
	
	/** 返回消息*/
	private String msg ;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	private borrowStatus(String status,String msg){
		this.status = status ;
		this.msg = msg ;
	}
	
	
}
