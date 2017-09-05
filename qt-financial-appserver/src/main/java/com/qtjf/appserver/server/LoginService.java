package com.qtjf.appserver.server;

import java.util.Map;

public interface LoginService {

	String sendRegisterSmsCode(String mobile) throws Exception;
	
	/**
	 * 获取版本
	 * @param editionType
	 * @param editionCode
	 * @return
	 */
	Map<String, String> getEdition(String editionType, String editionCode);

}
