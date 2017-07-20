package com.qtjf.common.emus;
/** 
 * @author shixianjie
 * @version 创建时间：2016年3月22日 
 * 类说明 系统状态返回编码
 */
public enum SysStatus {
	
	/** 操作成功 */
	SUCCESS(200,"操作成功！"),
	
	/** 操作失败 */
	FAIL(400,"操作失败！"),
	
	/** 参数错误 */
	PARAM_FAULT(402,"参数错误"),
	
	/** 没有数据 */
	NO_DATA(401,"未查询到数据！"),
	
	/** 接口不存在 */
	NOT_FOUND(404,"接口不存在"),
	
	/** 服务器错误 */
	ERROR(500,"服务器错误！"),
	
	/** TOKEN格式有误 */
	LAYOUT_INVALID_TOKEN(405,"TOKEN格式有误"),
	/** TOKEN验证失败 */
	CHECK_INVALID_TOKEN(406,"TOKEN验证失败");
	
	/** 返回状态码*/
	private int status ;
	
	/** 返回消息*/
	private String msg ;
	
	public int getStatus() {
		return status;
	}

	public String getMsg() {
		return msg;
	}

	private SysStatus(int status,String msg){
		this.status = status ;
		this.msg = msg ;
	}

}
