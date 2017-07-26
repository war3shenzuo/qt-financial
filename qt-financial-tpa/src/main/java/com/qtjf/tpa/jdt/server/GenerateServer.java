package com.qtjf.tpa.jdt.server;

import com.qtjf.tpa.jdt.bean.UserInfo;

public interface GenerateServer {

	/**
	 * 返回token
	 * 
	 * @param app_id
	 * @param perso_name
	 * @param mobile_number
	 * @param id_number
	 * @return
	 */
	public String reqToken(String app_id, String perso_name, String mobile_number, String id_number);

	/**
	 * 提交用户基本信息
	 * 
	 * @return
	 */
	public String submitApplicationInfo(UserInfo user, String dk, String token);

	/**
	 * 
	 * @param dk  产品Key （必填）
	 * @param token 由接口reqToken获取（必填）
	 * @param password 运营商服务密码 （必填）
	 * @param captcha 验证码 （有则必填）
	 * @return
	 */
	String submitMobile(String dk, String token, String password, String captcha);
	
	/**
	 * 
	 * @param dk 产品Key （必填）
	 * @param token 由接口reqToken获取（必填）
	 * @param durationNumber 借款额度 （必填）
	 * @param lovDurationType 还款周期类型 （必填）
	 * @param requestAmount 还款周期 （必填）
	 * @return
	 */
	public String finishApplication(String dk, String token, Integer durationNumber, Integer lovDurationType,
			Integer requestAmount);

}
