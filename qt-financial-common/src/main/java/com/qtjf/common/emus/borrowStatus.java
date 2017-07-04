package com.qtjf.common.emus;

public enum borrowStatus {
	
	APPLY(1,"已经申请"),
	CHECK(2,"审核情况"),
	PAY(3,"打款情况"),
	REPAY(4,"还款期限"),
	EXP(5,"到期提醒"),
	OVERDUE(6,"逾期提醒"),
	POSTPONE(7,"延期成功"),
	FINISH(8,"还款成功");

	
	/** 返回状态码*/
	private int status ;
	
	/** 返回消息*/
	private String msg ;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	private borrowStatus(int status,String msg){
		this.status = status ;
		this.msg = msg ;
	}
	
	
}
