package com.qtjf.appserver.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.qtjf.appserver.server.AuthenticationServer;
import com.qtjf.common.bean.QtFinacialAuthenticationBase;
import com.qtjf.common.bean.QtFinacialAuthenticationEmergencyContact;
import com.qtjf.common.bean.QtFinacialAuthenticationProfession;
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
	 * @throws Exception 
	 */
	@RequestMapping(value = "submitMobile")
	public ResultCode submitMobile(String dk ,String token,String password,String captcha,String userId,String mobile) throws Exception {
		
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
	
	/**
	 * 上传用户基本信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "submitUserBase")
	public ResultCode submitUserBase(QtFinacialAuthenticationBase userBase,String userId) throws Exception {
		 authenticationServer.submitUserBase(userBase,userId);
		 return ResultCode.getSuccess("基本信息提交成");
	}
	
	/**
	 * 上传单位信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "submitProfession")
	public ResultCode submitProfession(QtFinacialAuthenticationProfession profession,String userId) throws Exception {
		 authenticationServer.submitProfession(profession,userId);
		 return ResultCode.getSuccess("单位信息提交成");
	}
	
	/**
	 * 上传紧急联系人信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "submitEmergencyContract")
	public ResultCode submitEmergencyContract(QtFinacialAuthenticationEmergencyContact emergencyContact,String userId) throws Exception {
		 authenticationServer.submitEmergencyContract(emergencyContact,userId);
		 return ResultCode.getSuccess("紧急联系人信息");
	}
	

}
