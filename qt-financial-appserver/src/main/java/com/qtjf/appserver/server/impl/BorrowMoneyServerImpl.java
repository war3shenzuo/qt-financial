package com.qtjf.appserver.server.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.QtFinancialBorrowMoneyFlowMapper;
import com.qtjf.appserver.dao.QtFinancialBorrowMoneyInstalmentMapper;
import com.qtjf.appserver.dao.QtFinancialBorrowMoneyMapper;
import com.qtjf.appserver.dao.QtFinancialProductInstalmentMapper;
import com.qtjf.appserver.server.BorrowMoneyServer;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialBorrowMoneyFlow;
import com.qtjf.common.bean.QtFinancialBorrowMoneyInstalment;
import com.qtjf.common.bean.QtFinancialProductInstalment;
import com.qtjf.common.bean.QtFinancialProductInstalmentPostpone;
import com.qtjf.common.emus.borrowStatus;

@Service
@Transactional
public class BorrowMoneyServerImpl implements BorrowMoneyServer {

	@Autowired
	QtFinancialBorrowMoneyMapper bmdao;

	@Autowired
	QtFinancialBorrowMoneyFlowMapper bmfdao;

	@Autowired
	QtFinancialBorrowMoneyInstalmentMapper bmidao;

	@Autowired
	QtFinancialProductInstalmentMapper pidao;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 24h:mm:ss");

	@Override
	public synchronized void add(QtFinancialBorrowMoney bm) throws Exception {
		bm.setId(UUID.randomUUID().toString());
		bm.setStatus(borrowStatus.BORROW_APPLY.getStatus());
		bm.setCreatedAt(new Date().getTime());
		bm.setApplyAt(new Date().getTime());
		bmdao.insert(bm);

		// 增加借款流程分期计划
		QtFinancialProductInstalment instalment = new QtFinancialProductInstalment();
		instalment.setProductId(bm.getProductId());
		List<QtFinancialProductInstalment> pis = pidao.selectAll(instalment);
		QtFinancialBorrowMoneyInstalment bmi = null;
		for (QtFinancialProductInstalment pi : pis) {
			bmi = new QtFinancialBorrowMoneyInstalment();
			bmi.setId(pi.getId());
			bmi.setBorrowmoneyId(bm.getId());
			bmi.setAmount(pi.getAmount());
			bmi.setOverdueAmount(pi.getOverdueAmount());
			bmi.setRepayAt(pi.getRepayAt());
			bmi.setStatus(borrowStatus.INSTALMENT_RUN.getStatus());
			bmidao.insert(bmi);
		}

		// 新增一条流程进度记录
		QtFinancialBorrowMoneyFlow bmf = newQtFinancialBorrowMoneyFlow(bm.getId(),
				borrowStatus.BORROW_APPLY.getStatus(), borrowStatus.BORROW_APPLY.getMsg());
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

	@Override
	public void cancelBorrowMoney(String id) throws Exception {
		QtFinancialBorrowMoney bm = new QtFinancialBorrowMoney();
		bm.setId(id);
		bm.setStatus(borrowStatus.BORROW_CANCEL.getStatus());
		update(bm);

		// 新增一条流程进度记录
		QtFinancialBorrowMoneyFlow bmf = newQtFinancialBorrowMoneyFlow(bm.getId(),
				borrowStatus.BORROW_CANCEL.getStatus(),borrowStatus.BORROW_CANCEL.getMsg());
		bmfdao.insert(bmf);

		// 关闭借款流程分期计划
		QtFinancialBorrowMoneyInstalment instalment = new QtFinancialBorrowMoneyInstalment();
		instalment.setBorrowmoneyId(id);
		List<QtFinancialBorrowMoneyInstalment> pis = bmidao.selectAll(instalment);
		QtFinancialBorrowMoneyInstalment bmi = null;
		for (QtFinancialBorrowMoneyInstalment pi : pis) {
			bmi = new QtFinancialBorrowMoneyInstalment();
			bmi.setId(pi.getId());
			bmi.setStatus(borrowStatus.INSTALMENT_CLOSE.getStatus());
			bmidao.updateByPrimaryKey(bmi);
		}

	}

	private QtFinancialBorrowMoneyFlow newQtFinancialBorrowMoneyFlow(String bid, String status, String comment) {
		QtFinancialBorrowMoneyFlow bmf = new QtFinancialBorrowMoneyFlow();
		bmf.setId(UUID.randomUUID().toString());
		bmf.setUpdatedat(new Date());
		bmf.setBorrowId(bid);
		bmf.setStatus(status);
		bmf.setComment(comment);
		return bmf;
	}

	@Override
	public void immediatelyBorrowMoney(String id, String instalmentId, String amount) {
		// 修改分期计划状态
		QtFinancialBorrowMoneyInstalment bmi = new QtFinancialBorrowMoneyInstalment();
		bmi.setId(instalmentId);
		bmi.setStatus(borrowStatus.INSTALMENT_AHEAD.getStatus());
		// 新增一条流程进度记录
		String msg = borrowStatus.INSTALMENT_AHEAD.getMsg();
		msg = msg.replaceAll("%s", amount);
		msg = msg.replaceAll("%date",sdf.format(new Date()));
		QtFinancialBorrowMoneyFlow bmf = newQtFinancialBorrowMoneyFlow(id,
				borrowStatus.INSTALMENT_AHEAD.getStatus(), msg);
		bmfdao.insert(bmf);
		// 判断借钱流程是否结束
		QtFinancialBorrowMoneyInstalment param = new QtFinancialBorrowMoneyInstalment();
		param.setBorrowmoneyId(id);
		List<QtFinancialBorrowMoneyInstalment> instalmentList = bmidao.selectRunAll(param);
		if(Objects.isNull(instalmentList)){
			QtFinancialBorrowMoney bm = new QtFinancialBorrowMoney();
			bm.setId(id);
			bm.setStatus(borrowStatus.BORROW_FINISH.getStatus());
			bmdao.updateByPrimaryKey(bm);
		}
	}

	@Override
	public QtFinancialProductInstalmentPostpone getApplyPostponeInfo(String instalmentId) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
