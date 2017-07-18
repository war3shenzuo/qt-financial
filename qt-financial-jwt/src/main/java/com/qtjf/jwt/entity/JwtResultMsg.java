package com.qtjf.jwt.entity;

public class JwtResultMsg {
	private int code;
	private String errmsg;
	private Object p2pdata;
	
	
	
	public JwtResultMsg( int code,String errmsg,Object p2pdata){
		this.code = code;
		this.errmsg = errmsg;
		this.p2pdata = p2pdata;
		
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}

	public Object getP2pdata() {
		return p2pdata;
	}

	public void setP2pdata(Object p2pdata) {
		this.p2pdata = p2pdata;
	}

}
