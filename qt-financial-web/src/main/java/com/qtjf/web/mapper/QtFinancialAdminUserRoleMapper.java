package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.web.entity.QtFinancialAdminUserRole;

public interface QtFinancialAdminUserRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAdminUserRole record);

    QtFinancialAdminUserRole selectByPrimaryKey(Integer id);

    List<QtFinancialAdminUserRole> selectAll();

    int updateByPrimaryKey(QtFinancialAdminUserRole record);
}