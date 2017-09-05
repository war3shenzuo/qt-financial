package com.qtjf.appserver.controller;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.BorrowMoneyServer;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialProductInstalmentPostpone;
import com.qtjf.common.emus.SysStatus;
import com.qtjf.common.vo.ResultCode;

/**
 * 消费产品Controller类
 * 
 * @author 史贤杰 2017/07/01
 */
@RestController
@RequestMapping("/borrowmoney")
public class BorrowMoneyController {

	@Autowired
	BorrowMoneyServer borrowMoneytserver;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 获取用户所有订单
	 * @return
	 */
	@RequestMapping(value = "getBorrowMoneys")
	public ResultCode getBorrowMoneys(@NotNull @RequestParam String userId) {
		QtFinancialBorrowMoney bm = new QtFinancialBorrowMoney();
		bm.setUserId(userId);
		List<QtFinancialBorrowMoney> list = borrowMoneytserver.getBorrowMoneys(bm);
		return ResultCode.getSuccess("获取用户订单成功", list);

	}

	/**
	 * 获取借款订单详情
	 * @return
	 */
	@RequestMapping(value = "getBorrowMoneysInfo")
	public ResultCode getBorrowMoneysInfo(@NotNull @RequestParam String id) {
		QtFinancialBorrowMoney bm = borrowMoneytserver.getBorrowMoneysInfo(id);
		return ResultCode.getSuccess("获取借款订单详情成功", bm);
	}

	/**
	 * 新增借款流程
	 * @param bm 借款详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/insetBorrowMoney")
	public ResultCode insetBorrowMoney(QtFinancialBorrowMoney bm) throws Exception {
			borrowMoneytserver.add(bm);
			return  ResultCode.getSuccess("产品购买成功");
	}

	/**
	 * 取消订单
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "cancelBorrowMoney")
	public ResultCode cancelBorrowMoney(String id) throws Exception {
			borrowMoneytserver.cancelBorrowMoney(id);
			return ResultCode.getSuccess("取消成功");
	}

	/**
	 * 提前还款
	 * 
	 * @param id 借款流程Id
	 * @param instalmentId 计划id
	 * @param amount 金额
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "immediatelyBorrowMoney")
	public ResultCode immediatelyBorrowMoney(String id, String instalmentId, String amount) throws Exception {
			borrowMoneytserver.immediatelyBorrowMoney(id, instalmentId, amount);
			return ResultCode.getSuccess("提前还款成功");
	}

	/**
	 * 获取下一期延期信息
	 * @param instalmentId  计划id
	 * @return
	 */
	@RequestMapping(value = "getApplyPostponeInfo")
	public ResultCode getApplyPostponeInfo(String instalmentId) {
			QtFinancialProductInstalmentPostpone postpones = borrowMoneytserver.getApplyPostponeInfo(instalmentId);
			if (postpones != null) {
				return ResultCode.getSuccess("获取下一期延期信息成功", postpones);
			} else {
				logger.error("延期期数已申请完");
				return new ResultCode(SysStatus.NO_DATA.getStatus(), "找到不下一期延期数据");
			}
	}

	/**
	 * 延期申请
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "applePostpone")
	public ResultCode applePostpone(QtFinancialProductInstalmentPostpone postpone, String borrowmoneyId)
			throws Exception {
		borrowMoneytserver.applePostpone(postpone, borrowmoneyId);
		return ResultCode.getSuccess("延期申请成功");
	}
	
	/**
	 * 延期申请
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "deleteBorrowmoney")
	public ResultCode deleteBorrowmoney(@NotNull @RequestParam  String id) throws Exception {
		borrowMoneytserver.deleteBorrowmoney(id);
		return ResultCode.getSuccess("删除订单成功");
	}

}
