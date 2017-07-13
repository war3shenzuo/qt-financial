package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.web.entity.QtFinancialAdminRoleMenu;

public interface QtFinancialAdminRoleMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAdminRoleMenu record);

    QtFinancialAdminRoleMenu selectByPrimaryKey(Integer id);

    List<QtFinancialAdminRoleMenu> selectAll();

    int updateByPrimaryKey(QtFinancialAdminRoleMenu record);
}