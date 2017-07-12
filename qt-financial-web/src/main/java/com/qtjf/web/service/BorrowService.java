package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface BorrowService {
	
	//借款申请,borrowStatus.APPLY
	Map<String,Object> getBorrows(QtFinancialBorrowMoney qm);
	
	//更新借款状态
	Map<String,Object> updateBorrows(QtFinancialBorrowMoney qm);
}
