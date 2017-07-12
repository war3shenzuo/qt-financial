package com.qtjf.web.service;

import java.util.Map;

public interface UserService {
	
	//分页查找客户
	Map<String,Object> selectAllByPage(Map<String,Object> paramMap);
}
