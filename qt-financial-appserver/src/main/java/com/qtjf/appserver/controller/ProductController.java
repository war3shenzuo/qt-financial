package com.qtjf.appserver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.ProductServer;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.vo.ResultCode;

@RestController
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	ProductServer productserver;
	
	/**
	 * 获取所有产品
	 * @param userId 用户Id
	 * @return 产品集合
	 */
    @RequestMapping(method = RequestMethod.GET)
	public ResultCode getProducts(String userId) {
    		
    		ResultCode result = null;
    		try {
    			List<QtFinacialProduct> list = productserver.getProducts(userId);
    			result = ResultCode.getSuccess("获取产品成功", list.size(), list);
		} catch (Exception e) {
			result = ResultCode.getFail("获取产品失败");
			e.printStackTrace();
		}
		return result;
	}
	
	

}
