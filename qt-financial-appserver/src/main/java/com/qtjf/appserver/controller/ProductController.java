package com.qtjf.appserver.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.ProductServer;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.vo.ResultCode;

/**
 * 产品Controller类
 * @author 史贤杰
 * 2017/07/01
 */
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
	public ResultCode getProducts( HttpServletResponse resp) {
		
		ResultCode result = null;
		try {
			List<QtFinacialProduct> list = productserver.getProducts("");
			result = ResultCode.getSuccess("获取所有产品成功", list);
			
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
	@RequestMapping(value = "/user/{userId}", method = RequestMethod.GET)
	public ResultCode getProducts(@PathVariable("userId") String userId) {
		ResultCode result = null;
		try {
			List<QtFinacialProduct> list = productserver.getProducts(userId);
			result = ResultCode.getSuccess("获取用户产品成功", list);
		} catch (Exception e) {
			result = ResultCode.getFail("获取用户产品失败");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取产品详情
	 * @param id 产品ID
	 * @return 产品详情
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResultCode getProduct(@PathVariable("id") String id) {
		ResultCode result = null;
		try {
			QtFinacialProduct product = productserver.getProduct(id);
			result = ResultCode.getSuccess("获取产品详情成功", product);
		} catch (Exception e) {
			result = ResultCode.getFail("获取产品详情失败");
			e.printStackTrace();
		}
		return result;
	}

}
