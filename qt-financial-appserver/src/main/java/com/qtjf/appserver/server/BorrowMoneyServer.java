package com.qtjf.appserver.server;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface BorrowMoneyServer {
	
	/**
	 * 新增借钱
	 * @param bm 
	 * @throws Exception
	 */
	void add(QtFinancialBorrowMoney bm) throws Exception;
	
	/**
	 * 修改借钱记录
	 * @param bm
	 */
	void update(QtFinancialBorrowMoney bm);

	void updateStatus(String id, String status);

}
