package com.qtjf.appserver.server.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.appserver.dao.QtFinacialProductMapper;
import com.qtjf.appserver.server.ProductServer;
import com.qtjf.common.bean.QtFinacialProduct;

@Service
public class ProductServerImpl implements ProductServer {
	
	@Autowired
	QtFinacialProductMapper qtFinacialProductMapper;
	
	@Override
	public List<QtFinacialProduct> getProducts(String userId) {
		return qtFinacialProductMapper.selectAll();
	}

}
