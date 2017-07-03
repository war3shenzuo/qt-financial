package com.qtjf.appserver.server.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.qtjf.appserver.dao.QtFinancialBorrowMoneyMapper;
import com.qtjf.appserver.server.BorrowMoneyServer;
import com.qtjf.common.bean.QtFinancialBorrowMoney;

public class BorrowMoneyServerImpl implements BorrowMoneyServer {
	
	@Autowired
	QtFinancialBorrowMoneyMapper bmdao;

	@Override
	public void add(QtFinancialBorrowMoney bm) throws Exception {
		bmdao.insert(bm);
	}

}
