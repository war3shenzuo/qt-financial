package com.qtjf.common.emus;

public enum Authentication {
	STATUS_NO_APPLY("0","未申请"),
	STATUS_APPLY("1","已申请"),
	STATUS_PASS("2","通过认证"),
	STATUS_PAST("3","过期"),
	
	TYPE_PHONE("0","手机认证"),
	TYPE_PERSONAL("1","个人信息认证"),
	TYPE_CID("2","身份认证"),
	TYPE_BANK("3","银行/工资卡认证"),
	TYPE_WECHAT("4","微信认证"),
	TYPE_ADDBOOK("5","通讯录授权"),
	TYPE_ZHIMAXINYONG("6","获取芝麻信用分");

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
	
	private Authentication(String status,String msg){
		this.status = status ;
		this.msg = msg ;
	}
	

}
