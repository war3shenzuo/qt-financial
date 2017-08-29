package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.web.entity.QtFinancialProductInstalment;


public interface QtFinancialProductInstalmentMapper {
    int deleteByPrimaryKey(String id);

    int insert(QtFinancialProductInstalment record);

    QtFinancialProductInstalment selectByPrimaryKey(String id);

    List<QtFinancialProductInstalment> selectAll();

    int updateByPrimaryKey(QtFinancialProductInstalment record);
}