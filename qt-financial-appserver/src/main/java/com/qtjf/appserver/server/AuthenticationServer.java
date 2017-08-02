package com.qtjf.appserver.server;

import com.qtjf.common.bean.QtFinancialAuthentication;

public interface QtFinancialAuthenticationServer {

	void saveTaobaoQrMsg(String string, String userId);

	void saveTaobaoInfo(String token, String userId);

	String getTaobaoQRMsg(String userId);

    void insert(QtFinancialAuthentication record) throws Exception;

}
