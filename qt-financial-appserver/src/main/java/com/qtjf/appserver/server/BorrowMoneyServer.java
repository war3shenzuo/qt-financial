package com.qtjf.appserver.server;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface BorrowMoneyServer {
	
	/**
	 * 新增借钱
	 * @param bm 
	 * @throws Exception
	 */
	void add(QtFinancialBorrowMoney bm) throws Exception;

}
