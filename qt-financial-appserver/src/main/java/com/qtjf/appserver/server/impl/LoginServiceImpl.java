package com.qtjf.appserver.server.impl;

import com.qtjf.appserver.server.LoginService;
import com.qtjf.common.util.SmsUtil;

public class LoginServiceImpl implements LoginService {

	@Override
	public String  sendRegisterSmsCode(String mobile) throws Exception {
		return SmsUtil.loginAuthCode(mobile, "888888");
	}

}
