package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface QtFinancialBorrowMoneyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialBorrowMoney record);

    QtFinancialBorrowMoney selectByPrimaryKey(Integer id);

    List<QtFinancialBorrowMoney> selectAll();

    int updateByPrimaryKey(QtFinancialBorrowMoney record);
}