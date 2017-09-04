package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinanicalEdition;
import com.qtjf.web.mapper.QtFinanicalEditionMapper;
import com.qtjf.web.service.SysService;
import com.qtjf.web.util.StringUtil;

@Service
public class SysServiceImpl implements SysService {
	
	@Autowired
	private QtFinanicalEditionMapper qtFinanicalEditionMapper;

	@Override
	public Map<String, Object> getEditions() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinanicalEdition> list = qtFinanicalEditionMapper.selectAll();
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getEdition(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinanicalEdition obj = qtFinanicalEditionMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseObj, obj);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> saveEdition(QtFinanicalEdition qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinanicalEditionMapper.insert(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editEdition(QtFinanicalEdition qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinanicalEditionMapper.updateByPrimaryKey(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteEdition(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinanicalEditionMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}


}
