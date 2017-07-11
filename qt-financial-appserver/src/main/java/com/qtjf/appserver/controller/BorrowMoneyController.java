package com.qtjf.appserver.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.BorrowMoneyServer;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.vo.ResultCode;


/**
 * 消费产品Controller类
 * @author 史贤杰
 * 2017/07/01
 */
@RestController
@RequestMapping("/borrowmoney")
public class BorrowMoneyController {
	
	@Autowired
	BorrowMoneyServer borrowMoneytserver;
	
    private final  Logger logger = LoggerFactory.getLogger(this.getClass());  

	/**
	 * 获取用户所有订单
	 * @return
	 */
	@RequestMapping(value = "/user/{userId}", method = RequestMethod.GET)
	public ResultCode getBorrowMoneys(@PathVariable("userId") String userId) {
		ResultCode result = null;
		try {
			List<QtFinancialBorrowMoney> list =  borrowMoneytserver.getBorrowMoneys(userId);
			result = ResultCode.getSuccess("获取用户订单成功", list);
		} catch (Exception e) {
			logger.error("获取用户订单失败",e);
			result = ResultCode.getSuccess("获取用户订单失败");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取借款订单详情
	 * @return
	 */
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResultCode getBorrowMoneysInfo(@PathVariable("id") String id) {
		ResultCode result = null;
		try {
			QtFinancialBorrowMoney bm =  borrowMoneytserver.getBorrowMoneysInfo(id);
			result = ResultCode.getSuccess("获取借款订单详情成功", bm);
		} catch (Exception e) {
			logger.error("获取借款订单详情失败",e);
			result = ResultCode.getSuccess("获取借款订单详情失败");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 新增申请借款
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST)
	public ResultCode add(QtFinancialBorrowMoney bm) {
		ResultCode result = null;
		try {
			borrowMoneytserver.add(bm);
			result = ResultCode.getSuccess("产品购买成功");
		} catch (Exception e) {
			logger.error("产品购买失败",e);
			result = ResultCode.getFail("产品购买失败");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 修改订单状态
	 * @return
	 */
	@RequestMapping( value = "/{id}/status/{status}",method = RequestMethod.PATCH)
	public ResultCode update(@PathVariable("id") String id, @PathVariable("status") String status) {
		ResultCode result = null;
		try {
			borrowMoneytserver.updateStatus(id,status);
			result = ResultCode.getSuccess("修改订单状态成功");
		} catch (Exception e) {
			logger.error("修改订单状态失败",e);
			result = ResultCode.getFail("修改订单状态失败");
			e.printStackTrace();
		}
		return result;
	}
	
	



}
