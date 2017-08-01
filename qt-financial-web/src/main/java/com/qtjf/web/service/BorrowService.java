package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface BorrowService {
	
	//借款申请,borrowStatus.APPLY
	Map<String,Object> getBorrows(QtFinancialBorrowMoney qm);
	
	//更新借款状态
	Map<String,Object> updateBorrows(QtFinancialBorrowMoney qm);

	// 经理审核的记录
	Map<String, Object> selectManageAll(Map<String, Object> paramMap);
}
