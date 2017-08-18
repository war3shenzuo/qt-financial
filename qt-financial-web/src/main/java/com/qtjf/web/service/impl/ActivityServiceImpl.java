package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinancialActivity;
import com.qtjf.web.mapper.QtFinancialActivityMapper;
import com.qtjf.web.service.ActivityService;
import com.qtjf.web.util.StringUtil;

@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	private QtFinancialActivityMapper qtFinancialActivityMapper;

	@Override
	public Map<String, Object> getActivities() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialActivity> list = qtFinancialActivityMapper.selectAll();
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getActivity(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinancialActivity obj = qtFinancialActivityMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseObjList, obj);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> saveActivity(QtFinancialActivity qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialActivityMapper.insert(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editActivity(QtFinancialActivity qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialActivityMapper.updateByPrimaryKey(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteActivity(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialActivityMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

}
