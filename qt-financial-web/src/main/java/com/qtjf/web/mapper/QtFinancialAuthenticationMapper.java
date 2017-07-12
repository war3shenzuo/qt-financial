package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialAuthentication;

public interface QtFinancialAuthenticationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAuthentication record);

    QtFinancialAuthentication selectByPrimaryKey(Integer id);

    List<QtFinancialAuthentication> selectAll(QtFinancialAuthentication qa);

    int updateByPrimaryKey(QtFinancialAuthentication record);
}