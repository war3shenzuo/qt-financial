package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialUserLevel;

public interface QtFinancialUserLevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialUserLevel record);

    QtFinancialUserLevel selectByPrimaryKey(Integer id);

    List<QtFinancialUserLevel> selectAll();

    int updateByPrimaryKey(QtFinancialUserLevel record);
}