package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.web.entity.QtFinancialAdminUser;

public interface QtFinancialAdminUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAdminUser record);

    QtFinancialAdminUser selectByPrimaryKey(Integer id);

    List<QtFinancialAdminUser> selectAll();

    int updateByPrimaryKey(QtFinancialAdminUser record);

	QtFinancialAdminUser selectByName(String name);
}