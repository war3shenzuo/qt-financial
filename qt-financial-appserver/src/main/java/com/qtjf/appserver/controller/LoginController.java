package com.qtjf.appserver.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.jwt.entity.AccessToken;
import com.qtjf.jwt.entity.JwtConfig;
import com.qtjf.jwt.token.JwtTokenBuilder;

@RestController
public class LoginController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private JwtConfig jwtConfig;
	
	/**
	 * 登录
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public AccessToken login(String username, String password, String captcha) throws Exception {
		// 验证码校验

		// 用户名密码验证
		JwtTokenBuilder jwtTokenBuilder = new JwtTokenBuilder();

		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		map.put("username", username);
		String subject = JwtTokenBuilder.buildSubject(map);

		@SuppressWarnings("static-access")
		String accessToken = jwtTokenBuilder.buildToken(subject, jwtConfig.getExpiresSecond(),
				jwtConfig.getBase64Secret());

		AccessToken token = new AccessToken();
		token.setAccess_token(accessToken);
		token.setToken_type(jwtConfig.getTokenType());
		token.setExpires_in(jwtConfig.getExpiresSecond());

		return token;
	}
}
