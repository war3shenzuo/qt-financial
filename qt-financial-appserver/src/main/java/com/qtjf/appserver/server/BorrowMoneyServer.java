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
	 * 查询我的借钱订单
	 * @param userId
	 * @return
	 */
	List<QtFinancialBorrowMoney> getBorrowMoneys(String userId);
	
	/**
	 * 查询订单详细信息
	 * @param id
	 * @return
	 */
	QtFinancialBorrowMoney getBorrowMoneysInfo(String id);
	/**
	 * 取消借钱流程
	 * @param id
	 */
	void cancelBorrowMoney(String id) throws Exception;
	
	/**
	 * 提前还款
	 * @param id
	 * @param instalmentId
	 * @param amount
	 */
	void immediatelyBorrowMoney(String id, String instalmentId, String amount);
	

}
