package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialActivityUser;

public interface QtFinancialActivityUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialActivityUser record);

    QtFinancialActivityUser selectByPrimaryKey(Integer id);

    List<QtFinancialActivityUser> selectAll();

    int updateByPrimaryKey(QtFinancialActivityUser record);
}