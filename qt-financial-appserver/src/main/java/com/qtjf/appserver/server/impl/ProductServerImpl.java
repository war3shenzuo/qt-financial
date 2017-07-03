package com.qtjf.appserver.server.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.appserver.dao.QtFinacialProductMapper;
import com.qtjf.appserver.dao.QtFinancialBorrowMoneyMapper;
import com.qtjf.appserver.server.ProductServer;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.bean.QtFinancialBorrowMoney;

@Service
public class ProductServerImpl implements ProductServer {

	@Autowired
	QtFinacialProductMapper qtFinacialProductMapper;
	
	@Autowired
	QtFinancialBorrowMoneyMapper qtFinancialBorrowMoneyMapper;

	@Override
	public List<QtFinacialProduct> getProducts(String userId) {
		
		List<QtFinacialProduct> list = qtFinacialProductMapper.selectAll();
		
		//查询每个产品每个用户成功消费的次数
		for(QtFinacialProduct product : list ){
			QtFinancialBorrowMoney bm = new QtFinancialBorrowMoney();
			bm.setProductId(product.getId());
			bm.setUserId(userId);
			
			product.setSucceeNum(qtFinancialBorrowMoneyMapper.selectAll(bm).size());;
		}
		
		return list;
	}

	@Override
	public QtFinacialProduct getProduct(String id)  throws Exception{

		QtFinacialProduct product = qtFinacialProductMapper.selectByPrimaryKey(id);
		//计算实际到账的钱
		product.setArriveAmount(product.getAmount().subtract(product.getFactorageCost()));
		//计算归还的钱
		product.setRepaymentAmount(product.getAmount().add(product.getManageCost()).add(product.getAuditCost()));
		return product;
	}

}
