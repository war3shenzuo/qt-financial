package com.qtjf.common.emus;

public enum borrowStatus {
	
	LEVEL_1(1,"已经申请"),
	LEVEL_2(2,"审核情况"),
	LEVEL_3(3,"打款情况"),
	LEVEL_4(4,"还款期限"),
	LEVEL_5(5,"到期提醒"),
	LEVEL_6(6,"逾期提醒"),
	LEVEL_7(7,"延期成功"),
	LEVEL_8(8,"还款成功");

	
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
