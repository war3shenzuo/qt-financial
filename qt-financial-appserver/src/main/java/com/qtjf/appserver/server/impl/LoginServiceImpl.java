package com.qtjf.appserver.server.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.LoginMapper;
import com.qtjf.appserver.server.LoginService;
import com.qtjf.common.util.SmsUtil;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public String  sendRegisterSmsCode(String mobile,String authCode) throws Exception {
		return SmsUtil.loginAuthCode(mobile, authCode);
	}

	@Override
	public Map<String, String> getEdition(String editionType, String editionCode) {
		
		Map<String,String> map = new HashMap<>();
		map.put("platform", editionType);
		map.put("edition", editionCode);
		
		return loginMapper.getEdition(map);
	}

}
