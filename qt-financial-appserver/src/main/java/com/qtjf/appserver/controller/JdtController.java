package com.qtjf.appserver.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.qtjf.appserver.server.AuthenticationServer;
import com.qtjf.common.vo.ResultCode;
import com.qtjf.tpa.jdt.bean.UserInfo;
import com.qtjf.tpa.jdt.server.GenerateServer;

/**
 * 借贷通api认证Controller类
 * 
 * @author 史贤杰 2017/07/25
 */
@RestController
@RequestMapping("/jdt")
public class JdtController {
	
	@Autowired
	private GenerateServer jdtServer;
	
	@Autowired
 AuthenticationServer authenticationServer;
	

	/**
	 * 获取认证token
	 * @return
	 */
	@RequestMapping(value = "reqToken")
	public String reqToken(String app_id, String perso_name, String mobile_number, String id_number) {
		return jdtServer.reqToken(app_id, perso_name, mobile_number, id_number);
	}
	
	/**
	 * 提交用户基本信息
	 * @return
	 */
	@RequestMapping(value = "submitApplicationInfo")
	public String submitApplicationInfo(UserInfo user,String dk ,String token) {
		return jdtServer.submitApplicationInfo(user, dk, token);
	}
	
	/**
	 * 用户手机验证
	 * @return
	 */
	@RequestMapping(value = "submitMobile")
	public ResultCode submitMobile(String dk ,String token,String password,String captcha,String userId,String mobile) {
		
		String result = jdtServer.submitMobile( dk, token,password,captcha);
		JSONObject json = JSONObject.parseObject(result);
		if(Objects.equals(json.get("status_code"), 10008)){
			authenticationServer.saveMobile(userId,mobile,password);
			return ResultCode.getSuccess("申请验证成功");
		}
		return new ResultCode((int )json.get("status_code"),(String)json.get("message"),null);
	}
	
	/**
	 * 完成申请
	 * @return
	 */
	@RequestMapping(value = "finishApplication")
	public String finishApplication(String dk ,String token,Integer DurationNumber,Integer LovDurationType,Integer RequestAmount) {
		return jdtServer.finishApplication( dk, token,DurationNumber,LovDurationType,RequestAmount);
	}

}
