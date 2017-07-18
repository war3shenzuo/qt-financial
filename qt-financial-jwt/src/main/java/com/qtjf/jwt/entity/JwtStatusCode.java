package com.qtjf.jwt.entity;

public enum JwtStatusCode {
	OK(30000, "验证成功"), FAIL(30001, "验证失败"), EXPIRE_TOKEN(30002, "token过期"), FORMAT_TOKEN(30003, "token格式错误");

	private int code;
	private String msg;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	private JwtStatusCode(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}
}
