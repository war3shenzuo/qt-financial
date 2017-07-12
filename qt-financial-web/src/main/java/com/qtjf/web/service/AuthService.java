package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinancialAuthentication;


public interface AuthService {
	
	//根据用户id获取认证情况
	Map<String,Object> getAuths(String userId);
	
	//根据认证类型和id获取认证详情
	Map<String,Object> getAuthInfo(QtFinancialAuthentication qa);
}
