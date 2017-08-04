package com.qtjf.appserver.server.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.server.LoginService;
import com.qtjf.common.util.SmsUtil;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Override
	public String  sendRegisterSmsCode(String mobile) throws Exception {
		return SmsUtil.loginAuthCode(mobile, "888888");
	}

}
