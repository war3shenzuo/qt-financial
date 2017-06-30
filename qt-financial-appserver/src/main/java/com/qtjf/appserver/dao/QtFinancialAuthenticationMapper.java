package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialAuthentication;

public interface QtFinancialAuthenticationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAuthentication record);

    QtFinancialAuthentication selectByPrimaryKey(Integer id);

    List<QtFinancialAuthentication> selectAll();

    int updateByPrimaryKey(QtFinancialAuthentication record);
}