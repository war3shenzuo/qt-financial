package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinacialProduct;

public interface ProductService {
	
	//分页查找产品
	Map<String,Object> selectAllByPage(Map<String,Object> paramMap);
	
	//添加产品
	Map<String,Object> addProduct(QtFinacialProduct qp);
	
}
