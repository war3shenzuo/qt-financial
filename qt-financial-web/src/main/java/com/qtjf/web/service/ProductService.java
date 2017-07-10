package com.qtjf.web.service;

import java.util.Map;

public interface ProductService {
	
	//分页查找产品
	Map<String,Object> selectAllByPage(Map<String,Object> paramMap);
}
