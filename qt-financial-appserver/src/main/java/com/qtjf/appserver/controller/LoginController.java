package com.qtjf.appserver.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.BannerServer;
import com.qtjf.appserver.server.LoginService;
import com.qtjf.appserver.server.UserService;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.vo.ResultCode;
import com.qtjf.jwt.entity.AccessToken;
import com.qtjf.jwt.entity.JwtConfig;
import com.qtjf.jwt.token.JwtTokenBuilder;

@RestController
@RequestMapping(value = "/index")
public class LoginController {

	@Autowired
	private JwtConfig jwtConfig;

	@Autowired
	private BannerServer bannerserver;

	@Autowired
	private LoginService loginService;

	@Autowired
	private UserService userService;

	/**
	 * 登录
	 *
	 * @return
	 */
	@RequestMapping(value = "/login")
	public ResultCode login(String mobile, String password, String captcha) throws Exception {
		// 验证码校验

		// 用户名密码验证
		// JwtTokenBuilder jwtTokenBuilder = new JwtTokenBuilder();
		//
		// @SuppressWarnings("rawtypes")
		// Map map = new HashMap();
		// map.put("username", username);
		// String subject = JwtTokenBuilder.buildSubject(map);
		//
		// @SuppressWarnings("static-access")
		// String accessToken = jwtTokenBuilder.buildToken(subject,
		// jwtConfig.getExpiresSecond(),
		// jwtConfig.getBase64Secret());
		//
		// AccessToken token = new AccessToken();
		// token.setAccess_token(accessToken);
		// token.setToken_type(jwtConfig.getTokenType());
		// token.setExpires_in(jwtConfig.getExpiresSecond());

		if (Objects.equals("888888", captcha)) {
			return ResultCode.getSuccess("登陆成功");
		}

		return ResultCode.getError("验证码错误");

	}

	@RequestMapping(value = "/getBanners")
	public ResultCode getBanners() throws Exception {
		return ResultCode.getSuccess("获取banner成功", bannerserver.getBanner());

	}

	@RequestMapping(value = "/sendRegisterSmsCode")
	public ResultCode sendRegisterSmsCode(String mobile) throws Exception {
		String result = loginService.sendRegisterSmsCode(mobile);
		if (Objects.equals(result, "fail")) {
			return ResultCode.getFail("短信发送失败");
		}

		if (Integer.valueOf(result) <= 0) {
			ResultCode.getError(result);
		}

		QtFinancialUser user = new QtFinancialUser();
		user.setUsermobile(mobile);
		List<QtFinancialUser> list = userService.getUserList(user);

		return ResultCode.getSuccess("发送成功", list.size());

	}

	@RequestMapping(value = "/register")
	public ResultCode register(String mobile, String captcha, String invite) throws Exception {
		QtFinancialUser user = new QtFinancialUser();

		if (Objects.equals("888888", captcha)) {
			user.setUsermobile(mobile);
			user.setInviteuser("888888");
			userService.inset(user);
			return ResultCode.getSuccess("注册成功");
		}
		return ResultCode.getError("验证码错误");

	}

}
