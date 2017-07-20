package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinancialUserLevel;

public interface UserService {
	
	//分页查找客户
	Map<String,Object> selectAllByPage(Map<String,Object> paramMap);
	
	//客户升级策略
	Map<String,Object> getUserLevels();

	//获取客户登记
	Map<String, Object> getUserLevelInfo(Integer id);

	//编辑客户升级策略
	Map<String, Object> editUserLevel(QtFinancialUserLevel qul);
}
