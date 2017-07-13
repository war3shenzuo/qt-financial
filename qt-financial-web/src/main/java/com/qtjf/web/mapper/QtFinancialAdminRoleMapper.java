package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.web.entity.QtFinancialAdminRole;

public interface QtFinancialAdminRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAdminRole record);

    QtFinancialAdminRole selectByPrimaryKey(Integer id);

    List<QtFinancialAdminRole> selectAll();

    int updateByPrimaryKey(QtFinancialAdminRole record);
}