package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialUser;

public interface QtFinancialUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialUser record);

    QtFinancialUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(QtFinancialUser record);

	List<QtFinancialUser> selectAll(QtFinancialUser user);

	void sumbitVerifyCrad(QtFinancialUser user);
}