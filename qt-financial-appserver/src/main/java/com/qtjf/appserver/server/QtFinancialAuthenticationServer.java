package com.qtjf.appserver.server;

public interface QtFinancialAuthenticationServer {

	void saveTaobaoQrMsg(String string, String userId);

	void saveTaobaoInfo(String token, String userId);

	String getTaobaoQRMsg(String userId);


}
