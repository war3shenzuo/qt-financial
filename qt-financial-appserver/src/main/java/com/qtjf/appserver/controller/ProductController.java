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
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public ResultCode getProducts() {
		ResultCode result = null;
		try {
			List<QtFinacialProduct> list = productserver.getProducts("");
			result = ResultCode.getSuccess("获取所有产品成功", list.size(), list);
		} catch (Exception e) {
			result = ResultCode.getFail("获取所有产品失败");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取所有产品及用户信息(次数，是否可以申请)
	 * @param userId 用户Id
	 * @return 产品集合
	 */
	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	public ResultCode getProducts(String userId) {
		System.out.println("userId=" + userId);
		ResultCode result = null;
		try {
			List<QtFinacialProduct> list = productserver.getProducts(userId);
			result = ResultCode.getSuccess("获取用户产品成功", list.size(), list);
		} catch (Exception e) {
			result = ResultCode.getFail("获取用户产品失败");
			e.printStackTrace();
		}
		return result;
	}

}
