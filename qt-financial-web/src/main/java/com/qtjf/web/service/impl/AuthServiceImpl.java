package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinancialAuthentication;
import com.qtjf.web.mapper.QtFinancialAuthenticationMapper;
import com.qtjf.web.service.AuthService;
import com.qtjf.web.util.StringUtil;

@Service
public class AuthServiceImpl implements AuthService {
	
	@Autowired
	private QtFinancialAuthenticationMapper qtFinancialAuthenticationMapper;

	@Override
	public Map<String, Object> getAuths(String userId) {
		Map<String,Object> map = new HashMap<>();
		try{
			QtFinancialAuthentication qa = new QtFinancialAuthentication();
			qa.setUserId(userId);
			List<QtFinancialAuthentication> list = qtFinancialAuthenticationMapper.selectAll(qa);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			map.put(StringUtil.responseObjList, list);
		} catch (Exception e){
			map.put(StringUtil.responseCode, StringUtil.resposeError);
			e.printStackTrace();
			
		}
		return null;
	}

	@Override
	public Map<String, Object> getAuthInfo(QtFinancialAuthentication qa) {
		switch (qa.getAuthType()) {
			case "PHONE":
				
				break;
			case "BASE":
				
				break;
			case "IDENTIFICATION":
				
				break;
			case "CONTACT":  
				
				break;
			case "WX":
				
				break;
			default:
				break;
		}
		return null;
	}

}
