package com.qtjf.appserver.server;

import java.util.List;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface BorrowMoneyServer {
	
	/**
	 * 新增借钱订单
	 * @param bm 
	 * @throws Exception
	 */
	void add(QtFinancialBorrowMoney bm) throws Exception;
	
	/**
	 * 修改借钱订单记录
	 * @param bm
	 */
	void update(QtFinancialBorrowMoney bm) throws Exception;
	
	/**
	 * 修改借钱订单记录状态
	 * @param bm
	 */
	void updateStatus(String id, String status) throws Exception;
	
	/**
	 * 查询我的借钱订单
	 * @param userId
	 * @return
	 */
	List<QtFinancialBorrowMoney> getBorrowMoneys(String userId);

}
