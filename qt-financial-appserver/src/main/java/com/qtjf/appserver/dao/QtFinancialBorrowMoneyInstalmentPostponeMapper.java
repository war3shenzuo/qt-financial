package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialBorrowMoneyInstalmentPostpone;

public interface QtFinancialBorrowMoneyInstalmentPostponeMapper {
	int deleteByPrimaryKey(String id);

	int insert(QtFinancialBorrowMoneyInstalmentPostpone record);

	QtFinancialBorrowMoneyInstalmentPostpone selectByPrimaryKey(String id);

	List<QtFinancialBorrowMoneyInstalmentPostpone> selectAll();

	int updateByPrimaryKey(QtFinancialBorrowMoneyInstalmentPostpone record);
	
	QtFinancialBorrowMoneyInstalmentPostpone selectLastByInstalmentId(String instalmentId);
}