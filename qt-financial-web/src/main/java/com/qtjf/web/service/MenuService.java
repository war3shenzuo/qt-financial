package com.qtjf.web.service;

import java.util.Map;

public interface MenuService {
	
	//根据登入用户选择菜单
	Map<String,Object> getMenuByUserId(Integer id);
}
