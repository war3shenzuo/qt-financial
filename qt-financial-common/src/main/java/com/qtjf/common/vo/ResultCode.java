package com.qtjf.common.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.qtjf.common.emus.SysStatus;


/**
 * @author shixianjie
 * @createTime 创建时间：2017年3月22日
 * 类说明 接口返回的对象
 */
public class ResultCode implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8524835075858984975L;

	/** 返回状态码,使用系统定义的常量 */
	private int status;

	/** 提示信息 */
	private String msg;

	/** 记录条数 */
	private int dataNum;

	/** 返回数据集，可以是各种类型 */
	private Object data;
	
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

	public int getDataNum() {
		return dataNum;
	}

	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public ResultCode() {
	}

	public ResultCode(int status, String msg, int dataNum, Object data) {
		this.status = status;
		this.msg = msg;
		this.dataNum = dataNum;
		this.data = data;
	}

	public ResultCode(int status, String msg) {
		this.status = status;
		this.msg = msg;
		this.dataNum = 0;
		this.data = null;
	}

	/** */
	public static ResultCode getError(String msg) {
		return new ResultCode(SysStatus.ERROR.getStatus(), msg);
	}

	/** 操作成功 */
	public static ResultCode getSuccess() {
		return new ResultCode(SysStatus.SUCCESS.getStatus(),SysStatus.SUCCESS.getMsg());
	}
	
	public static ResultCode getSuccess(String msg) {
		return new ResultCode(SysStatus.SUCCESS.getStatus(),msg);
	}
	
	public static ResultCode getSuccess(int num, Object data) {
		return new ResultCode(SysStatus.SUCCESS.getStatus(), SysStatus.SUCCESS.getMsg(), num, data);
	}
	
	public static ResultCode getSuccess(String msg,int num, Object data) {
		return new ResultCode(SysStatus.SUCCESS.getStatus(), msg, num, data);
	}
	
	public static ResultCode getNoDataSuccess(String msg) {
		return new ResultCode(SysStatus.SUCCESS.getStatus(), msg);
	}
	
	/** 操作失败 */
	public static ResultCode getFail() {
		return new ResultCode(SysStatus.FAIL.getStatus(),SysStatus.FAIL.getMsg());
	}

	public static ResultCode getFail(String msg) {
		return new ResultCode(SysStatus.FAIL.getStatus(), msg);
	}

	public static ResultCode getChatName(String chatName) {
		Map<String, String> map = new HashMap<>();
		map.put("chatName", chatName);
		return new ResultCode(SysStatus.SUCCESS.getStatus(), "会话名称", 0, map);
	}

	/** 未查询到数据 */
	public static ResultCode getNoData() {
		return new ResultCode(SysStatus.NO_DATA.getStatus(),SysStatus.NO_DATA.getMsg());
	}


}
