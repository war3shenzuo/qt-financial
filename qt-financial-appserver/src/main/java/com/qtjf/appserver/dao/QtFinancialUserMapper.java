package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.bean.QtFinancialUserSmsCode;

public interface QtFinancialUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialUser record);

    QtFinancialUser selectByPrimaryKey(Integer id);
    
    QtFinancialUser selectByPrimaryMobile(String userMobile);

    int updateByPrimaryKey(QtFinancialUser record);

	List<QtFinancialUser> selectAll(QtFinancialUser user);

	void sumbitVerifyCrad(QtFinancialUser user);

    void saveSmsCode(QtFinancialUserSmsCode smsCode);

    QtFinancialUserSmsCode selectSmsCode(QtFinancialUserSmsCode smsCode);
}