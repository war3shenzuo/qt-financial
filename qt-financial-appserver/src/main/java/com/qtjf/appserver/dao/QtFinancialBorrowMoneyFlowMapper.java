package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialBorrowMoneyFlow;

public interface QtFinancialBorrowMoneyFlowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialBorrowMoneyFlow record);

    QtFinancialBorrowMoneyFlow selectByPrimaryKey(Integer id);

    List<QtFinancialBorrowMoneyFlow> selectAll();

    int updateByPrimaryKey(QtFinancialBorrowMoneyFlow record);
}