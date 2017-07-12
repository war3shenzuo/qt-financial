package com.qtjf.common.emus;

public enum AuthType {

	PHONE("手机认证"),
	BASE("个人信息认证"),
	IDENTIFICATION("身份证认证"),
	CONTACT("通讯录授权"),
	WX("微信认证");
	
	
	private String msg ;
	
	private AuthType(String msg){
		this.msg = msg ;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
