package com.qtjf.common.emus;

public enum User {
	
	LEVEL_1(1,"青铜客户"),
	LEVEL_2(2,"白银客户"),
	LEVEL_3(3,"黄金客户"),
	LEVEL_4(4,"铂金客户"),
	LEVEL_5(5,"钻石客户"),
	LEVEL_6(6,"荣耀客户"),
	LEVEL_7(7,"特约客户");
	
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
	
	private User(int status,String msg){
		this.status = status ;
		this.msg = msg ;
	}
	
	
}
