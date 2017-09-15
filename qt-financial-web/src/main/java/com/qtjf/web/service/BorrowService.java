package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface BorrowService {
	
	//借款申请,borrowStatus.APPLY
	Map<String,Object> getBorrows(QtFinancialBorrowMoney qm);
	
	//更新借款状态
	Map<String,Object> updateBorrows(String id, String type,String comment);

	// 订单记录
	Map<String, Object> selectManageAll(Map<String, Object> paramMap);

	//获取订单详情
	Map<String, Object> getBorrowInfo(String id);

	//等待打款
	Map<String, Object> selectPayAll(Map<String, Object> paramMap);
}
