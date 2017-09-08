package com.qtjf.appserver.controller;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.AuthenticationServer;
import com.qtjf.appserver.server.UserService;
import com.qtjf.common.bean.QtFinancialAuthentication;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.vo.ResultCode;

/**
 * 产品Controller类
 * 
 * @author 史贤杰 2017/07/01
 */
@RestController
@RequestMapping("users")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	AuthenticationServer authenticationServer;

	/**
	 * 获取用户信息
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getUserInfo")
	public ResultCode getUserInfo(@NotNull String mobile) throws Exception {
		QtFinancialUser user = userService.getUserInfoByMobile(mobile);
		return ResultCode.getSuccess("获取认证成功", user);
	}

	/**
	 * 获取用户认证信息
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getUserAuthInfo")
	public ResultCode getUserAuthInfo(@NotNull String userId) throws Exception {
		List<QtFinancialAuthentication> list = authenticationServer.getAuthenticationList(userId);
		return ResultCode.getSuccess("获取认证成功", list);
	}
	
	/**
	 * 保存已认证的身份证
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("sumbitVerifyCrad")
	public ResultCode sumbitVerifyCrad(@NotNull String Mobile,String idcrad,String realName ) throws Exception {
		userService.sumbitVerifyCrad(Mobile,idcrad,realName);
		return ResultCode.getSuccess("保存成功");
	}

}
