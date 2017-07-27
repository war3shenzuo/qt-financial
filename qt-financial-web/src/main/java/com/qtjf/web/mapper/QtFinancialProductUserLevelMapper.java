package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialProductUserLevel;

public interface QtFinancialProductUserLevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialProductUserLevel record);

    QtFinancialProductUserLevel selectByPrimaryKey(Integer id);

    List<QtFinancialProductUserLevel> selectAll();

    int updateByPrimaryKey(QtFinancialProductUserLevel record);
}