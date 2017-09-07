package com.qtjf.web.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialBorrowMoneyFlow;
import com.qtjf.common.emus.borrowStatus;
import com.qtjf.web.mapper.QtFinancialBorrowMoneyFlowMapper;
import com.qtjf.web.mapper.QtFinancialBorrowMoneyMapper;
import com.qtjf.web.service.BorrowService;
import com.qtjf.web.util.StringUtil;
import com.qtjf.web.util.ThreadUtil;

@Service
public class BorrowServiceImpl implements BorrowService {
	
	@Autowired
	private QtFinancialBorrowMoneyMapper qtFinancialBorrowMoneyMapper;
	
	@Autowired
	private QtFinancialBorrowMoneyFlowMapper qtFinancialBorrowMoneyFlowMapper;

	@Override
	public Map<String, Object> getBorrows(QtFinancialBorrowMoney qm) {
		Map<String,Object> map = new HashMap<>();
		try{
			List<QtFinancialBorrowMoney> list = qtFinancialBorrowMoneyMapper.selectAll(qm);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			map.put(StringUtil.responseObjList, list);
		} catch(Exception e){
			map.put(StringUtil.responseCode, StringUtil.resposeError);
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> updateBorrows(QtFinancialBorrowMoney qm) {
		Map<String,Object> map = new HashMap<>();
		try{
			qtFinancialBorrowMoneyMapper.updateByPrimaryKey(qm);
			
			ThreadUtil.execute(new Runnable() {
				@Override
				public void run() {
					QtFinancialBorrowMoneyFlow qbf = new QtFinancialBorrowMoneyFlow();
					qbf.setId(UUID.randomUUID().toString());
					qbf.setBorrowId(qm.getId());
					qbf.setUpdatedAt(new Date());
					qbf.setStatus(qm.getStatus());
					qbf.setComment(borrowStatus.getByStatus(qm.getStatus()).getMsg());
					qtFinancialBorrowMoneyFlowMapper.insert(qbf);
				}
			});
			
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch(Exception e){
			map.put(StringUtil.responseCode, StringUtil.resposeError);
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> selectManageAll(Map<String, Object> paramMap) {
		Map<String,Object> map = new HashMap<>();
		try{
			List<QtFinancialBorrowMoney> list = qtFinancialBorrowMoneyMapper.selectManageAll(paramMap);
			int count = qtFinancialBorrowMoneyMapper.selectAllByPageCount(paramMap);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			map.put(StringUtil.pageData, list);
			map.put(StringUtil.pageCount, count);
		} catch(Exception e){
			map.put(StringUtil.responseCode, StringUtil.resposeError);
			e.printStackTrace();
		}
		return map;
	}

}
