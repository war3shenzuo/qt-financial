package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.web.mapper.QtFinancialBorrowMoneyMapper;
import com.qtjf.web.service.BorrowService;
import com.qtjf.web.util.StringUtil;

public class BorrowServiceImpl implements BorrowService {
	
	@Autowired
	private QtFinancialBorrowMoneyMapper qtFinancialBorrowMoneyMapper;

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
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch(Exception e){
			map.put(StringUtil.responseCode, StringUtil.resposeError);
			e.printStackTrace();
		}
		return map;
	}

}
