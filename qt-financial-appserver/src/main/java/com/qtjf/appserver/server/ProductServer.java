package com.qtjf.appserver.server;

import java.util.List;

import com.qtjf.common.bean.QtFinacialProduct;

public interface ProductServer {
	
	List<QtFinacialProduct> getProducts(String userId) throws Exception;
	
	/**
	 *  获取产品详情
	 * @param id 订单ID
	 * @return
	 * @throws Exception 
	 */
	QtFinacialProduct getProduct(String id) throws Exception;

}
