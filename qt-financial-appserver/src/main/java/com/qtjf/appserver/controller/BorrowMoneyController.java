package com.qtjf.appserver.controller;


import java.util.List;

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
	
	
	/**
	 * 新增申请借款
	 * @return
	 */
	@RequestMapping(value = "/user/{userId}", method = RequestMethod.GET)
	public ResultCode getBorrowMoneys(@PathVariable("userId") String userId) {
		ResultCode result = null;
		try {
			List<QtFinancialBorrowMoney> list =  borrowMoneytserver.getBorrowMoneys(userId);
			result = ResultCode.getSuccess("获取用户产品成功", list.size(), list);
		} catch (Exception e) {
			result = ResultCode.getSuccess("获取用户产品失败");
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
			result = ResultCode.getFail("修改订单状态失败");
			e.printStackTrace();
		}
		return result;
	}
	
	



}
