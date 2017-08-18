package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialActivity;

public interface QtFinancialActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialActivity record);

    QtFinancialActivity selectByPrimaryKey(Integer id);

    List<QtFinancialActivity> selectAll();

    int updateByPrimaryKey(QtFinancialActivity record);
}