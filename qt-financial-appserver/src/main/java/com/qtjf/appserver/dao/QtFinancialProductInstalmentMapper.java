package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialProductInstalment;

public interface QtFinancialProductInstalmentMapper {
    int deleteByPrimaryKey(String id);

    int insert(QtFinancialProductInstalment record);

    QtFinancialProductInstalment selectByPrimaryKey(String id);

    List<QtFinancialProductInstalment> selectAll();

    int updateByPrimaryKey(QtFinancialProductInstalment record);
}