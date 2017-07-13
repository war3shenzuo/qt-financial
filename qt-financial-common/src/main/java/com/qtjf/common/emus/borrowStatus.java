package com.qtjf.common.emus;

public enum borrowStatus {
	
	
	APPLY("1r","已经申请"),
	CHECK("2r","审核员审核情况"),
	CHECK_M("3r","审核经理审核情况"),
	PAY("4r","打款情况"),
	REPAY("5r","还款期限"),
	EXP("6r","到期提醒"),
	OVERDUE("7r","逾期提醒"),
	POSTPONE("8r","延期成功"),
	
	CANCEL("1e","取消申请"),
	NOCHECK("2e","审核员审核未通过"),
	NOCHECK_M("3e","审核经理审核未通过"),
	NOPAY("4e","打款未通过"),
	FINISH("5e","还款成功"),
	AHEAD("6e","提前还款成功"),
	
	
	INSTALMENT_CLOSE("1","已还清"),
	INSTALMENT_RUN("0","未还清");
	
	
	
	

	
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
