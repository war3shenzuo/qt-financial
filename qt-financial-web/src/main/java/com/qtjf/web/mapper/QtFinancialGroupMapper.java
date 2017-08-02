package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialGroup;

public interface QtFinancialGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialGroup record);

    QtFinancialGroup selectByPrimaryKey(Integer id);

    List<QtFinancialGroup> selectAll();

    int updateByPrimaryKey(QtFinancialGroup record);
}