package com.qtjf.appserver.controller;


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
	 * 购买产品
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
	 * 修改购买产品记录
	 * @return
	 */
	@RequestMapping( value = "/{id}/status/{status}",method = RequestMethod.PUT)
	public ResultCode update(@PathVariable("id") String id, @PathVariable("status") String status) {
		ResultCode result = null;
		try {
			borrowMoneytserver.updateStatus(id,status);
			result = ResultCode.getSuccess("修改记录状态成功");
		} catch (Exception e) {
			result = ResultCode.getFail("修改记录状态失败");
			e.printStackTrace();
		}
		return result;
	}



}
