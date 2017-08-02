package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinancialGroup;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.bean.QtFinancialUserLevel;
import com.qtjf.web.mapper.QtFinancialGroupMapper;
import com.qtjf.web.mapper.QtFinancialUserLevelMapper;
import com.qtjf.web.mapper.QtFinancialUserMapper;
import com.qtjf.web.service.UserService;
import com.qtjf.web.util.StringUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private QtFinancialUserMapper qtFinancialUserMapper;
	
	@Autowired
	private QtFinancialUserLevelMapper qtFinancialUserLevelMapper;
	
	@Autowired
	private QtFinancialGroupMapper qtFinancialGroupMapper;

	@Override
	public Map<String, Object> selectAllByPage(Map<String, Object> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialUser> list = qtFinancialUserMapper.selectAllByPage(paramMap);
			int count = qtFinancialUserMapper.selectAllByPageCount(paramMap);
			map.put(StringUtil.pageData, list);
			map.put(StringUtil.pageCount, count);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getUserLevels() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialUserLevel> list = qtFinancialUserLevelMapper.selectAll();
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getUserLevelInfo(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinancialUserLevel obj = qtFinancialUserLevelMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseObj, obj);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editUserLevel(QtFinancialUserLevel qul) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialUserLevelMapper.updateByPrimaryKey(qul);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getGroups() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialGroup> list = qtFinancialGroupMapper.selectAll();
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			map.put(StringUtil.responseObjList, list);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getGroup(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinancialGroup obj = qtFinancialGroupMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			map.put(StringUtil.responseObj, obj);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editGroup(QtFinancialGroup record) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialGroupMapper.updateByPrimaryKey(record);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteGroup(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialGroupMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> saveGroup(QtFinancialGroup record) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialGroupMapper.insert(record);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

}
