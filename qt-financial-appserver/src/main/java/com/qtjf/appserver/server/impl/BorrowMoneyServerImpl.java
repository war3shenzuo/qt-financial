package com.qtjf.appserver.server.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.appserver.dao.QtFinancialBorrowMoneyMapper;
import com.qtjf.appserver.server.BorrowMoneyServer;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.emus.borrowStatus;

@Service
public class BorrowMoneyServerImpl implements BorrowMoneyServer {
	
	@Autowired
	QtFinancialBorrowMoneyMapper bmdao;

	@Override
	public void add(QtFinancialBorrowMoney bm) throws Exception {
		bm.setId(UUID.randomUUID().toString());
		bm.setStatus(borrowStatus.APPLY.getStatus());
		bm.setCreatedAt(new Date().getTime());
		bm.setApplyAt(new Date().getTime());
		bmdao.insert(bm);
	}

	@Override
	public void update(QtFinancialBorrowMoney bm) {
		bmdao.updateByPrimaryKey(bm);
	}

	@Override
	public void updateStatus(String id, String status) {
		QtFinancialBorrowMoney bm = new QtFinancialBorrowMoney();
		bm.setId(id);
		bm.setStatus(status);
		update(bm);
	}

}
