package com.qtjf.appserver.server;

import java.util.List;

import com.qtjf.common.bean.QtFinacialProduct;

public interface ProductServer {

	List<QtFinacialProduct> getProducts(String userId) throws Exception;

}
