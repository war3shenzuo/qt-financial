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
import com.qtjf.web.mapper.QtFinancialBorrowMoneyFlowMapper;
import com.qtjf.web.mapper.QtFinancialBorrowMoneyMapper;
import com.qtjf.web.service.BorrowService;
import com.qtjf.web.util.StringUtil;
import com.qtjf.web.util.ThreadUtil;
import com.qtjf.web.vo.QtFinancialBorrowMoneyAndUser;

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
			List<QtFinancialBorrowMoneyAndUser> list = qtFinancialBorrowMoneyMapper.selectAllAndUser(qm);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			map.put(StringUtil.responseObjList, list);
		} catch(Exception e){
			map.put(StringUtil.responseCode, StringUtil.resposeError);
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> updateBorrows(String id, String type,String comment) {
		Map<String,Object> map = new HashMap<>();
		try{
			QtFinancialBorrowMoney qm = new QtFinancialBorrowMoney();
			qm.setId(id);
			qm.setStatus(type);
			qtFinancialBorrowMoneyMapper.updateByPrimaryKey(qm);
			
			ThreadUtil.execute(new Runnable() {
				@Override
				public void run() {
					QtFinancialBorrowMoneyFlow qbf = new QtFinancialBorrowMoneyFlow();
					qbf.setId(UUID.randomUUID().toString());
					qbf.setBorrowId(id);
					qbf.setUpdatedAt(new Date());
					qbf.setStatus(type);
					qbf.setComment(comment);
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
			List<QtFinancialBorrowMoneyAndUser> list = qtFinancialBorrowMoneyMapper.selectManageAll(paramMap);
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

	@Override
	public Map<String, Object> getBorrowInfo(String id) {
		Map<String,Object> map = new HashMap<>();
		try{
			QtFinancialBorrowMoneyAndUser obj = qtFinancialBorrowMoneyMapper.selectBorrowInfo(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			map.put(StringUtil.responseObj, obj);
		} catch(Exception e){
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

}
