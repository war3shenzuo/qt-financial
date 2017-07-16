package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialBorrowMoneyInstalment;

public interface QtFinancialBorrowMoneyInstalmentMapper {
	
    int deleteByPrimaryKey(String id);

    int insert(QtFinancialBorrowMoneyInstalment record);

    QtFinancialBorrowMoneyInstalment selectByPrimaryKey(String id);

    List<QtFinancialBorrowMoneyInstalment> selectAll(QtFinancialBorrowMoneyInstalment instalment);

	int updateByPrimaryKey(QtFinancialBorrowMoneyInstalment record);

	List<QtFinancialBorrowMoneyInstalment> selectRunAll(QtFinancialBorrowMoneyInstalment param);


}