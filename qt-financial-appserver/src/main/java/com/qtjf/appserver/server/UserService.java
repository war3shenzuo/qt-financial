package com.qtjf.appserver.server;

import java.util.List;

import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.bean.QtFinancialUserSmsCode;

public interface UserService {

	QtFinancialUser getUserInfoByMobile(String mobile);

	List<QtFinancialUser> getUserList(QtFinancialUser setUsermobile);

	void inset(QtFinancialUser user) throws Exception;

	void sumbitVerifyCrad(String mobile, String idcrad, String realName);

    void saveSmsCode(QtFinancialUserSmsCode smsCode);

    void verifySmsCode(QtFinancialUserSmsCode smsCode);
}
