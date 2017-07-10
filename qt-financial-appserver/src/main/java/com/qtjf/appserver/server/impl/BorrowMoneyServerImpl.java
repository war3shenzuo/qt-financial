package com.qtjf.appserver.server.impl;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.QtFinancialBorrowMoneyFlowMapper;
import com.qtjf.appserver.dao.QtFinancialBorrowMoneyMapper;
import com.qtjf.appserver.server.BorrowMoneyServer;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialBorrowMoneyFlow;
import com.qtjf.common.emus.borrowStatus;

@Service
@Transactional
public class BorrowMoneyServerImpl implements BorrowMoneyServer {
	
	@Autowired
	QtFinancialBorrowMoneyMapper bmdao;
	
	@Autowired
	QtFinancialBorrowMoneyFlowMapper bmfdao;

	@Override
	public void add(QtFinancialBorrowMoney bm) throws Exception {
		bm.setId(UUID.randomUUID().toString());
		bm.setStatus(borrowStatus.APPLY.getStatus());
		bm.setCreatedAt(new Date().getTime());
		bm.setApplyAt(new Date().getTime());
		bmdao.insert(bm);
		
		//增加流程进度记录
		QtFinancialBorrowMoneyFlow bmf = new QtFinancialBorrowMoneyFlow();
		bmf.setId(UUID.randomUUID().toString());
		bmf.setStatus(borrowStatus.APPLY.getStatus());
		bmf.setComment("请等待客服人员进行审核");
		bmf.setUpdatedat(new Date());
		bmf.setBorrowId(bm.getId());
		bmfdao.insert(bmf);
	}
	
	@Override
	public void updateStatus(String id, String status) {
		QtFinancialBorrowMoney bm = new QtFinancialBorrowMoney();
		bm.setId(id);
		bm.setStatus(status);
		update(bm);
		
		QtFinancialBorrowMoneyFlow bmf = new QtFinancialBorrowMoneyFlow();
		bmf.setId(UUID.randomUUID().toString());
		bmf.setUpdatedat(new Date());
		bmf.setBorrowId(bm.getId());
		//增加流程进度记录
		if(Objects.equals(status, borrowStatus.CANCEL.getStatus())){
			bmf.setStatus(borrowStatus.CANCEL.getStatus());
			bmf.setComment("用户已取消申请");
		}
		
		bmfdao.insert(bmf);
		
	}

	@Override
	public void update(QtFinancialBorrowMoney bm) {
		bmdao.updateByPrimaryKey(bm);
	}

	@Override
	public List<QtFinancialBorrowMoney> getBorrowMoneys(String userId) {
		QtFinancialBorrowMoney bm = new QtFinancialBorrowMoney();
		bm.setUserId(userId);
		return bmdao.selectAll(bm);
	}

	@Override
	public QtFinancialBorrowMoney getBorrowMoneysInfo(String id) {
		return bmdao.selectByPrimaryKey(id);
	}

}
