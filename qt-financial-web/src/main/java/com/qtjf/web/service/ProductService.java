package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.bean.QtFinanicalBanner;
import com.qtjf.web.vo.QtFinacialProductVo;

public interface ProductService {
	
	//分页查找产品
	Map<String,Object> selectAllByPage(Map<String,Object> paramMap);
	
	//获取产品
	Map<String,Object> getProduct(String id);
	
	//添加产品
	Map<String,Object> addProduct(QtFinacialProductVo qp, String[] peoplegrade, String[] borrowgrade);

	//编辑产品
	Map<String,Object> editProduct(QtFinacialProduct qp);
	
	//删除产品
	Map<String,Object> deleteProduct(String id);
	
	//查找banner
	Map<String,Object> getBanner();
	
	//添加banner
	Map<String,Object> addBanner(QtFinanicalBanner qb);
	
	//编辑banner
	Map<String,Object> editBanner(QtFinanicalBanner qb);
	
	//删除banner
	Map<String,Object> deleteBanner(Integer id);



	
	
}
