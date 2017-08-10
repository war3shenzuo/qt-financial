package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.web.entity.QtFinancialAdminMenu;
import com.qtjf.web.mapper.QtFinancialAdminMenuMapper;
import com.qtjf.web.service.MenuService;
import com.qtjf.web.util.StringUtil;
import com.qtjf.web.vo.MenuVo;
@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private QtFinancialAdminMenuMapper qtFinancialAdminMenuMapper;

	@Override
	public Map<String, Object> getMenuByUserId(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<MenuVo> list = qtFinancialAdminMenuMapper.selectByUserId(id);
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

}
